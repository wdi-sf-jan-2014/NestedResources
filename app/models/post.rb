# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  link       :string(255)
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy
end
