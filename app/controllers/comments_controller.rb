class CommentsController < ApplicationController
  def create
    # binding.pry
    # @comment = Comment.new(comment_params)
    @comment = Comment.create(comment_params)
    # redirect_to "/products/#{comment.product.id}"
    # @seller_of_product = @comment.product.seller 
    if @comment.save
      redirect_to product_path(@comment.product.id), notice: 'コメントが送信されました'
    else
      @comments = @comments.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください'
      render :index
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
