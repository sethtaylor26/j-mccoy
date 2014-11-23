require 'rails_helper'

RSpec.describe EventType, :type => :model do

  it 'checks event_type_name' do

    event_type = EventType.new
    event_type.save

    expect(event_type.errors.messages[:event_type_name]).to_not be nil

    expect(event_type.persisted?).to eq(false)

  end

  it 'checks relationships' do

    #test has_many relationships
    event_type = FactoryGirl.create(:event_type)
    event_type_answer_weight = FactoryGirl.create(:event_type_answer_weight, event_type_id: event_type.id)
    expect(event_type.event_type_answer_weights.count).to eq(1)
    expect(EventTypeAnswerWeight.last.event_type_id).to eq(event_type.id)

    event = FactoryGirl.create(:event, event_type_id: event_type.id)
    expect(event_type.events.count).to eq(1)
    expect(Event.last.event_type_id).to eq(event_type.id)
  end

end

