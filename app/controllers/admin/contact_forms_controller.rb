module Admin
	class ContactFormsController < AdminController
		before_action :validate_user

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

    private
    	def validate_user
	    	unless User::CAN_ACCESS_CONTACT_FORMS == 'true' || current_user.id == 1
	    		flash[:alert] = "You do not have access."
	    		redirect_to '/admin'
	    	end
	    end
	end
end