class Post < ApplicationRecord
  validates :title, allow_blank: false, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :comments do
    def with_author_name
      select('comments.*, users.name as author_name')
        .joins(:author)
    end
  end

  has_many :likes

  # after_save :update_comments_counter, :update_likes_counter
  after_create :update_author_posts_counter

  def self.post_comments
    left_outer_joins(:comments)
      .select('posts.id,
          posts.title,
          posts.text as post_text,
          posts.comments_counter,
          posts.likes_counter,
          comments.text')
      .order('posts.created_at DESC')
  end

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

  def update_author_posts_counter
    author.update_posts_counter
  end
end
