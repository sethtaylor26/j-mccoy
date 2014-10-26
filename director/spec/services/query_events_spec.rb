RSpec.describe QueryEvents do

  it 'works' do
    service = QueryEvents.new
    event = FactoryGirl.create(:event)
    rslt = service.call({})
    ap rslt
    expect(rslt.length).to eq(1)
  end

end
