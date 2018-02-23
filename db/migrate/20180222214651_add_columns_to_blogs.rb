class AddColumnsToBlogs < ActiveRecord::Migration[5.1]
  def change
  	add_column :blogs, :user_ud, :integer
  end
end
