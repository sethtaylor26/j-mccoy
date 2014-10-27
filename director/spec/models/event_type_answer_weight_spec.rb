require 'rails_helper'

RSpec.describe EventType, :type => :model do

  it 'checks event_type_id' do

    event_type_answer_weight = EventTypeAnswerWeight.new
    event_type_answer_weight.save

    expect(event_type_answer_weight.errors.messages[:event_type_id]).to_not be nil

    expect(event_type_answer_weight.persisted?).to eq(false)

  end

    it 'checks potential_answer_id' do

    event_type_answer_weight = EventTypeAnswerWeight.new
    event_type_answer_weight.save

    expect(event_type_answer_weight.errors.messages[:potential_answer_id]).to_not be nil

    expect(event_type_answer_weight.persisted?).to eq(false)

  end
end

