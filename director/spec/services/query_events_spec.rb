require 'chronic'

RSpec.describe QueryEvents do

  describe 'missing params' do
    it 'is missing all params' do
      service = QueryEvents.new

      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({})
      
      expect(rslt.success).to eq(false)
      expect(rslt.errors.length).to eq(4)
      expect(rslt.errors[0]).to eq('start_time must be provided')
      expect(rslt.errors[1]).to eq('end_time must be provided')
      expect(rslt.errors[2]).to eq('cost must be provided')
      expect(rslt.errors[3]).to eq('spice must be provided')

    end

    it 'is missing all but start_time' do
      service = QueryEvents.new
      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time_str})

      expect(rslt.success).to eq(false)
      expect(rslt.errors.length).to eq(3)
      expect(rslt.errors[0]).to eq('end_time must be provided')
      expect(rslt.errors[1]).to eq('cost must be provided')
      expect(rslt.errors[2]).to eq('spice must be provided')
    end

    it 'is missing start_time' do
      service = QueryEvents.new
      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({end_time: end_time_str, spice: 4, cost: 3})

      expect(rslt.errors.length).to eq(1)
      expect(rslt.errors[0]).to eq('start_time must be provided')

    end

  end

  describe 'acute hours' do
    it 'falls within acute hours' do
      
      service = QueryEvents.new
      time_start = Chronic.parse('this sunday 08:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start - 1.hour).strftime('%Y-%m-%d %H:%M:%S %z')
      end_time_str   = (time_end + 1.hour).strftime('%Y-%m-%d %H:%M:%S %z')

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3})


      expect(rslt.obj.length).to eq(1)
      expect(rslt.obj[0].general_hours).to eq(false)
    end

    it 'is outside acute hours' do
      service = QueryEvents.new
      
      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')
      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = Chronic.parse('this saturday 11:00AM').strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = Chronic.parse('this saturday 2:00PM').strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3})

      expect(rslt.obj.length).to eq(0)
    end
  end

  describe 'general hours' do
    it 'falls within open hours' do
      service = QueryEvents.new

      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')
      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'), general_hours: true)
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

    it 'is outside open hours' do
      service = QueryEvents.new
      
      time_start = Chronic.parse('this saturday 8:00AM')
      time_end   = Chronic.parse('this saturday 12:00PM')
      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'), general_hours: true)
      open_hour  = FactoryGirl.create(:open_hour,
                                      event_id: event.id,
                                      open_hour: '09:00',
                                      close_hour: '11:00',
                                      day_of_the_week: 'Monday')

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3})

      expect(rslt.obj.length).to eq(0)
    end
  end
  
  describe 'accute and general hours' do
    it 'falls with acute and general hours' do
      
      service = QueryEvents.new

      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')
      event1      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))
      event2      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'), general_hours: true)
      open_hour  = FactoryGirl.create(:open_hour,
                                      event_id: event2.id,
                                      open_hour: '06:00',
                                      close_hour: '15:00',
                                      day_of_the_week: 'Sunday')

      start_time_str = (time_start - 1.hour).strftime('%Y-%m-%d %H:%M:%S %z')
      end_time_str   = (time_end + 1.hour).strftime('%Y-%m-%d %H:%M:%S %z')

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3})

      expect(rslt.obj.length).to eq(2)
      expect(rslt.obj[0].general_hours).to eq(false)

    end
  end

end
