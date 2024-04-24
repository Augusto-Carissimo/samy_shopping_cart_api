# frozen_string_literal: true

class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Event successfully created.'
    else
      flash.now[:error] = 'Failed to create event.'
    end
    redirect_to items_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :price, :stock, :description, :thumbnail)
  end
end
