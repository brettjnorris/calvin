require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:subject) { create :event }

  describe ".active" do
    let(:active_event) { create :event, canceled: false }
    let(:canceled_event) { create :event, canceled: true }

    it "returns only the active events" do
      events = Event.active
      expect(events).to include(active_event)
      expect(events).not_to include(canceled_event)
    end
  end

  describe "#time_range" do
    it "returns the time range string" do
      expected = "11:30am - Wednesday, August 28, 2019 - 12:00pm - Wednesday, August 28, 2019"
      expect(subject.time_range).to eq(expected)
    end
  end
end
