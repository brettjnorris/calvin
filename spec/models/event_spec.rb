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

  describe ".upcoming" do
    let(:upcoming_event) { create :event }
    let(:past_event) { create :event }

    before do
      past_event.json["start_time"] = 2.weeks.ago
      past_event.save

      upcoming_event.json["start_time"] = 2.weeks.from_now
      upcoming_event.save
    end

    it "returns only the upcoming events" do
      events = Event.upcoming
      expect(events).to include(upcoming_event)
      expect(events).not_to include(past_event)
    end
  end

  describe "#time_range" do
    it "returns the time range string" do
      expected = "11:30am - Wednesday, August 28, 2019 - 12:00pm - Wednesday, August 28, 2019"
      expect(subject.time_range).to eq(expected)
    end
  end
end
