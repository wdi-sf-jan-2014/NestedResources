require 'spec_helper'

describe "Root" do
  describe "GET /" do
    it "should be successful" do
      sign_in_as_a_valid_user
      get root_path
      response.status.should == 200
    end
  end
end
