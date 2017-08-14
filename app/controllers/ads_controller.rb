class AdsController < ApplicationController
	before_action :authenticate_user!, :except => [:show, :index]

	def index
		@ads = Ad.all

		if params[:search]
			@ads = Ad.joins("INNER JOIN users ON users.id = ads.user_id")
			@ads = @ads.where("ads.name ILIKE ?", "%#{params[:search]}%")
									.or(@ads.where("ads.text ILIKE ?", "%#{params[:search]}%"))
									.or(@ads.where("users.login ILIKE ?", "%#{params[:search]}%"))
									.or(@ads.where("users.address ILIKE ?", "%#{params[:search]}%"))
									.or(@ads.where("users.full_name ILIKE ?", "%#{params[:search]}%"))
		end
	end

	def new
		@ad = Ad.new
	end

	def show
		@ad = Ad.find(params[:id])

		@comment = Comment.new
	end

	def edit
		@ad = Ad.find(params[:id])		
	end

	def update
		@ad = Ad.find(params[:id])	

		if @ad.update(form_params)
			redirect_to @ad
		end
	end

	def destroy
		@ad = Ad.find(params[:id])

		if @ad.destroy
			redirect_to root_path
		end	
	end

	def create	
		@user = User.find(current_user.id)
		@ad = @user.ads.build(form_params)

		if @ad.save
			redirect_to @ad
		end	
	end

	private def form_params
		params.require(:ad).permit(:name, :text, :image)
	end
end