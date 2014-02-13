require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "should be successful" do
      get posts_path
      response.status.should == 200
    end

    it "should show the posts" do
      user = User.create(email: "sample@sample.com", password: "12345678", password_confirmation: "12345678")
      user.posts.create(name: "google", link: "http://google.com", body: "Google is cool")
      user.posts.create(name: "GA", link: "http://generalassemb.ly", body: "General Assembly is a place to learn")
      get posts_path
      response.body.should include("sample@sample.com")
      response.body.should include("google")
      response.body.should include("GA")
    end
  end

  describe "POST /posts" do
    before do
      user = User.create(email: "sample@sample.com", password: "12345678", password_confirmation: "12345678")
      post posts_path, post: user.posts.create(name: "google", link: "http://google.com", body: "Google is cool")
      follow_redirect!
    end
    it "should be successful" do
      response.status.should == 200
    end

    it "should show the post" do
      response.body.should include("sample@sample.com")
      response.body.should include("http://google.com")
      response.body.should include("Google is cool")
    end
  end
end
