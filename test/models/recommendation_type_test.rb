require 'test_helper'

class RecommendationTypeTest < ActiveSupport::TestCase
  test "do not save with out rec type or descr" do
    recommendation_type = RecommendationType.new
    assert_not recommendation_type.save, "recommendation saved without recommendation type or descr"
  end
end
