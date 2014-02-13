class Post < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :user

  accepts_nested_attributes_for :comments
end
