class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable, dependent: :destroy
	accepts_nested_attributes_for :comments
end
