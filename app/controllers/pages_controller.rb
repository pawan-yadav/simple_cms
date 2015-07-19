class PagesController < ApplicationController
	def show
		@page = Page.friendly.find(params[:id])
		@posts = @page.posts.order('date DESC')
		@contact_form = ContactForm.new
	end

	def create_contact_form
		@page = Page.find(3)
		@posts = @page.posts.order('date DESC')
		@contact_form = ContactForm.new(contact_form_params)

		if @contact_form.save(contact_form_params)
			ApplicationMailer.contact_form(@contact_form).deliver
			
			flash[:notice] = "Contact form has been sent."
			redirect_to action: 'show', :id => Page.find(3).slug
		else
			render action: 'show', :id => Page.find(3).slug
		end
	end

	def contact_form_params
  	params.require(:contact_form).permit(
  		:name, 
  		:email_address,
  		:phone_number,
  		:comments
  	)
	end
end