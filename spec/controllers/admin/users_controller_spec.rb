require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
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
      stub_const('User::CAN_ACCESS_USERS', 'true')

      get :index
      expect(User::CAN_ACCESS_USERS).to eq('true')
      expect(response).to be_success
    end

    it 'while has no access' do
      setup
      stub_const('User::CAN_ACCESS_USERS', 'false')

      get :index
      expect(User::CAN_ACCESS_USERS).to eq('false')
      expect(response).to redirect_to('/admin')
    end

    it 'while user with id 1' do
      super_setup
      stub_const('User::CAN_ACCESS_USERS', 'false')

      get :index
      expect(User::CAN_ACCESS_USERS).to eq('false')
      expect(response).to be_success
    end
  end

  describe '#new' do
    it 'while signed in' do
      setup

      get :new
      expect(response).to be_success
    end

    it 'while signed out' do
      get :new
      expect(response).to redirect_to('/users/sign_in')
    end

    it 'while has access' do
      setup
      stub_const('User::CAN_ACCESS_USERS', 'true')

      get :new
      expect(User::CAN_ACCESS_USERS).to eq('true')
      expect(response).to be_success
    end

    it 'while has no access' do
      setup
      stub_const('User::CAN_ACCESS_USERS', 'false')

      get :new
      expect(User::CAN_ACCESS_USERS).to eq('false')
      expect(response).to redirect_to('/admin')
    end

    it 'while user with id 1' do
      super_setup
      stub_const('User::CAN_ACCESS_USERS', 'false')

      get :new
      expect(User::CAN_ACCESS_USERS).to eq('false')
      expect(response).to be_success
    end
  end

  describe '#edit' do
    it 'while signed in' do
      setup

      get :edit, id: 2
      expect(response).to be_success
    end

    it 'while signed out' do
      get :edit, id: 2
      expect(response).to redirect_to('/users/sign_in')
    end

    it 'while has access' do
      setup
      stub_const('User::CAN_ACCESS_USERS', 'true')

      get :edit, id: 2
      expect(User::CAN_ACCESS_USERS).to eq('true')
      expect(response).to be_success
    end

    it 'while has no access' do
      setup
      stub_const('User::CAN_ACCESS_USERS', 'false')

      get :edit, id: 2
      expect(User::CAN_ACCESS_USERS).to eq('false')
      expect(response).to redirect_to('/admin')
    end

    it 'while user with id 1' do
      FactoryGirl.create(:user, id: 2)
      super_setup
      stub_const('User::CAN_ACCESS_USERS', 'false')

      get :edit, id: 2
      expect(User::CAN_ACCESS_USERS).to eq('false')
      expect(response).to be_success
    end
  end

  describe '#create' do
    before do
      @attrs = FactoryGirl.attributes_for(:user)
    end

    it 'while signed in' do
      super_setup

      expect(User.count).to eq(1)
      expect(post :create, user: @attrs).to redirect_to('/admin/users')
      expect(User.count).to eq(2)
    end

    it 'while signed out' do
      expect(User.count).to eq(0)
      expect(post :create, user: @attrs).to redirect_to('/users/sign_in')
      expect(User.count).to eq(0)
    end

    it 'while has access' do
      setup
      stub_const('User::CAN_ACCESS_USERS', 'true')
      expect(User::CAN_ACCESS_USERS).to eq('true')

      expect(User.count).to eq(1)
      expect(post :create, user: @attrs).to redirect_to('/admin/users')
      expect(User.count).to eq(2)
    end

    it 'while has no access' do
      setup
      stub_const('User::CAN_ACCESS_USERS', 'false')
      expect(User::CAN_ACCESS_USERS).to eq('false')

      expect(User.count).to eq(1)
      expect(post :create, user: @attrs).to redirect_to('/admin')
      expect(User.count).to eq(1)
    end

    it 'while user with id 1' do
      FactoryGirl.create(:user, id: 2)
      super_setup
      stub_const('User::CAN_ACCESS_USERS', 'false')
      expect(User::CAN_ACCESS_USERS).to eq('false')

      expect(User.count).to eq(2)
      expect(post :create, user: @attrs).to redirect_to('/admin/users')
      expect(User.count).to eq(3)
    end
  end
end
