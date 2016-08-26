# frozen_string_literal: true
class ProfilesController < ApplicationController
  # def show
  #   @attend_events = Attendance.where(user_id: current_user.id)
  # end

  # Liens avec ID ouvert à tous
  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      User.update(user_params)
      redirect_to dashboards_path
    else
      render :edit
    end
  end


  private
  # To filter hacking forms
  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :gender,
     :postcode, :city, :phone_number, :date_of_birth, :email, :photo, :photo_cache )
  end
end
