class Vote < ActiveRecord::Base
	belongs_to :comment
	belongs_to :post

	def upvote
		self.increment!(:count)
	end
end
