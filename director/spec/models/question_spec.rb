require 'rails_helper'

RSpec.describe Question, :type => :model do

  it 'checks question presense' do

    question = Question.new
    question.save

    expect(question.errors.messages[:question_type]).to_not be nil

    expect(question.persisted?).to eq(false)

  end

  it 'checks relationships' do

    #test has_many relationships
    question = FactoryGirl.create(:question)
    potential_answer = FactoryGirl.create(:potential_answer, question_id: question.id)
    expect(question.potential_answers.count).to eq(1)
    expect(PotentialAnswer.last.question_id).to eq(question.id)

  end

end

