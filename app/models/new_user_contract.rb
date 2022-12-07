require 'dry-validation'

# With DryValidations
# gist link to more information https://gist.github.com/gasb150/97fb1a40880d07112fb5d3019e4ff358

# 1. Accessing Configuration
class ApplicationContract < Dry::Validation::Contract
  config.messages.default_locale = :pl
  config.messages.load_paths << 'config/errors.yml'
end

class UserContract < ApplicationContract
end

UserContract.config.messages.default_locale

class NewUserContract < Dry::Validation::Contract
  include ActiveModel::Validations

  # 2. Defining a schema without coercion
  schema do
    required(:email).value(:string)
    required(:age).value(:integer)
  end

  # 3. Defining a rule && #4.explicit message

  rule(:email) do
    key.failure('has invalid format') unless /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.match?(value)
  end

  rule(:age) do
    key.failure('must be 18 or more') if value < 18
  end
end
