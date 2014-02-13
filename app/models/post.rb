class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  accepts_nested_attributes_for :comments

  def author
	user_id.nil? ? "Guest" : User.find(user_id).email
  end

  def comment_count
  	Comment.where(post_id: id).count
  end

end
