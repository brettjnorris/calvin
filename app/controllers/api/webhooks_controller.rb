class Api::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    Message.create(
      event_type: params["event"],
      payload: params["payload"]
    )

    head :ok
  end
end
