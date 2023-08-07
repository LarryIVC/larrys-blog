class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  validates :text, presence: true

  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.update_comments_counter
  end
end
