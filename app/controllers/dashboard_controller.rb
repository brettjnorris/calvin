class DashboardController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :desc).limit(10)
  end
end
