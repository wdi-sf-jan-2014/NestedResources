class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :post
  belongs_to :user
  
  has_many :comments, as: :commentable, dependent: :destroy
end
