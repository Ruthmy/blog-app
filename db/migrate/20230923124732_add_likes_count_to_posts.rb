class AddLikesCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :likes_counter, :integer
  end
end
