class CommentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @product, notice: 'Review was successfully created.' }
				format.json { render :show, status: :created, location: @product }
				format.js
			else
				format.html { redirect_to @product, alert: 'Oops! Review could not be saved.' }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		product = @comment.product
		@comment.destroy

		respond_to do |format|
      format.html { redirect_to product }
      format.json { head :no_content }
      format.js
    end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :rating, :user_id)
	end
end
