require 'test_helper'

class RecommenderTest < ActiveSupport::TestCase
  test "do not save with out first name, last name or descr" do
    recommender = Recommender.new
    assert_not recommender.save, "recommender saved without first name, last name or descr"
  end

end
