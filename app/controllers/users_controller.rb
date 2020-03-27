class UsersController < ApplicationController

  def login
    # render html: "hi"
  end

  def sign_up
  end

  def registration
    # render html: params[:user]
    user = params[:user]
    
    if user[:password] == user[:password_confirm]
      redirect_to "/login"
      
    else
      redirect_to "/sign_up" 
    end
  end

end