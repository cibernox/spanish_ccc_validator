require "spanish_ccc_validator/version"
require "spanish_ccc_validator/custom_ccc_validator"

module SpanishCccValidator

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def validate_spanish_ccc(*args)
      config = { :message => 'is invalid', :on => :save }
      config.update(args.pop) if args.last.is_a?(Hash)

      validates_each(args, config) do |record, arg, value|
        error_msg = config[:message].is_a?(Proc) ? config[:message].call : config[:message]
        record.errors.add(arg, error_msg) unless CustomCccValidator.validate(value)
      end
    end
  end
end

class ActiveRecord::Base
  include SpanishCccValidator
end
