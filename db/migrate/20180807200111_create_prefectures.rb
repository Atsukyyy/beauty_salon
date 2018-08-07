class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :name
      t.string :name_shortened
      t.string :slug
      t.integer :region_id

      t.timestamps
    end
  end
end
