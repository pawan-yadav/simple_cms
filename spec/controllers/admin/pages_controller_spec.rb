require 'rails_helper'

RSpec.describe Admin::PagesController, type: :controller do
  include Devise::TestHelpers

  def super_setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user, id: 1)
  end

  def setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user, id: 2)
  end

  describe 'GET index' do
    it 'while signed in' do
      setup

      get :index
      expect(response).to be_success
    end

    it 'while signed out' do
      get :index
      expect(response).to redirect_to('/users/sign_in')
    end

    it 'while has access' do
      setup
      stub_const('User::CAN_ACCESS_PAGES', 'true')

      get :index
      expect(User::CAN_ACCESS_PAGES).to eq('true')
      expect(response).to be_success
    end

    it 'while has no access' do
      setup
      stub_const('User::CAN_ACCESS_PAGES', 'false')

      get :index
      expect(User::CAN_ACCESS_PAGES).to eq('false')
      expect(response).to redirect_to('/admin')
    end

    it 'while user with id 1' do
      super_setup
      stub_const('User::CAN_ACCESS_PAGES', 'false')

      get :index
      expect(User::CAN_ACCESS_PAGES).to eq('false')
      expect(response).to be_success
    end
  end
end
