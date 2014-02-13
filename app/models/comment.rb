# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  post_id    :integer
#  comment_id :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: :true
  has_many :comments, as: :commentable, dependent: :destroy
end
