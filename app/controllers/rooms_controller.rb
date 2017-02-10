class RoomsController < ApplicationController

	def index 
	end

	def show
		@event = RoomEvent.new
	 	@events = RoomEvent.all.map do |event|
	  	{
				id: event.id,
				title: event.name,
				start: event.start_time,
				end: event.end_time,
				room_id: event.room_id
       }
	 end
	 respond_to do |format|
	 	format.html {}
	 	format.json {render json: @events}
	 end
	end

	def new
		@event = RoomEvent.new
	end

	def new_event
		@event = RoomEvent.new(event_params)

		@event.start_time = DateTime.parse(event_params[:start_time])
		@event.end_time = DateTime.parse(event_params[:end_time])
		@event.save

		redirect_to :back
	end

	def create
		@event = RoomEvent.create(event_params)
	end

	private

	def event_params
		params.require(:event).permit(:name, :start_time, :end_time, :description)
	end
end