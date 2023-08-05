class Post < ApplicationRecord
  validates :title, allow_blank: false, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def return_five_recent_comments(post_id)
    post1 = Post.find(post_id)
    post1.comments.order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    update_column(:comments_counter, comments.count)
  end

  def update_likes_counter
    update_column(:likes_counter, likes.count)
  end
end
