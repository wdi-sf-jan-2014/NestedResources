require 'spec_helper'

describe "Comments" do
  describe "GET /comments/:id" do
    before do
      sign_in_as_a_valid_user
      Post.create({ 
        user: @user, 
        link: 'http://google.com', 
        body: 'Google is cool',
        comments_attributes: { "0" => { body: 'I am a comment' } }
      })
      get comment_path(Post.last.comments.first)
    end
    it "should be successful" do
      response.status.should == 200
    end
    it "should show the comment" do
      response.body.should include("I am a comment")
    end
  end
end
