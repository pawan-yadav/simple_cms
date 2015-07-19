class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_menu

  def set_menu
  	@menu_items = MenuItem.where(:menu_item_id => nil).order('position ASC')
  end
end
