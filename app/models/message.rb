class Message < ApplicationRecord
  def event_type_s
    event_type.split(".").join(' ').capitalize
  end

  def event
    payload["event"]
  end

  def invitee
    payload["invitee"]
  end
end
