require 'chronic'

RSpec.describe QueryEvents do

  it 'works' do
    service = QueryEvents.new
    event = FactoryGirl.create(:event, general_hours: false)
    rslt = service.call({})
    expect(rslt.length).to eq(1)
  end

  describe 'general hours' do
    it 'falls within open hours', focus: true do
      service = QueryEvents.new

      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')
      event      = FactoryGirl.create(:event, start_time: time_start, end_time: time_end, general_hours: true)
      open_hour  = FactoryGirl.create(:open_hour,
                                      event_id: event.id,
                                      open_hour: '08:00',
                                      close_hour: '15:00',
                                      day_of_the_week: 'Sunday')

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3})
      expect(rslt.obj.length).to eq(1)
    end

    it 'falls with acute hours' do
    end

    it 'falls with acute and general hours' do
    end

    it 'is outside hours' do
      service = QueryEvents.new

      date       = Chronic.parse('this sunday 8:00AM')
      event      = FactoryGirl.create(:event, start_time: date, general_hours: true)
      open_hour  = FactoryGirl.create(:open_hour,
                                      event_id: event.id,
                                      open_hour: '09:00',
                                      day_of_the_week: 'Sunday')

      start_time = date.strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time})
      expect(rslt.length).to eq(0)
    end
  end
end
