class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  #以前是before_filter


  def index
    @items = Item.all
  end

  def show
    # find_item
    # @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user) #! eager loading
  end

  def new
    @item = Item.new
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

  def edit
    # find_item
    # @item = Item.find(params[:id])
    #如果使用 @item = Item.new會以為要做成全新的物件
  end
  
  def update
    # find_item
    # @item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to items_path, notice: '成功編輯餐點'
    else
      render :edit
    end
  end
  
  def destroy
    # find_item
    # item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: '成功刪除餐點'
  end

  private
  def item_params
    params.require(:item).permit(:name, 
                                 :description, 
                                 :price, 
                                 :spec,
                                 :cover,
                                 :category_id)
  end

  def find_item
    @item = Item.find(params[:id])
    # @item = Item.find_by!(id: params[:id], deleted_at: nil)
    # 如果找不到就是找不到
  end

end
