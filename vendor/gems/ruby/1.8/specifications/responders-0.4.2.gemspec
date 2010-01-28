# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{responders}
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jos\303\251 Valim"]
  s.date = %q{2010-01-05}
  s.description = %q{A set of Rails 3 responders to dry up your application}
  s.email = %q{contact@plataformatec.com.br}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "MIT-LICENSE", "README.rdoc", "Rakefile", "lib/generators/USAGE", "lib/generators/responders_controller_generator.rb", "lib/generators/responders_install_generator.rb", "lib/generators/templates/controller.rb", "lib/responders.rb", "lib/responders/flash_responder.rb", "lib/responders/http_cache_responder.rb", "lib/responders/version.rb", "test/flash_responder_test.rb", "test/http_cache_responder_test.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/plataformatec/responders}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A set of Rails 3 responders to dry up your application}
  s.test_files = ["test/flash_responder_test.rb", "test/http_cache_responder_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
