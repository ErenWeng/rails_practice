class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :check_login

  helper_method :current_user

  private
  def check_login
    redirect_to login_path unless current_user
  end

  def current_user
    # 這樣每次使用current_user就可以撈到那個使用者的id(目前是id
    User.find_by(id: session[:ccc9527])
  end

  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
    # redirect_to items_path, notice: '找不到！'
  end
  
end
