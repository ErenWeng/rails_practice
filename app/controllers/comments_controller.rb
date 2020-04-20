class CommentsController < ApplicationController
  def create
    #從comment的角度
    # @comment = Comment.new(comment_params)
    # @comment.item_id = params[:item_id]
    # @comment.user_id = current_user.id

    # @comment = current_user.comments.build(comment_params)

    # item的角度建立留言
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params.merge(user: current_user))

    # user_id的角度建立留言
    # @comment = current_user.comment.build(comment_params.merge(item: @item))

    if @comment.save
      # render js: 'alert("留言成功")'
      # redirect_to item_path(params[:item_id]), notice: 'OK'
    else
      render 'items/show'
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
    #merge方法會再合併HASH進去
  end
end