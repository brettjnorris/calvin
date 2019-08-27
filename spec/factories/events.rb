FactoryBot.define do
  factory :event do
    calendly_uuid { "GBPEBWWYHHYQMNSN" }
    canceled { false }
    invitee { build :invitee }
    json do
      JSON.parse('{
        "uuid": "GBPEBWWYHHYQMNSN",
        "assigned_to": [
          "Brett Norris"
        ],
        "extended_assigned_to": [
          {
            "name": "Brett Norris",
            "email": "brettjnorris@gmail.com",
            "primary": true
          }
        ],
        "start_time": "2019-08-28T11:30:00-04:00",
        "start_time_pretty": "11:30am - Wednesday, August 28, 2019",
        "invitee_start_time": "2019-08-28T11:30:00-04:00",
        "invitee_start_time_pretty": "11:30am - Wednesday, August 28, 2019",
        "end_time": "2019-08-28T12:00:00-04:00",
        "end_time_pretty": "12:00pm - Wednesday, August 28, 2019",
        "invitee_end_time": "2019-08-28T12:00:00-04:00",
        "invitee_end_time_pretty": "12:00pm - Wednesday, August 28, 2019",
        "created_at": "2019-08-25T20:26:34-04:00",
        "location": null,
        "canceled": false,
        "canceler_name": null,
        "cancel_reason": null,
        "canceled_at": null
      }')
    end
  end
end
