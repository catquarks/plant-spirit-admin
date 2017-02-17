module Api
	module V1
		class FeelingsController < ApplicationController
			def index
				render json: Feeling.all
			end

			def show
				render json: Feeling.find(params[:id])
			end
		end
	end
end