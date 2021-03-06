class CreateSalons < ActiveRecord::Migration[5.2]
  def change
    create_table :salons do |t|
      t.string :name
      t.string :password_digest
      t.string :address
      t.string :url
      t.string :email
      t.string :phone_number
      t.integer :staff_id
      t.integer :area_id

      t.timestamps
    end
  end
end
