# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    Event.update(event_params)
    redirect_to root_path
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  # To filter hacking forms
  def event_params
    params.require(:event).permit(:title, :description, :interests, :starts_at,
      :ends_at, :user_id, :address, :postcode, :city, :photo, :photo_cache)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
