class ApplicationController < ActionController::Base
  before_action :check_console

  def check_console
    # console if params[:console].present?
  end
end
