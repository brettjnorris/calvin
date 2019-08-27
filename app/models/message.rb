class Message < ApplicationRecord
  after_create :update_event

  def event_type_s
    event_type.split(".").join(' ').capitalize
  end

  def event
    payload["event"]
  end

  def invitee
    payload["invitee"]
  end

  private

  def update_event
    return unless invitee

    new_invitee = Invitee.find_or_create_by(calendly_uuid: invitee["uuid"]) do |inv|
      inv.email = invitee["email"]
      inv.name = invitee["name"]
      inv.json = invitee
    end

    return unless event

    Event.find_or_create_by(calendly_uuid: event["uuid"]) do |ev|
      ev.canceled = event["canceled"]
      ev.json = event
      ev.invitee = new_invitee
    end
  end
end
