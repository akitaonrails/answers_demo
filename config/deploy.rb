# =============================================================================
# Receita de Capistrano 2.x para hospedagem compartilhada Linux
# utilizando estratégia de cópia sem servidor de versionamento
# =============================================================================
# 
# 1. Esta receita é executada na sua maquina local e nao na hospedagem remota
# 
# 2. O Locarails depende da gem Capistrano
# 
# 3. A estrategia de deployment padrao eh Copy, que comprime seu projeto e envia
#    para o servidor via SCP, e la eh descomprimido. Esta opcao funciona em
#    qualquer sistema operacional sem mais nenhuma dependencia, incluindo 
#    Windows
#    
# 4. A opcao -m git ativa a receita via Git que eh um repositorio descentralizado
#    muito eficiente e que garante um deployment ainda mais rapido. Eh necessario
#    que seu projeto local esteja em git e voce precisa do Git instalado na sua
#    maquina
#    
# 5. Ainda nao existe suporte a Subversion
#
#
# Autor: Fabio Akita
# E-mail: fabio.akita@locaweb.com.br
# Locaweb Serviços de Internet S/A 
# Todos os direitos reservados

# correcao temporaria para capistrano 2.5.0
require 'locarails/fix'

# =============================================================================
# CONFIGURE OS VALORES DE ACORDO COM SUA HOSPEDAGEM
# =============================================================================
set :user, "akitaonrails1"
set :domain, "answers.akitaonrails.com"
set :application, "answers"

set :repository, "akitaonrails1@answers.akitaonrails.com:~/repo/answers.git"
set :remote_repo, 'locaweb'
set :branch, 'master'
set :git_repo, "/home/#{user}/repo/#{application}.git"



# =============================================================================
# NAO MEXER DAQUI PARA BAIXO
# =============================================================================
role :web, domain
role :app, domain
role :db,  domain

set :deploy_to, "/home/#{user}/rails_app/#{application}" 
set :public_html, "/home/#{user}/public_html"
set :site_path, "#{public_html}/#{application}"
set :runner, nil
set :use_sudo, false
set :no_release, true

  
set :scm, :git
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
set :remote, user
set :scm_verbose, true

