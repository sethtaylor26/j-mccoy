require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'checks presense' do
    user = User.new
    user.save

    expect(user.errors.messages[:email]).to_not be nil

    expect(user.persisted?).to eq(false)

  end

  it 'checks relationships' do
    pending 'figure this out'
    #test has_many relationships
    user = FactoryGirl.create(:user)
    user_answer = FactoryGirl.create(:user_answer, user_id: user.id)
    expect(user.user_answers.count).to eq(1)
    expect(UserAnswer.last.user_id).to eq(user.id)

  end

end

