# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  name          :string
#  photo         :string
#  bio           :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  posts_counter :integer          default(0)
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
