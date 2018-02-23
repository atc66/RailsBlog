class RenameColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :blogs, :user_ud, :user_id
  end
end
