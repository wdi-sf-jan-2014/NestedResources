class Comment < ActiveRecord::Base
	belongs_to :post
	# has_many :votes
	has_many :comments, as: :commentable, dependent: :destroy

	# def count
	# 	self.increment!(:counter)
	# end
end
