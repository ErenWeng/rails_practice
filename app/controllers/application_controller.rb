class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
    # redirect_to items_path, notice: '找不到！'
  end
end
