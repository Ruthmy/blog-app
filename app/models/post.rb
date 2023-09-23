# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  author_id        :bigint           not null
#  title            :string
#  text             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  comments_counter :integer
#  likes_counter    :integer
#
class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  # validates :title, presence: true
  # validates :text, presence: true

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
