require 'rails_helper'

RSpec.describe AdminUser, :type => :model do

  it 'checks presense' do
    user = AdminUser.new
    user.save

    expect(user.errors.messages[:email]).to_not be nil

    expect(user.persisted?).to eq(false)

  end
end
