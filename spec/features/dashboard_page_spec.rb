require 'rails_helper'

RSpec.feature "Dashboard Page", type: :feature do
  let!(:message) { create :message }
  let!(:event) { create :event }

  it "shows the latest messages" do
    visit '/'
    expect(page).to have_content('Latest Messages')
    
    messages_list = find('ul.messages')

    expect(messages_list).to have_content(message.event_type_s)
    expect(messages_list).to have_content("Invitee: test (test@example.com)")
    expect(messages_list).to have_content("Event: 30 Minute Meeting")
    expect(messages_list).to have_content("Assigned To: Brett Norris")
  end

  it "shows the upcoming events" do
    visit '/'
    expect(page).to have_content('Upcoming Events')

    events_list = find('ul.events')

    expect(events_list).to have_content(
      "11:30am - Wednesday, August 28, 2019 - 12:00pm - Wednesday, August 28, 2019"
    )
    expect(events_list).to have_content("test (test@example.com)")
  end
end
