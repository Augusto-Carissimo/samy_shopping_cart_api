class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Event successfully created.'
      redirect_to events_path
    else
      flash.now[:error] = 'Failed to create event.'
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :price, :stock, :description, :thumbnail)
  end
end
