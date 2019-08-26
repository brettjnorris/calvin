class CreateInboundEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :inbound_events do |t|
      t.string :event_type
      t.jsonb :payload

      t.timestamps
    end
  end
end
