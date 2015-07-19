module Admin
	class ContactFormsController < AdminController
		before_filter :authenticate_user!

		def index
			@contact_forms = ContactForm.all.order('created_at ASC')
		end

		def show
			@contact_form = ContactForm.find(params[:id])
		end

		def destroy
     	contact_form = ContactForm.find(params[:contact_form_id])
      contact_form.destroy

      redirect_to action: 'index'
    end
	end
end