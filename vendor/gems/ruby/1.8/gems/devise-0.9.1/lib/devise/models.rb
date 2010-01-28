module Devise
  module Models
    autoload :Activatable, 'devise/models/activatable'
    autoload :Authenticatable, 'devise/models/authenticatable'
    autoload :Confirmable, 'devise/models/confirmable'
    autoload :Lockable, 'devise/models/lockable'
    autoload :Recoverable, 'devise/models/recoverable'
    autoload :Rememberable, 'devise/models/rememberable'
    autoload :Timeoutable, 'devise/models/timeoutable'
    autoload :Trackable, 'devise/models/trackable'
    autoload :Validatable, 'devise/models/validatable'

    # Creates configuration values for Devise and for the given module.
    #
    #   Devise::Models.config(Devise::Authenticable, :stretches, 10)
    #
    # The line above creates:
    #
    #   1) An accessor called Devise.stretches, which value is used by default;
    #
    #   2) Some class methods for your model Model.stretches and Model.stretches=
    #      which have higher priority than Devise.stretches;
    #
    #   3) And an instance method stretches.
    #
    # To add the class methods you need to have a module ClassMethods defined
    # inside the given class.
    #
    def self.config(mod, *accessors) #:nodoc:
      accessors.each do |accessor|
        mod.class_eval <<-METHOD, __FILE__, __LINE__
          def #{accessor}
            if defined?(@#{accessor})
              @#{accessor}
            elsif superclass.respond_to?(:#{accessor})
              superclass.#{accessor}
            else
              Devise.#{accessor}
            end
          end

          def #{accessor}=(value)
            @#{accessor} = value
          end
        METHOD
      end
    end

    # Include the chosen devise modules in your model:
    #
    #   devise :authenticatable, :confirmable, :recoverable
    #
    # You can also give the following configuration values in a hash: :pepper,
    # :stretches, :confirm_within and :remember_for. Please check your Devise
    # initialiazer for a complete description on those values.
    #
    def devise(*modules)
      raise "You need to give at least one Devise module" if modules.empty?
      options  = modules.extract_options!

      # TODO Remove me
      if modules.delete(:all)
        ActiveSupport::Deprecation.warn "devise :all is deprecated. List your modules instead", caller
        modules += Devise.all
      end

      modules -= Array(options.delete(:except))
      modules  = Devise::ALL & modules.uniq

      Devise.orm_class.included_modules_hook(self, modules) do
        modules.each do |m|
          devise_modules << m.to_sym
          include Devise::Models.const_get(m.to_s.classify)
        end

        options.each { |key, value| send(:"#{key}=", value) }
      end
    end

    # Stores all modules included inside the model, so we are able to verify
    # which routes are needed.
    def devise_modules
      @devise_modules ||= []
    end

    # Find an initialize a record setting an error if it can't be found.
    def find_or_initialize_with_error_by(attribute, value, error=:invalid)
      if value.present?
        conditions = { attribute => value }
        record = find(:first, :conditions => conditions)
      end

      unless record
        record = new

        if value.present?
          record.send(:"#{attribute}=", value)
        else
          error, skip_default = :blank, true
        end

        add_error_on(record, attribute, error, !skip_default)
      end

      record
    end

    # Wraps add error logic in a method that works for different frameworks.
    def add_error_on(record, attribute, error, add_default=true)
      options = add_default ? { :default => error.to_s.gsub("_", " ") } : {}

      begin
        record.errors.add(attribute, error, options)
      rescue ArgumentError
        record.errors.add(attribute, error.to_s.gsub("_", " "))
      end
    end
  end
end