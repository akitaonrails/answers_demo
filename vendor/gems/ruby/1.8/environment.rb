# DO NOT MODIFY THIS FILE
module Bundler
 file = File.expand_path(__FILE__)
 dir = File.dirname(file)

  ENV["PATH"]     = "#{dir}/../../../../bin:#{ENV["PATH"]}"
  ENV["RUBYOPT"]  = "-r#{file} #{ENV["RUBYOPT"]}"

  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/nokogiri-1.4.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/nokogiri-1.4.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/nokogiri-1.4.1/ext")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activesupport-2.3.5/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activesupport-2.3.5/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/builder-2.1.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/builder-2.1.2/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/json_pure-1.2.0/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/json_pure-1.2.0/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/responders-0.4.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/responders-0.4.2/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/cucumber-rails-0.2.4/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/cucumber-rails-0.2.4/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/factory_girl-1.2.3/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/factory_girl-1.2.3/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/devise-0.9.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/devise-0.9.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/will_paginate-2.3.12/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/will_paginate-2.3.12/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-1.0.1/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-1.0.1/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/actionpack-2.3.5/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/actionpack-2.3.5/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/actionmailer-2.3.5/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/actionmailer-2.3.5/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-test-0.5.3/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rack-test-0.5.3/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/webrat-0.7.0/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/webrat-0.7.0/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rake-0.8.7/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rake-0.8.7/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/polyglot-0.2.9/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/polyglot-0.2.9/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/treetop-1.4.3/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/treetop-1.4.3/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/diff-lcs-1.1.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/diff-lcs-1.1.2/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rspec-1.3.0/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rspec-1.3.0/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/warden-0.9.0/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/warden-0.9.0/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rspec-rails-1.3.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rspec-rails-1.3.2/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activerecord-2.3.5/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activerecord-2.3.5/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activeresource-2.3.5/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/activeresource-2.3.5/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rails-2.3.5/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/rails-2.3.5/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/term-ansicolor-1.0.4/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/term-ansicolor-1.0.4/lib")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/cucumber-0.6.2/bin")
  $LOAD_PATH.unshift File.expand_path("#{dir}/gems/cucumber-0.6.2/lib")

  @gemfile = "#{dir}/../../../../Gemfile"

  require "rubygems" unless respond_to?(:gem) # 1.9 already has RubyGems loaded

  @bundled_specs = {}
  @bundled_specs["nokogiri"] = eval(File.read("#{dir}/specifications/nokogiri-1.4.1.gemspec"))
  @bundled_specs["nokogiri"].loaded_from = "#{dir}/specifications/nokogiri-1.4.1.gemspec"
  @bundled_specs["activesupport"] = eval(File.read("#{dir}/specifications/activesupport-2.3.5.gemspec"))
  @bundled_specs["activesupport"].loaded_from = "#{dir}/specifications/activesupport-2.3.5.gemspec"
  @bundled_specs["builder"] = eval(File.read("#{dir}/specifications/builder-2.1.2.gemspec"))
  @bundled_specs["builder"].loaded_from = "#{dir}/specifications/builder-2.1.2.gemspec"
  @bundled_specs["json_pure"] = eval(File.read("#{dir}/specifications/json_pure-1.2.0.gemspec"))
  @bundled_specs["json_pure"].loaded_from = "#{dir}/specifications/json_pure-1.2.0.gemspec"
  @bundled_specs["responders"] = eval(File.read("#{dir}/specifications/responders-0.4.2.gemspec"))
  @bundled_specs["responders"].loaded_from = "#{dir}/specifications/responders-0.4.2.gemspec"
  @bundled_specs["cucumber-rails"] = eval(File.read("#{dir}/specifications/cucumber-rails-0.2.4.gemspec"))
  @bundled_specs["cucumber-rails"].loaded_from = "#{dir}/specifications/cucumber-rails-0.2.4.gemspec"
  @bundled_specs["factory_girl"] = eval(File.read("#{dir}/specifications/factory_girl-1.2.3.gemspec"))
  @bundled_specs["factory_girl"].loaded_from = "#{dir}/specifications/factory_girl-1.2.3.gemspec"
  @bundled_specs["devise"] = eval(File.read("#{dir}/specifications/devise-0.9.1.gemspec"))
  @bundled_specs["devise"].loaded_from = "#{dir}/specifications/devise-0.9.1.gemspec"
  @bundled_specs["will_paginate"] = eval(File.read("#{dir}/specifications/will_paginate-2.3.12.gemspec"))
  @bundled_specs["will_paginate"].loaded_from = "#{dir}/specifications/will_paginate-2.3.12.gemspec"
  @bundled_specs["rack"] = eval(File.read("#{dir}/specifications/rack-1.0.1.gemspec"))
  @bundled_specs["rack"].loaded_from = "#{dir}/specifications/rack-1.0.1.gemspec"
  @bundled_specs["actionpack"] = eval(File.read("#{dir}/specifications/actionpack-2.3.5.gemspec"))
  @bundled_specs["actionpack"].loaded_from = "#{dir}/specifications/actionpack-2.3.5.gemspec"
  @bundled_specs["actionmailer"] = eval(File.read("#{dir}/specifications/actionmailer-2.3.5.gemspec"))
  @bundled_specs["actionmailer"].loaded_from = "#{dir}/specifications/actionmailer-2.3.5.gemspec"
  @bundled_specs["rack-test"] = eval(File.read("#{dir}/specifications/rack-test-0.5.3.gemspec"))
  @bundled_specs["rack-test"].loaded_from = "#{dir}/specifications/rack-test-0.5.3.gemspec"
  @bundled_specs["webrat"] = eval(File.read("#{dir}/specifications/webrat-0.7.0.gemspec"))
  @bundled_specs["webrat"].loaded_from = "#{dir}/specifications/webrat-0.7.0.gemspec"
  @bundled_specs["rake"] = eval(File.read("#{dir}/specifications/rake-0.8.7.gemspec"))
  @bundled_specs["rake"].loaded_from = "#{dir}/specifications/rake-0.8.7.gemspec"
  @bundled_specs["polyglot"] = eval(File.read("#{dir}/specifications/polyglot-0.2.9.gemspec"))
  @bundled_specs["polyglot"].loaded_from = "#{dir}/specifications/polyglot-0.2.9.gemspec"
  @bundled_specs["treetop"] = eval(File.read("#{dir}/specifications/treetop-1.4.3.gemspec"))
  @bundled_specs["treetop"].loaded_from = "#{dir}/specifications/treetop-1.4.3.gemspec"
  @bundled_specs["diff-lcs"] = eval(File.read("#{dir}/specifications/diff-lcs-1.1.2.gemspec"))
  @bundled_specs["diff-lcs"].loaded_from = "#{dir}/specifications/diff-lcs-1.1.2.gemspec"
  @bundled_specs["rspec"] = eval(File.read("#{dir}/specifications/rspec-1.3.0.gemspec"))
  @bundled_specs["rspec"].loaded_from = "#{dir}/specifications/rspec-1.3.0.gemspec"
  @bundled_specs["warden"] = eval(File.read("#{dir}/specifications/warden-0.9.0.gemspec"))
  @bundled_specs["warden"].loaded_from = "#{dir}/specifications/warden-0.9.0.gemspec"
  @bundled_specs["rspec-rails"] = eval(File.read("#{dir}/specifications/rspec-rails-1.3.2.gemspec"))
  @bundled_specs["rspec-rails"].loaded_from = "#{dir}/specifications/rspec-rails-1.3.2.gemspec"
  @bundled_specs["activerecord"] = eval(File.read("#{dir}/specifications/activerecord-2.3.5.gemspec"))
  @bundled_specs["activerecord"].loaded_from = "#{dir}/specifications/activerecord-2.3.5.gemspec"
  @bundled_specs["activeresource"] = eval(File.read("#{dir}/specifications/activeresource-2.3.5.gemspec"))
  @bundled_specs["activeresource"].loaded_from = "#{dir}/specifications/activeresource-2.3.5.gemspec"
  @bundled_specs["rails"] = eval(File.read("#{dir}/specifications/rails-2.3.5.gemspec"))
  @bundled_specs["rails"].loaded_from = "#{dir}/specifications/rails-2.3.5.gemspec"
  @bundled_specs["term-ansicolor"] = eval(File.read("#{dir}/specifications/term-ansicolor-1.0.4.gemspec"))
  @bundled_specs["term-ansicolor"].loaded_from = "#{dir}/specifications/term-ansicolor-1.0.4.gemspec"
  @bundled_specs["cucumber"] = eval(File.read("#{dir}/specifications/cucumber-0.6.2.gemspec"))
  @bundled_specs["cucumber"].loaded_from = "#{dir}/specifications/cucumber-0.6.2.gemspec"

  def self.add_specs_to_loaded_specs
    Gem.loaded_specs.merge! @bundled_specs
  end

  def self.add_specs_to_index
    @bundled_specs.each do |name, spec|
      Gem.source_index.add_spec spec
    end
  end

  add_specs_to_loaded_specs
  add_specs_to_index

  def self.require_env(env = nil)
    context = Class.new do
      def initialize(env) @env = env && env.to_s ; end
      def method_missing(*) ; yield if block_given? ; end
      def only(*env)
        old, @only = @only, _combine_only(env.flatten)
        yield
        @only = old
      end
      def except(*env)
        old, @except = @except, _combine_except(env.flatten)
        yield
        @except = old
      end
      def gem(name, *args)
        opt = args.last.is_a?(Hash) ? args.pop : {}
        only = _combine_only(opt[:only] || opt["only"])
        except = _combine_except(opt[:except] || opt["except"])
        files = opt[:require_as] || opt["require_as"] || name
        files = [files] unless files.respond_to?(:each)

        return unless !only || only.any? {|e| e == @env }
        return if except && except.any? {|e| e == @env }

        if files = opt[:require_as] || opt["require_as"]
          files = Array(files)
          files.each { |f| require f }
        else
          begin
            require name
          rescue LoadError
            # Do nothing
          end
        end
        yield if block_given?
        true
      end
      private
      def _combine_only(only)
        return @only unless only
        only = [only].flatten.compact.uniq.map { |o| o.to_s }
        only &= @only if @only
        only
      end
      def _combine_except(except)
        return @except unless except
        except = [except].flatten.compact.uniq.map { |o| o.to_s }
        except |= @except if @except
        except
      end
    end
    context.new(env && env.to_s).instance_eval(File.read(@gemfile), @gemfile, 1)
  end
end

module Gem
  @loaded_stacks = Hash.new { |h,k| h[k] = [] }

  def source_index.refresh!
    super
    Bundler.add_specs_to_index
  end
end
