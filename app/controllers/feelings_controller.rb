class FeelingsController < ApplicationController
	before_action :set_feeling, only: [:show, :edit, :update, :destroy]
	before_action :authorize_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

	def index
		feelings = Feeling.all

		@feelings = feelings.sort_by {|feeling| feeling.name}
	end

	def show
	end

	def new
		@feeling = Feeling.new
		@plants = Plant.all

		2.times {@feeling.encouraging_plants.build}
		2.times {@feeling.easing_plants.build}
	end

	def create
		@feeling = Feeling.new(name: feeling_params[:name], summary: feeling_params[:summary])
		if @feeling.save
			id_arr = feeling_params[:encouraging_plant_ids].delete_if {|x| x.empty? }
			if !id_arr.empty?
				id_arr.each do |id|
					p = Plant.find(id)
					@feeling.encouraging_plants << p
				end
			end
			id_arr = feeling_params[:easing_plant_ids].delete_if {|x| x.empty? }
			if !id_arr.empty?
				id_arr.each do |id|
					p = Plant.find(id)
					@feeling.easing_plants << p
				end
			end

			@feeling.save

			redirect_to feeling_path(@feeling), notice: "New feeling added!"
		else
			render :new, error: "Uh oh!"
		end

	end

	def edit
		# refactor since its duplicated in 3 other functions
		@plants = Plant.all
		2.times {@feeling.encouraging_plants.build}
		2.times {@feeling.easing_plants.build}
	end

	def update
		if @feeling.update(feeling_params)
			redirect_to @feeling, notice: 'Successfully updated feeling!'
		else
			flash[:error] = "Uh oh!"
			render :edit
		end
	end

	def destroy
		flash[:notice] = "#{@feeling.name} was deleted from database."
		@feeling.destroy
		redirect_to feelings_path
	end

	private
		def set_feeling
			@feeling = Feeling.find(params[:id])
		end

		def feeling_params
			params.require(:feeling).permit(:name, :summary, :id, easing_plant_ids: [], encouraging_plant_ids: [],
				easing_plants_attributes: [
					:name, :summary, :id, :_destroy
				],
				encouraging_plants_attributes: [
					:name, :summary, :id, :_destroy
				]
			)
		end

end
