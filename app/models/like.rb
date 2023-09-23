# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  post_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  after_create :update_post_likes_counter
  after_destroy :update_post_likes_counter

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
