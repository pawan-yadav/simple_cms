module Admin
	class PagesController < AdminController
		before_filter :authenticate_user!

		def index
			@pages = Page.all.order('name ASC')
		end

		def edit
			set_page
		end

		def new
			@page = Page.new
		end

		def update
			set_page

			if @page.update(page_params)
				flash[:notice] = "Page has been updated."
				redirect_to action: 'index'
			else
				render action: 'edit', id: @page.id
			end
		end

		def create
			@page = Page.new(page_params)

			if @page.save
				flash[:notice] = "Page was created."
				redirect_to action: 'index'
			else
				render action: 'new'
			end
		end

		def save
			set_page
		end

		def destroy
      page = Page.find(params[:page_id])
      page.destroy

      redirect_to action: 'index'
    end

		private

		def set_page
			@page = Page.friendly.find(params[:id])
		end

		def page_params
    	params.require(:page).permit(
    		:page_id,
    		:name, 
    		:description,
    		:keywords,
    		:body,
    		posts_attributes: [:id, :name, :description, :keywords, :done, :body, :_destroy]
    	)
  	end
	end
end