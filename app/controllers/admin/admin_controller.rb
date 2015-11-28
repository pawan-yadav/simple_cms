module Admin
  # Main Admin Class. All admin classes inherit from the Admin class
  class AdminController < ApplicationController
    before_action :authenticate_user!
    layout 'admin'

    # Dashboard
    def index
    end

    def style_guide
    end
  end
end
