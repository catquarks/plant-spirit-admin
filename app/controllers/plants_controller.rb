class PlantsController < ApplicationController
	before_action :set_plant, only: [:show, :edit, :update, :destroy]
	before_action :authorize_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

	def index
		plants = Plant.all
		@plants = plants.sort_by {|plant| plant.name}
	end

	def show
	end

	def new
		@plant = Plant.new
		@feelings = Feeling.all

		2.times {@plant.future_feelings.build}
		2.times {@plant.current_feelings.build}
	end

	def create
		@plant = Plant.new(name: plant_params[:name], summary: plant_params[:summary])
		if @plant.save
			id_arr = plant_params[:future_feeling_ids].delete_if {|x| x.empty? }
			if !id_arr.empty?
				id_arr.each do |id|
					f = Feeling.find(id)
					@plant.future_feelings << f
				end
			end
			id_arr = plant_params[:current_feeling_ids].delete_if {|x| x.empty? }
			if !id_arr.empty?
				id_arr.each do |id|
					f = Feeling.find(id)
					@plant.current_feelings << f
				end
			end

			@plant.save

			redirect_to plant_path(@plant), notice: "New plant added!"
		else
			render :new, error: "Uh oh!"
		end

	end

	def edit
		@feelings = Feeling.all

		2.times {@plant.future_feelings.build}
		2.times {@plant.current_feelings.build}
	end

	def update
		if @plant.update(plant_params)
			# record_history("Edited #{@plant} at #{Time.now}")
			redirect_to @plant, notice: 'Successfully updated plant!'
		else
			flash[:error] = "Uh oh!"
			render :edit
		end
	end

	def destroy
		flash[:notice] = "#{@plant.name} was deleted from database."
		# record_history("Deleted #{@plant} at #{Time.now}")
		@plant.destroy
		redirect_to plants_path
	end

	private

		def set_plant
			@plant = Plant.find(params[:id])
		end

		def plant_params
			params.require(:plant)
				.permit(
					:name, :summary, :id,
					future_feeling_ids: [], current_feeling_ids: [],
					future_feelings_attributes: [
						:name, :summary, :id, :_destroy
					],
					current_feelings_attributes: [
						:name, :summary, :id, :_destroy
					]
				)
		end

end
