class Post < ActiveRecord::Base
	has_many :comments

	# accept the associate comments, as long as they are not blank
	accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes['body'].blank? }
end
