require 'rails_helper'

RSpec.describe UserAnswer, :type => :model do

  it 'checks presence' do

    user_answer = UserAnswer.new
    user_answer.save

    expect(user_answer.errors.messages[:user_id]).to_not be nil
    expect(user_answer.errors.messages[:potential_answer_id]).to_not be nil

    expect(user_answer.persisted?).to eq(false)

  end

end

