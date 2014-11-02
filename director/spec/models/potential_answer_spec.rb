require 'rails_helper'

RSpec.describe PotentialAnswer, :type => :model do

  it 'checks answer presense' do

    potential_answer = PotentialAnswer.new
    potential_answer.save

    expect(potential_answer.errors.messages[:answer]).to_not be nil

    expect(potential_answer.persisted?).to eq(false)

  end

  it 'checks relationships' do
    pending 'figure out how to create users via spec for creating user_answers'
    #test has_many relationships
    potential_answer = FactoryGirl.create(:potential_answer)
    event_type_answer_weight = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: potential_answer.id)
    expect(potential_answer.event_type_answer_weights.count).to eq(1)
    expect(EventTypeAnswerWeight.last.event_type_id).to eq(potential_answer.id)

    user_answers = FactoryGirl.create(:user_answer, potential_answer_id: potential_answer.id)
    expect(potential_answer.user_answers.count).to eq(1)
    expect(UserAnswer.last.potential_answer_id).to eq(potential_answer.id)
  end

end

