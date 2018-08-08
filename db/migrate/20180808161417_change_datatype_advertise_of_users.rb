class ChangeDatatypeAdvertiseOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :advertisement, :integer
  end
end
