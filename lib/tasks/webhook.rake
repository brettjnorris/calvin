namespace :webhook do
  desc "Register Webhook"
  task :register => :environment do
    # return if Rails.env.development?

    request_body = {
      url: ENV["APP_HOST"] + "/api/webhooks",
      events: [
        "invitee.created",
        "invitee.canceled"
      ]
    }

    headers = {
      "X-TOKEN" => ENV['CALENDLY_INTEGRATION_TOKEN']
    }

    response = HTTParty.post 'https://calendly.com/api/v1/hooks',
                             body: request_body,
                             headers: headers

    puts JSON.parse(response.body)["message"]
  end
end
