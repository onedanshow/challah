module Challah
  # Used to validate reasonably-email-looking strings.
  #
  # @example Usage
  #     class User < ActiveRecord::Base
  #       validates :email, :presence => true, :email => true
  #     end
  class EmailValidator < ActiveModel::EachValidator
    # Called automatically by ActiveModel validation..
    def validate_each(record, attribute, value)
      unless value =~ EmailValidator.pattern
        record.errors.add(attribute, options[:message] || 'is not a valid email address')
      end
    end

    # A reasonable-email-looking regexp pattern
    def self.pattern
      /\A[A-Z0-9._%a-z\-]+@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/
    end
  end
end
