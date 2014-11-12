require 'rails_helper'

RSpec.describe Event, :type => :model do

  it 'checks event_type_ids' do

    event = Event.new
    event.save

    expect(event.errors.messages[:event_type_id]).to_not be nil

    expect(event.persisted?).to eq(false)

  end

  it 'checks relationships' do
    event = FactoryGirl.create(:event)
    open_hour = FactoryGirl.create(:open_hour, event_id: event.id)
    expect(event.open_hours.count).to eq(1)
    expect(OpenHour.last.event_id).to eq(event.id)
  end
end

