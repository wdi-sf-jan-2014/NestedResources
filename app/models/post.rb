class Post < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  accepts_nested_attributes_for :comments

  def post
  return @post if defined?(@post)
    @post = commentable.is_a?(Post) ? commentable : commentable.post
  end

end
