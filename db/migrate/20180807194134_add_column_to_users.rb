class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nail, :boolean, null: false, default: false
    add_column :users, :advertisement, :boolean, null: false, default: false
    add_column :users, :hair_type, :integer
    add_column :users, :prefecture_id, :integer
    add_column :users, :area_id, :integer
    add_column :users, :picture, :string
    add_column :users, :hair_style, :integer
    add_column :users, :age, :integer
  end
end
