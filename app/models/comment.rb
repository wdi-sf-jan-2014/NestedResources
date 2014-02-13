class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :commentable, polymorphic: true, dependent: :destroy
  has_many :comments, as: :commentable

  def post
	  return @post if defined?(@post)
	  @post = commentable.is_a?(Post) ? commentable : commentable.post
  end

  def author
    user_id.nil? ? "Guest" : User.find(user_id).email
  end

end