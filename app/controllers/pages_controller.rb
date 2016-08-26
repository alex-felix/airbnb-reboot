# frozen_string_literal: true
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :index]
  def index
    @events = Event.all
  end
  def home
  end
  def contact
  end
end
