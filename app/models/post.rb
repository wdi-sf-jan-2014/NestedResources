class Post < ActiveRecord::Base
	has_many :comments, as: :commentable, dependent: :destroy
	belongs_to :user
	validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true
  validates :link, presence: true
  belongs_to :user
  accepts_nested_attributes_for :comments

end
