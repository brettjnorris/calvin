class AddInviteeIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :invitee, index: true
  end
end
