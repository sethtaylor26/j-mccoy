require 'rails_helper'

RSpec.describe Event, :type => :model do

  it 'checks event_type_ids' do

    event = Event.new
    event.save

    expect(event.errors.messages[:event_type_id]).to_not be nil

    expect(event.persisted?).to eq(false)

  end

  it 'relationships' do
    event = FactoryGirl.create(:event)
    open_hour = FactoryGirl.create(:open_hour, event_id: event.id)
    expect(event.open_hours.count).to eq(1)
    expect(OpenHour.last.event_id).to eq(event.id)
  end

  it 'day works' do
    expect(day(1, 'Monday', open_hour: '0600')[:open_hour]).to eq('0600')
  end

  it 'general hours' do
    pending 'figure this out'
    date = DateTime.parse('2014-02-04T08:05:06+07:00')

    event = FactoryGirl.create(:event, start_time: date)

    _ = FactoryGirl.create(:open_hour, day(event.id, 'Monday'))
    _ = FactoryGirl.create(:open_hour, day(event.id, 'Tuesday'))
    _ = FactoryGirl.create(:open_hour, day(event.id, 'Wednesday'))

    expect(event.open_hours.count).to eq(3)

    dow = date.strftime('%A')
    expect(dow).to eq('Tuesday')
    hour = date.to_s(:time)
    expect(hour).to eq('08:05')

    rslt1 = Event
      .where("start_time < ?", date + 1.hour)
      .where("end_time > ?", date + 1.hour)
      .joins(:open_hours)
      .where('open_hours.day_of_the_week = ?', dow)
      .where("open_hours.open_hour < #{hour}")
    expect(rslt1.last.start_time).to eq(date)

    another_date = date + 1.day
    another_event = FactoryGirl.create(:event, start_time: another_date)

    rslt2 = Event.where(start_time: another_date)
    expect((rslt1 + rslt2).length).to eq(2)
  end

  def day(event_id, dow, args = {})
    {
      day_of_the_week: dow,
      open_hour: '0800',
      close_hour: '1600',
    }.merge(args)
  end
end

