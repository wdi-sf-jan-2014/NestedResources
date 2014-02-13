class Comment < ActiveRecord::Base

	 belongs_to :user
     belongs_to :commentable, polymorphic: true
     has_many :child_comments, as: :child_commentable

end
