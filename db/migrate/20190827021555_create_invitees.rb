class CreateInvitees < ActiveRecord::Migration[5.2]
  def change
    create_table :invitees do |t|
      t.string :calendly_uuid
      t.string :email
      t.string :name
      t.jsonb :json

      t.timestamps
    end
  end
end
