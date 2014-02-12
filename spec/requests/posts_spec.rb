require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    context "when signed in" do
      before do
        sign_in_as_a_valid_user

        Post.create({ user: @user, link: 'http://google.com', body: 'Google is cool'})
        Post.create({ user: @user, link: 'http://generalassemb.ly', body: 'General Assembly is a place to learn'})

        get posts_path
      end

      it "should be successful" do
        response.status.should == 200
      end

      it "should show the posts" do
        response.body.should include("http://google.com")
        response.body.should include("Google is cool")
        response.body.should include("http://generalassemb.ly")
        response.body.should include("General Assembly is a place to learn")
      end
    end

    context "when not signed in" do
      it "should redirect to the sign in page" do
        get posts_path

        response.should redirect_to new_user_session_path
      end
    end
  end

  describe "POST /posts" do
    before do
      sign_in_as_a_valid_user
      post posts_path({ post: { link: 'http://google.com', body: 'Google is cool'} })
      follow_redirect!
    end

    it "should be successful" do
      response.status.should == 200
    end

    it "should show the post" do
      response.body.should include("http://google.com")
      response.body.should include("Google is cool")
    end
  end
end
