require 'rails_helper'

RSpec.describe EventType, :type => :model do

  it 'checks day of the week presense' do

    open_hour = OpenHour.new
    open_hour.save

    expect(open_hour.errors.messages[:day_of_the_week]).to_not be nil

    expect(open_hour.persisted?).to eq(false)

  end
end

