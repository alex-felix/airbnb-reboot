# frozen_string_literal: true
class ProfilesController < ApplicationController
  # def show
  #   @events = Event.where(user_id: current_user.id)
  #   @attend_events = Attendance.where(user_id: current_user.id)
  # end

  # Liens avec ID ouvert à tous
  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      current_user.save
      redirect_to dashboards_path
    else
      render :edit
    end
  end


  private
  # To filter hacking forms
  def user_params
    params.require(:user).permit(:name, :address)
  end
end
