class RoomsController < ApplicationController

	def index
    @rooms = Room.all  
	end

	def show
		@event = RoomEvent.new
    @event.room_id = params[:id]
	 	@events = RoomEvent.where(room_id: params[:id]).map do |event|
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
    @room = Room.find(event_params[:room_id])
		@event = RoomEvent.new(event_params)
    @event.user = current_user

		if @event.save
		  redirect_to :back
    else
      redirect_to room_path(@room), flash: { error: @event.errors }
    end  
	end

	def create
		@event = RoomEvent.create(event_params)
	end

	private

	def event_params
		params.require(:room_event).permit(:name, :start_time, :end_time, :description, :room_id)
	end
end