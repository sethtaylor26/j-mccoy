RSpec.describe QueryEvents do
  describe 'filter' do
  	it 'test YN' do
      service = QueryQuestions.new
      question_type_str = 'YN'

      question = FactoryGirl.create(:question, question_type: question_type_str)

      rslt = service.call({question_type: question_type_str})
      expect(rslt.obj.length).to eq(1)
    end

    it 'tests no question_type' do
      service = QueryQuestions.new

      question1 = FactoryGirl.create(:question, question_type: 'YN')
      question2 = FactoryGirl.create(:question, question_type: 'EO')

      rslt = service.call({})
      expect(rslt.obj.length).to eq(2)
    end
  end
end