class Event < ApplicationRecord
  belongs_to :invitee

  scope :active, -> { where(canceled: false) }

  def time_range
    [
      json["start_time_pretty"],
      json["end_time_pretty"]
    ].join(' - ')
  end
end
