class InboundEvent < ApplicationRecord
  def event_type_s
    event_type.split(".").join(' ').capitalize
  end
end
