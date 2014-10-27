require 'rails_helper'
require 'spec_helper'

RSpec.describe EventsController, :type => :controller do
  before :each do
    @user = FactoryGirl.create(:user)
    #@merchant = Factory(:merchant, :user_id => @user.id,:is_approved => false, :is_blacklisted => false)
    #controller.stub!(:current_user).and_return(@user)
  end
  describe "GET index" do
    it "assigns @events" do
      sign_in @user
      event = Event.create
      get :index
      expect(assigns(:events)).to eq([event])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
