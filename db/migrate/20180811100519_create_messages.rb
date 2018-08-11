class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :context
      t.integer :user_id
      t.integer :staff_id
      t.integer :room_id

      t.timestamps
    end
  end
end
