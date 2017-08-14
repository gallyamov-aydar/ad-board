class CommentsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]

	def create
		@ad = Ad.find(params[:ad_id])

		@comment = @ad.comments.build(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			respond_to do |format|
        format.js
    	end
		end	
	end

	def edit
		@comment = Comment.find(params[:id])

		@ad = Ad.find(params[:ad_id])
	end

	def update
		@comment = Comment.find(params[:id])	

		if @comment.update(comment_params)
			redirect_to Ad.find(params[:ad_id])
		end
	end

	def destroy
		@ad = Ad.find(params[:id])
		@comment = Comment.find(params[:ad_id])

		if @comment.destroy
			respond_to do |format|
        format.js
    	end
		end	
	end

	private def comment_params
		puts params
		params.require(:comment).permit(:message, :image)
	end
end
