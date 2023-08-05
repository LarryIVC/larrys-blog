class User < ApplicationRecord
  validates :name, allow_blank: false, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def return_three_recent_posts(user_id)
    user1 = User.find(user_id)
    user1.posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update_column(:post_counter, posts.count)
  end
end
