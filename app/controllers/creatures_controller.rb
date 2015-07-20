class CreaturesController < ApplicationController

	def index
			@creatures = Creature.all
	end

	def show
		@creature = Creature.find(params[:id])
	end

	def new #display form for new record 

		@creature = Creature.new
		
	end

	def create #saves the new record 
		@creature = Creature.new(allowed_params)

		if @creature.save
			redirect_to @creature
		else 
			render 'new'
		end
	end

	def edit #display form for existing record
		@creature = Creature.find(params[:id])
		
	end

	def update #save changes 
		@creature = Creature.find(params[:id])

		if @creature.update_attributes(allowed_params)
			redirect_to @creature
		else 
			render 'new'
		end

	end

	def destroy #deletes the record
		@creature = Creature.find(params[:id])
		@creature.destroy
		redirect_to creatures_path
	end

	private

		def allowed_params
			params.require(:creature).permit(:name, :description)
			
		end

end
