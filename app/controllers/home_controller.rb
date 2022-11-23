class HomeController < ApplicationController

  def index
    debugger
    console
    hola = 22
    render plain: "Hola Mundo"
  end
end
