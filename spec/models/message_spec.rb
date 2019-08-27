require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:subject) { create :message }

  before :each do
    Message.skip_callback(:create, :after, :update_event)
  end

  after :each do
    Message.set_callback(:create, :after, :update_event)
  end

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
  
  describe "#update_event" do
    context "with a valid event and invitee" do
      it "creates a new event record" do
        expect {
          subject.send(:update_event)
        }.to change { Event.count }.by(1)
      end

      it "creates a new invitee record" do
        expect {
          subject.send(:update_event)
        }.to change { Invitee.count }.by(1)
      end
    end
  end
end
