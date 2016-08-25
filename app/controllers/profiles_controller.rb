# frozen_string_literal: true
class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @events = Event.where(user_id: current_user.id)
  end

  private
  # To filter hacking forms
  def user_params
    params.require(:user).permit(:name, :address)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
