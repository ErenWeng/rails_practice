class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def logout
    session[:ccc9527] = nil
    redirect_to root_path
  end

  def sign_in
    #查資料庫
    @user = User.find_by(email: user_params[:email],
                        password: user_params[:password])
    if @user
      session[:ccc9527] = @user.email
      redirect_to root_path
    else
      redirect_to sign_in_path
    end
  end

  def sign_up
    @user = User.new
  end

  def registration
    @user = User.new(user_params)
      if @user.save
      #成功
        session[:ccc9527] = @user.email
      #缺登入
        redirect_to root_path
      else
      #失敗
        render :sign_up
        #redirect_to "sign_up"   
      end 
  end

  private
  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation)
  end

end