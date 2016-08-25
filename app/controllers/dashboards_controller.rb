class DashboardsController < ApplicationController
  def index
    @user = current_user
    @events = Event.where(user_id: current_user.id)
    @attend_events = Attendance.where(user_id: current_user.id)
  end
end
