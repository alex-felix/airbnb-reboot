class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update,:destroy]

  def index
    @events = Event.all
  end
  def show
  end
  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
    redirect_to event_path(@event)
  end
  def edit
  end
  def update
    Event.update(event_params)
    redirect_to event_path(@event)
  end
  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
  # To filter hacking forms
  def event_params
    params.require(:event).permit(:title, :description, :interests, :starts_at, :ends_at, :location_id, :user_id)
e end
  def set_event
    @event = Event.find(params[:id])
  end

end
