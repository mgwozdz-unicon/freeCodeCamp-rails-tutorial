class HomeController < ApplicationController
  def index
  end

  def about
    @about_me = "My name is Mary Gwozdz..." #instance variable as opposed to a local variable

    @answer = 2 + 2

  end
end
