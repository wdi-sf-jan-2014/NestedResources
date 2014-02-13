# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime
#  updated_at :datetime
#  post_id    :integer
#  user_id    :integer
#

class Comment < ActiveRecord::Base

	belongs_to :post
	has_one :user

  validates :comment, presence: {strict: false, message: "Can't be blank silly."}
end
