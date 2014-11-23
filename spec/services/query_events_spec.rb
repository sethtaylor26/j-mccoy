require 'chronic'

RSpec.describe QueryEvents do

  describe 'filter by user preferences' do
    it 'checks that events are returned that match the user event preferences' do

      service = QueryEvents.new

      setup

      start_time_str = (DateTime.now).strftime('%Y-%m-%d %H:%M:%S %z')
      end_time_str   = (DateTime.now+12.hours).strftime('%Y-%m-%d %H:%M:%S %z')

      #Create Events
      event1 = FactoryGirl.create(:event, event_type_id: @et1.id, start_time: start_time_str, end_time: end_time_str)
      event2 = FactoryGirl.create(:event, event_type_id: @et2.id, start_time: start_time_str, end_time: end_time_str)
      event3 = FactoryGirl.create(:event, event_type_id: @et3.id, start_time: start_time_str, end_time: end_time_str)
      event4 = FactoryGirl.create(:event, event_type_id: @et4.id, start_time: start_time_str, end_time: end_time_str)
      event5 = FactoryGirl.create(:event, event_type_id: @et5.id, start_time: start_time_str, end_time: end_time_str)

      #Get some events
      start_time_search = (DateTime.now-12.hours).strftime('%Y-%m-%d %H:%M:%S %z')
      end_time_search = (DateTime.now+24.hours).strftime('%Y-%m-%d %H:%M:%S %z')

      rslt = service.call({start_time: start_time_search, end_time: end_time_search, spice: 4, cost: 3, count: 3}, @user)

      expect(rslt.obj.length).to eq(3)
      expect(rslt.obj[0].id).to eq(1)
      expect(rslt.obj[1].id).to eq(2)
      expect(rslt.obj[2].id).to eq(5)

    end
  end

  describe 'missing params' do
    it 'is missing all params' do
      service = QueryEvents.new

      setup

      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({}, @user)
      
      expect(rslt.success).to eq(false)
      expect(rslt.errors.length).to eq(4)
      expect(rslt.errors[0]).to eq('start_time must be provided')
      expect(rslt.errors[1]).to eq('end_time must be provided')
      expect(rslt.errors[2]).to eq('cost must be provided')
      expect(rslt.errors[3]).to eq('spice must be provided')

    end

    it 'is missing all but start_time' do
      service = QueryEvents.new

      setup

      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time_str}, @user)

      expect(rslt.success).to eq(false)
      expect(rslt.errors.length).to eq(3)
      expect(rslt.errors[0]).to eq('end_time must be provided')
      expect(rslt.errors[1]).to eq('cost must be provided')
      expect(rslt.errors[2]).to eq('spice must be provided')
    end

    it 'is missing start_time' do
      service = QueryEvents.new

      setup

      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start + 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = (time_end - 1.hour).strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({end_time: end_time_str, spice: 4, cost: 3}, @user)

      expect(rslt.errors.length).to eq(1)
      expect(rslt.errors[0]).to eq('start_time must be provided')

    end

  end

  describe 'acute hours' do
    it 'falls within acute hours' do
      
      service = QueryEvents.new

      setup

      time_start = Chronic.parse('this sunday 08:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')

      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = (time_start - 1.hour).strftime('%Y-%m-%d %H:%M:%S %z')
      end_time_str   = (time_end + 1.hour).strftime('%Y-%m-%d %H:%M:%S %z')

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3, count: 3}, @user)


      expect(rslt.obj.length).to eq(1)
      expect(rslt.obj[0].general_hours).to eq(false)
    end

    it 'is outside acute hours' do
      service = QueryEvents.new

      setup
      
      time_start = Chronic.parse('this sunday 8:00AM')
      time_end   = Chronic.parse('this sunday 12:00PM')
      event      = FactoryGirl.create(:event, start_time: time_start.strftime('%Y-%m-%d %H:%M:%S'), end_time: time_end.strftime('%Y-%m-%d %H:%M:%S'))

      start_time_str = Chronic.parse('this saturday 11:00AM').strftime('%Y-%m-%dT%l:%M:%S%z')
      end_time_str   = Chronic.parse('this saturday 2:00PM').strftime('%Y-%m-%dT%l:%M:%S%z')

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3}, @user)

      expect(rslt.obj.length).to eq(0)
    end
  end

  describe 'general hours' do
    it 'falls within open hours' do
      service = QueryEvents.new

      setup

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

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3, count: 3}, @user)

      expect(rslt.obj.length).to eq(1)
    end

    it 'is outside open hours' do
      service = QueryEvents.new
      
      setup

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

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3}, @user)

      expect(rslt.obj.length).to eq(0)
    end
  end
  
  describe 'accute and general hours' do
    it 'falls with acute and general hours' do
      
      service = QueryEvents.new

      setup

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

      rslt = service.call({start_time: start_time_str, end_time: end_time_str, spice: 4, cost: 3, count: 3}, @user)

      expect(rslt.obj.length).to eq(2)
      expect(rslt.obj[0].general_hours).to eq(false)

    end
  end

  def setup
      #setup data
      #questions
      @question1 = FactoryGirl.create(:question, question: 'Q1')
      @question2 = FactoryGirl.create(:question, question: 'Q2')
      @question3 = FactoryGirl.create(:question, question: 'Q3')
      @question4 = FactoryGirl.create(:question, question: 'Q4')

      #question answers
      @q1a1 = FactoryGirl.create(:potential_answer, question_id: @question1.id, answer: 'Q1A1')
      @q1a2 = FactoryGirl.create(:potential_answer, question_id: @question1.id, answer: 'Q1A2')
      @q2a1 = FactoryGirl.create(:potential_answer, question_id: @question2.id, answer: 'Q2A1')
      @q2a2 = FactoryGirl.create(:potential_answer, question_id: @question2.id, answer: 'Q2A2')
      @q3a1 = FactoryGirl.create(:potential_answer, question_id: @question3.id, answer: 'Q3A1')
      @q3a2 = FactoryGirl.create(:potential_answer, question_id: @question3.id, answer: 'Q3A2')
      @q4a1 = FactoryGirl.create(:potential_answer, question_id: @question4.id, answer: 'Q4A1')
      @q4a2 = FactoryGirl.create(:potential_answer, question_id: @question4.id, answer: 'Q4A2')

      #event types
      @et1 = FactoryGirl.create(:event_type, event_type_name: 'ET1')
      @et2 = FactoryGirl.create(:event_type, event_type_name: 'ET2')
      @et3 = FactoryGirl.create(:event_type, event_type_name: 'ET3')
      @et4 = FactoryGirl.create(:event_type, event_type_name: 'ET4')
      @et5 = FactoryGirl.create(:event_type, event_type_name: 'ET5')
      @et6 = FactoryGirl.create(:event_type, event_type_name: 'ET6')
      @et7 = FactoryGirl.create(:event_type, event_type_name: 'ET7')
      @et8 = FactoryGirl.create(:event_type, event_type_name: 'ET8')
      @et9 = FactoryGirl.create(:event_type, event_type_name: 'ET9')
      @et10 = FactoryGirl.create(:event_type, event_type_name: 'ET10')

      #event types potential answer weights
      #ET1
      @etaw1 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a1.id, event_type_id: @et1.id, weight: 1)
      @etaw2 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a2.id, event_type_id: @et1.id, weight: 2)
      @etaw3 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a1.id, event_type_id: @et1.id, weight: 3)
      @etaw4 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a2.id, event_type_id: @et1.id, weight: 4)
      @etaw5 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a1.id, event_type_id: @et1.id, weight: 5)
      @etaw6 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a2.id, event_type_id: @et1.id, weight: 4)
      @etaw7 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a1.id, event_type_id: @et1.id, weight: 3)
      @etaw8 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a2.id, event_type_id: @et1.id, weight: 2)

      #ET2
      @etaw9 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a1.id, event_type_id: @et2.id, weight: 5)
      @etaw10 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a2.id, event_type_id: @et2.id, weight: 4)
      @etaw11 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a1.id, event_type_id: @et2.id, weight: 3)
      @etaw12 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a2.id, event_type_id: @et2.id, weight: 2)
      @etaw13 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a1.id, event_type_id: @et2.id, weight: 1)
      @etaw14 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a2.id, event_type_id: @et2.id, weight: 2)
      @etaw15 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a1.id, event_type_id: @et2.id, weight: 3)
      @etaw16 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a2.id, event_type_id: @et2.id, weight: 4)

      #ET3
      @etaw17 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a1.id, event_type_id: @et3.id, weight: 3)
      @etaw18 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a2.id, event_type_id: @et3.id, weight: 2)
      @etaw19 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a1.id, event_type_id: @et3.id, weight: 1)
      @etaw20 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a2.id, event_type_id: @et3.id, weight: 2)
      @etaw21 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a1.id, event_type_id: @et3.id, weight: 3)
      @etaw22 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a2.id, event_type_id: @et3.id, weight: 4)
      @etaw23 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a1.id, event_type_id: @et3.id, weight: 5)
      @etaw24 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a2.id, event_type_id: @et3.id, weight: 1)

      #ET4
      @etaw25 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a1.id, event_type_id: @et4.id, weight: 2)
      @etaw26 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a2.id, event_type_id: @et4.id, weight: 1)
      @etaw27 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a1.id, event_type_id: @et4.id, weight: 0)
      @etaw28 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a2.id, event_type_id: @et4.id, weight: 2)
      @etaw29 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a1.id, event_type_id: @et4.id, weight: 4)
      @etaw30 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a2.id, event_type_id: @et4.id, weight: 0)
      @etaw31 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a1.id, event_type_id: @et4.id, weight: 3)
      @etaw32 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a2.id, event_type_id: @et4.id, weight: 1)

      #ET5
      @etaw33 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a1.id, event_type_id: @et5.id, weight: 5)
      @etaw34 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q1a2.id, event_type_id: @et5.id, weight: 3)
      @etaw35 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a1.id, event_type_id: @et5.id, weight: 1)
      @etaw36 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q2a2.id, event_type_id: @et5.id, weight: 2)
      @etaw37 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a1.id, event_type_id: @et5.id, weight: 4)
      @etaw38 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q3a2.id, event_type_id: @et5.id, weight: 5)
      @etaw39 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a1.id, event_type_id: @et5.id, weight: 3)
      @etaw40 = FactoryGirl.create(:event_type_answer_weight, potential_answer_id: @q4a2.id, event_type_id: @et5.id, weight: 1)

      #Create User
      @user = FactoryGirl.create(:user)

      #Create User Answers
      @ua1 = FactoryGirl.create(:user_answer, user_id: @user.id, potential_answer_id: @q1a2.id)
      @ua2 = FactoryGirl.create(:user_answer, user_id: @user.id, potential_answer_id: @q2a1.id)
      @ua3 = FactoryGirl.create(:user_answer, user_id: @user.id, potential_answer_id: @q3a1.id)
      @ua4 = FactoryGirl.create(:user_answer, user_id: @user.id, potential_answer_id: @q4a2.id)

  end

end
