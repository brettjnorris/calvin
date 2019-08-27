require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:subject) { create :message }

  describe "#event_type_s" do
    it "returns the event type string" do
      expect(subject.event_type_s).to eq("Invitee created")
    end
  end

  describe "#event" do
    it "returns the event payload" do
      event = subject.event
      expect(event["uuid"]).to eq("GBPEBWWYHHYQMNSN")
    end
  end

  describe "#invitee" do
    it "returns the invitee payload" do
      invitee = subject.invitee
      expect(invitee["uuid"]).to eq("CELGSHGWFFNK5G3T")
      expect(invitee["name"]).to eq("test")
    end
  end
end
