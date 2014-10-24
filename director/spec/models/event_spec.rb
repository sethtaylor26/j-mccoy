require 'rails_helper'

RSpec.describe Event, :type => :model do
  it 'shows how to use rspec and factory girl' do
    # building event without saving
    event = FactoryGirl.build(:event)
    expect(event.persisted?).to eq(false)
    event.save!
    expect(event.persisted?).to eq(true)

    # building events with saving
    event = FactoryGirl.create(:event)
    expect(event.persisted?).to eq(true)
  end

  it 'relationships' do
    event = FactoryGirl.create(:event)
    open_hour = FactoryGirl.create(:open_hour)
    expect(event.open_hours.count).to eq(1)
  end

  it 'day works' do
    expect(day(1, 'Monday', open_hour: '0600')[:open_hour]).to eq('0600')
  end

  it 'general hours' do
    date = DateTime.parse('2014-02-04T08:05:06+07:00')

    event = FactoryGirl.create(:event, start_time: date)

    _ = FactoryGirl.create(:open_hour, day(event.id, 'Monday'))
    _ = FactoryGirl.create(:open_hour, day(event.id, 'Tuesday'))
    _ = FactoryGirl.create(:open_hour, day(event.id, 'Wednesday'))

    expect(event.open_hours.count).to eq(3)

    dow = date.strftime('%A')
    expect(dow).to eq('Tuesday')
    hour = date.strftime('%H%I')
    expect(hour).to eq('0808')

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

    debugger
  end

  def day(event_id, dow, args = {})
    {
      day_of_the_week: dow,
      open_hour: '0800',
      close_hour: '1600',
    }.merge(args)
  end
end

