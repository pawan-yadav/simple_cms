# front end helpers
module ApplicationHelper
  def label_for_param(param_controller)
    param_controller.gsub('admin/', '').gsub('_', ' ').titleize
  end

  def display_date(date)
    date.strftime("%b #{date.day.ordinalize}, %Y")
  end
end
