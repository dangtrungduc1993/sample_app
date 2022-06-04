class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])   
  end

  def create
    @user = User.new(name: "Michael Hartl", email: 
      "michael@example.com"
      )
  end
end
