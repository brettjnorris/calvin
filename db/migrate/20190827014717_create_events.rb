class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :calendly_uuid
      t.boolean :canceled
      t.jsonb :json

      t.timestamps
    end
  end
end
