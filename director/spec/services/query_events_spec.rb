require 'chronic'

RSpec.describe QueryEvents do

  it 'works' do
    service = QueryEvents.new
    event = FactoryGirl.create(:event, general_hours: false)
    rslt = service.call({})
    expect(rslt.length).to eq(1)
  end

  describe 'general hours' do
    it 'falls within hours' do
      service = QueryEvents.new

      date       = Chronic.parse('this sunday 8:00AM')
      event      = FactoryGirl.create(:event, start_time: date, general_hours: true)
      open_hour  = FactoryGirl.create(:open_hour,
                                      event_id: event.id,
                                      open_hour: '08:00',
                                      day_of_the_week: 'Sunday')

      start_time = date.strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time})
      expect(rslt.length).to eq(1)
      expect(rslt.last.id).to eq(event.id)
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
