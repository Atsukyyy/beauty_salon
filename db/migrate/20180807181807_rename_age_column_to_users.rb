class RenameAgeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :age, :birth
  end
end
