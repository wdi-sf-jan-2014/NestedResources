class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic:true
	has_many :opinions, class_name: "Comment",
                            foreign_key: "response_id"
 
    belongs_to :response, class_name: "Comment"

end