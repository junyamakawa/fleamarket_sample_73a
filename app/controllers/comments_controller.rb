class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @product = Product.find(params[:product_id])
    if @comment.save
      respond_to do |format|
        format.html { redirect_to product_path(params[:product_id]) }
        format.json
      end
    else
      @comments = @product.comments.includes(:user)
      respond_to do |format|
        format.html { render :index }
        format.json
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
