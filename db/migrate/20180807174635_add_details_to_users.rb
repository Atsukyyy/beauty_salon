class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :age, :integer
    add_column :users, :sex, :boolean
    add_column :users, :color, :boolean
    add_column :users, :extension, :boolean
  end
end
