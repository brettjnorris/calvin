require 'rails_helper'

RSpec.describe "Api::Webhooks", type: :request do
  describe "POST /api/webhooks" do
    let(:request_body) { file_fixture("webhook_request.json").read }
    let(:headers) do
      {
        "Content-Type" => "application/json"
      }
    end

    it "returns a successful response" do
      post "/api/webhooks", params: JSON.parse(request_body)
      expect(response.status).to eq(200)
    end
    
    it "creates a new message record" do
      expect {
        post "/api/webhooks", params: JSON.parse(request_body)
      }.to change { Message.count }.by(1)

      new_message = Message.last

      expect(new_message.event_type).to eq("invitee.created")
    end
  end
end
