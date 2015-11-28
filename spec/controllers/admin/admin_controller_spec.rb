require 'rails_helper'

RSpec.describe Admin::AdminController, type: :controller do
  include Devise::TestHelpers

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
  end
end
