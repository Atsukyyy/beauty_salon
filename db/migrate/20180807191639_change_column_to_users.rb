class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :color, :boolean, default: false, null: false
    change_column :users, :hair_extension, :boolean, default: false, null: false
    change_column :users, :last_name, :string, null: false
    change_column :users, :first_name, :string, null: false
    change_column :users, :birth, :date, null: false
    change_column :users, :sex, :integer, null: false
    change_column :users, :password_digest, :string, null: false
    change_column :users, :email, :string, null: false
  end
end
