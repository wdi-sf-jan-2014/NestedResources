require 'spec_helper'

describe "Posts" do
  describe "GET /comments/:id" do
    it "should be successful" do
      sign_in_as_a_valid_user
      Post.create({ 
        user: @user, 
        link: 'http://google.com', 
        body: 'Google is cool',
        comments_attributes: { "0" => { body: 'I am a comment' } }
      })
      get comment_path(Post.last.comments.first)
      response.status.should == 200
    end
  end
end
