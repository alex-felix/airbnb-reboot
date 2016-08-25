# frozen_string_literal: true
class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    # @events = Event.all
    @events = Event.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      # marker.infowindow render_to_string(partial: "/events/map_box", locals: { event: event })
    end
  end

  def show
    @event = Event.find(params[:id])
    @hash = Gmaps4rails.build_markers([ @event ]) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      # marker.infowindow render_to_string(partial: "/events/map_box", locals: { event: event })
    end
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

  def event_params
    params.require(:event).permit(:title, :description, :interests, :starts_at_day, :ends_at_day, :user_id, :address, :postcode, :city, :photo, :photo_cache, :starts_at_time, :ends_at_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
