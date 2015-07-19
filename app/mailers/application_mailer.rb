class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def contact_form(form)
  	@form = form
		mail :to => "admin@example.com", :subject => "Website Contact Form"
	end
end
