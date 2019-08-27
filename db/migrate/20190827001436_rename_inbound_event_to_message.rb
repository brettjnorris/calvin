class RenameInboundEventToMessage < ActiveRecord::Migration[5.2]
  def change
    rename_table :inbound_events, :messages
  end
end
