class RenameExtensionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :extension, :hair_extension
  end
end
