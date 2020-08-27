class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @product = Product.find( params[:product_id])
    respond_to do |format|
      format.html { redirect_to product_path(params[:product_id]) }
      format.json
    end
    # if @comment.save
    #   redirect_to product_path(@comment.product.id), notice: 'コメントが送信されました'
    # else
    #   @comments = @comments.includes(:user)
    #   flash.now[:alert] = 'メッセージを入力してください'
    #   render :index
    # end
  end


  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
