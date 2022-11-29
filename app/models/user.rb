require 'hanami/validations'
require 'hanami/controller'

# With Hanami
class User < Hanami::Action
  params do
    required(:first_name)
    required(:age).filled(:int?, included_in?: 18..99)
    required(:birthdate).value(:date)
  end

  def handle(req, *)
    puts req.params.class            # => Signup::Params
    puts req.params.class.superclass # => Hanami::Action::Params

    puts req.params[:first_name]     # => "Luca"
    puts req.params[:age]          # => nil
  end
end
