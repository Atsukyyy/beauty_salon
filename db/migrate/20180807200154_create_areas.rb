class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :name_shortened
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
