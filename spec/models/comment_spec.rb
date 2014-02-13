# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  comment_body :text
#  created_at   :datetime
#  updated_at   :datetime
#  post_id      :integer
#

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
