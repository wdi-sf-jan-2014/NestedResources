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

  describe "GET /new" do
    it "should be successful" do
      sign_in_as_a_valid_user
      get new_post_path
      response.status.should == 200
    end
  end

  describe "POST /posts" do
    before do
      sign_in_as_a_valid_user
    end
    context "without a comment" do
      before do
        post posts_path, post: { link: 'http://google.com', body: 'Google is cool'}
      end

      it "should redirect to the post" do
        response.status.should redirect_to post_path(@user.posts.first.id)
      end

      it "should show the post" do
        follow_redirect!
        response.body.should include("http://google.com")
        response.body.should include("Google is cool")
      end
    end
    context "with a nested comment" do
      before do
        post posts_path, post: { 
          link: 'http://google.com',
          body: 'Google is cool',
          comments_attributes: { "0" => { body: 'Commenting like a bauce' } }
        }
      end
      it "should show the post and comment" do
        follow_redirect!
        response.body.should include("http://google.com")
        response.body.should include("Google is cool")
        response.body.should include("Commenting like a bauce")
      end
    end
  end
end
