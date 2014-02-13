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
	belongs_to :user, dependent: :destroy
	has_many :comments
	accepts_nested_attributes_for :comments
end
