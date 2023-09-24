# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  name          :string
#  photo         :string
#  bio           :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  posts_counter :integer
#
class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :user_id
  has_many :likes, foreign_key: :user_id

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  # Returns the 3 most recent posts
  def post_recent
    posts.order(created_at: :desc).limit(3)
  end
end