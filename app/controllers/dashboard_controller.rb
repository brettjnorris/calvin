class DashboardController < ApplicationController
  def index
    @inbound_events = InboundEvent.all.order(created_at: :desc).limit(10)
  end
end
