class ItemsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @items = Item.all #SELECT * ITEMS all....，刻意用複數是因為是想抓一坨東西
  end

  def show
      @item = Item.find(params[:id])
  end

  def new
    @item = Item.new #model的
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = '成功新增餐點!'  
    
      redirect_to items_path
    else
      render :new
    end
  end

  
  def destroy
    item = Item.find(params[:id])
    item.destroy #rails送的刪除方法
    redirect_to items_path, notice: '成功刪除餐點'
  end

  private
  def item_params
    params.require(:item).permit(:name, 
                                 :description, 
                                 :price, 
                                 :spec)
  end

  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
    # redirect_to items_path, notice: '找不到！'
  end

end
