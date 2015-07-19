module Admin

	class AdminController < ApplicationController
		before_filter :authenticate_user!
		layout 'admin'

		# Dashboard
		def index
		end

		def style_guide
		end
	end

end