set :copy_exclude, %w(.git/* .svn/* log/* tmp/* .gitignore)
set :keep_releases, 5

ssh_options[:username] = user
ssh_options[:paranoid] = false
# =============================================================================
# TAREFAS - NAO MEXER A MENOS QUE SAIBA O QUE ESTA FAZENDO
# =============================================================================
desc "Garante que o database.yml foi corretamente configurado"
task :before_symlink do
  on_rollback {}
  run "test -d #{release_path}/tmp || mkdir -m 755 #{release_path}/tmp"
  run "test -d #{release_path}/db || mkdir -m 755 #{release_path}/db"
  run "cp #{deploy_to}/etc/database.yml #{release_path}/config/database.yml"
  run "cd #{release_path} && rake db:migrate RAILS_ENV=production"
end

desc "Garante que as configuracoes estao adequadas"
task :before_setup do
  ts = Time.now.strftime("%y%m%d%H%M%S")
  
  # git folder
  run "test -d #{git_repo} || mkdir -p -m 755 #{git_repo}"
  run "test -d #{git_repo}/.git || cd #{git_repo} && git init"
  git_config = File.join(File.dirname(__FILE__), "../.git/config")

  has_git = false
  if File.exists?(git_config) 
    `git remote rm #{remote_repo}` if File.read(git_config) =~ /\[remote\s+\"#{remote_repo}\"\]/
    `git remote add #{remote_repo} #{repository}`
    output = `git branch`.strip
    `git checkout master && git checkout -b #{branch}` if output !~ /#{branch}/
    `git checkout #{branch}` if output !~ /^\*\s+#{branch}/
    `git push #{remote_repo} #{branch}`
    has_git = true
  end
  
  
  run "test -d /home/#{user}/rails_app || mkdir -m 755 /home/#{user}/rails_app"
  run "if [ -d #{deploy_to} ]; then mv #{deploy_to} #{deploy_to}-#{ts}.old ; fi"
  run "test -d #{deploy_to} || mkdir -m 755 #{deploy_to}"
  run "test -d #{deploy_to}/etc || mkdir -m 755 #{deploy_to}/etc"
  run "if [ -d #{site_path} ]; then mv #{site_path} #{site_path}-#{ts}.old ; fi"
  run "if [ -h #{site_path} ]; then mv #{site_path} #{site_path}-#{ts}.old ; fi"
  run "ln -s #{deploy_to}/current/public #{public_html}/#{application}"
  upload File.join(File.dirname(__FILE__), "database.locaweb.yml"), "#{deploy_to}/etc/database.yml"
  upload File.join(File.dirname(__FILE__), "locaweb_backup.rb"), "#{deploy_to}/etc/locaweb_backup.rb"
  upload File.join(File.dirname(__FILE__), "ssh_helper.rb"), "#{deploy_to}/etc/ssh_helper.rb"
  
  
  # ssh keygen
  run "test -f ~/.ssh/id_rsa || ruby #{deploy_to}/etc/ssh_helper.rb /home/#{user}/.ssh/id_rsa #{domain} #{user}"

  unless has_git
    2.times { puts "" }
    puts "==============================================================="
    puts "Rode os seguintes comandos depois de criar seu repositorio Git:"
    puts ""
    puts "  git remote add #{remote_repo} #{repository}"
    puts "  git push #{remote_repo} #{branch}"
    puts "==============================================================="
    2.times { puts "" }
  end
  
end

desc "Prepare the production database before migration"
task :before_cold do
end

namespace :deploy do
  desc "Pede restart ao servidor Passenger"
  task :restart, :roles => :app do
    run "chmod -R 755 #{release_path}"
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end
end

[:start, :stop].each do |t|
    desc "A tarefa #{t} nao eh necessaria num ambiente com Passenger"
    task t, :roles => :app do ; end
end

namespace :log do
  desc "tail production log files" 
  task :tail, :roles => :app do
    run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
      puts  # para uma linha extra 
      puts "#{channel[:host]}: #{data}" 
      break if stream == :err    
    end
  end
end

namespace :db do
  desc "Faz o backup remoto e download do banco de dados MySQL"
  task :backup, :roles => :db do
    backup_rb ||= "#{deploy_to}/etc/locaweb_backup.rb"
    run "if [ -f #{backup_rb} ]; then ruby #{backup_rb} backup #{deploy_to} ; fi"
    get "#{deploy_to}/etc/dump.tar.gz", "dump.tar.gz"
    run "rm #{deploy_to}/etc/dump.tar.gz"
  end
  
  desc "Faz o upload e o restore remoto do banco de dados MySQL"
  task :restore, :roles => :db do
    unless File.exists?("dump.tar.gz")
      puts "Backup dump.tar.gz nao encontrado"
      exit 0
    end
    backup_rb ||= "#{deploy_to}/etc/locaweb_backup.rb"
    upload "dump.tar.gz", "#{deploy_to}/etc/dump.tar.gz"
    run "if [ -f #{backup_rb} ]; then ruby #{backup_rb} restore #{deploy_to} ; fi"
  end
  
  desc "Apaga todas as tabelas do banco de dados [CUIDADO! OPERACAO SEM VOLTA!]"
  task :drop_all, :roles => :db do
    backup_rb ||= "#{deploy_to}/etc/locaweb_backup.rb"
    run "if [ -f #{backup_rb} ]; then ruby #{backup_rb} drop_all #{deploy_to} ; fi"
  end
end

namespace :ssh do
  desc "Faz upload da sua chave publica"
  task :upload_key, :roles => :app do
    public_key_path = File.expand_path("~/.ssh/id_rsa.pub")
    unless File.exists?(public_key_path)
      puts %{
        Chave publica nao encontrada em #{public_key_path}
        Crie sua chave - sem passphrase - com o comando:
          ssh_keygen -t rsa
      }
      exit 0
    end
    ssh_path = "/home/#{user}/.ssh"
    run "test -d #{ssh_path} || mkdir -m 755 #{ssh_path}"
    upload public_key_path, "#{ssh_path}/../id_rsa.pub"
    run "test -f #{ssh_path}/authorized_keys || touch #{ssh_path}/authorized_keys"
    run "cat #{ssh_path}/../id_rsa.pub >> #{ssh_path}/authorized_keys"
    run "chmod 755 #{ssh_path}/authorized_keys"
  end
end

after 'deploy:update_code', 'gems:bundle'

namespace :gems do
  task :bundle, :roles => :app do
    run "cd #{release_path} && gem bundle --cached"
  end
end