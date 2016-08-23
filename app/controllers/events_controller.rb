# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # TO BE DELETED -----------------------------------------
  skip_before_action :authenticate_user!, only: [:new, :create]
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @current_user = current_user.id
    @event = Event.new(event_params)
    if @event.save
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
    params.require(:event).permit(:title, :description, :interests, :starts_at, :ends_at, :location_id, :user_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
