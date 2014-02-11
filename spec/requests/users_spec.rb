require 'spec_helper'

describe "Users" do
  describe "GET /users/sign_in" do
    it "should be successful" do
      get new_user_session_path
      response.status.should be(200)
    end
  end

  
  describe "POST /users/sign_in" do
    it "should be successful" do
      @user = User.create({
        email: 'test@domain.com', 
        password: 'password', 
        password_confirmation: 'password'})

      post_via_redirect user_session_path, 
        'user[email]' => @user.email, 'user[password]' => @user.password

      response.status.should be(200)
    end
  end
end
