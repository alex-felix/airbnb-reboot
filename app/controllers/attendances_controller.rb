# frozen_string_literal: true
class AttendancesController < ApplicationController
  before_action :set_event, only: [:show, :new ]


  def new
    @attendance = @event.attendances.build
    # @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.event = @event
    if @attendance.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def attendance_params
    params.require(:attendance).permit(:confirmed_at, :event_id, :user_id)
  end

end

