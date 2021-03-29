class AddCategoriesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :categories, :syring
  end
end
