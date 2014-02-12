# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  link       :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, inverse_of: :post
  
  accepts_nested_attributes_for :comments

  validates :link, :body, presence: {strict: true, message: "Can't be blank silly."}
end
