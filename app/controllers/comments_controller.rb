class CommentsController < ApplicationController
  @comment = Comment.new(comment_params)
  @seller_of_product = @comment.product.seller 
  @comment.save
  redirect_to product_path(@comment.product.id)

  private
  def comment_params
    params.require(:comment).permit(:comment, :product_id).merge(user_id: current_user.id)
  end
end
