# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy
	accepts_nested_attributes_for :comments
end
