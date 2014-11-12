require 'rails_helper'

RSpec.describe RecommendationType, :type => :model do

  it 'checks rec_type presense' do

    recommendation_type = RecommendationType.new
    recommendation_type.save

    expect(recommendation_type.errors.messages[:rec_type]).to_not be nil
    expect(recommendation_type.errors.messages[:descr]).to_not be nil

    expect(recommendation_type.persisted?).to eq(false)

  end

end

