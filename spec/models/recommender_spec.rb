require 'rails_helper'

RSpec.describe Recommender, :type => :model do

  it 'checks presense' do

    recommender = Recommender.new
    recommender.save

    expect(recommender.errors.messages[:first_name]).to_not be nil
    expect(recommender.errors.messages[:last_name]).to_not be nil
    expect(recommender.errors.messages[:descr]).to_not be nil

    expect(recommender.persisted?).to eq(false)

  end

  it 'checks relationships' do

    #test has_many relationships
    recommender = FactoryGirl.create(:recommender)
    event = FactoryGirl.create(:event, recommender_id: recommender.id)
    expect(recommender.events.count).to eq(1)
    expect(Event.last.recommender_id).to eq(recommender.id)

  end

end

