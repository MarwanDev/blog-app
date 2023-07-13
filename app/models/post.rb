class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id', dependent: :destroy
  has_many :comments, foreign_key: 'post_id', dependent: :destroy
  after_save :increment_posts_count

  def most_recent_five_comments
    comments.order(created_at, :desc).limit(5)
  end

  private

  def increment_posts_count
    author.increment!(:postsCounter)
  end
end
