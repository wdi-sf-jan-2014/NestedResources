# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  link       :string(255)
#

class Post < ActiveRecord::Base
	has_many :comments, as: :commentable, dependent: :destroy
	belongs_to :user
end
