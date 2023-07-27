class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def self.return_three_recent_posts(user_id)
    user1 = User.find(user_id)
    user1.posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update_column(:post_counter, posts.count)
  end
end
