module Api
	module V1
		class PlantsController < ApplicationController
			protect_from_forgery with: :null_session
			def index
				plants = Plant.all

				if params['q'] && params['type']
					feeling = Feeling.find_by(name: params['q'])

					case params['type']
					when 'easing_plants'
						easing_plants = plants.joins(:current_plant_feelings).where(current_plant_feelings: {current_feeling_id: feeling.id})
						render json: easing_plants
					when 'encouraging_plants'
						encouraging_plants = plants.joins(:future_plant_feelings).where(future_plant_feelings: {future_feeling_id: feeling.id})
						render json: encouraging_plants
					end
				else
					# raise 'No plants were found!'
					render json: plants
				end
			end

			def show
				render json: Plant.find(params[:id])
			end

			def create
				plant = Plant.create(plant_params)
				if plant.save
					render json: plant
				else
					render json: plant.errors, status: 500
				end
			end

			def plant_params
				params.require(:plant).permit(:name, :summary, :image)
			end

		end
	end
end