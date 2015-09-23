module Admin
	class PagesController < AdminController

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

      if page.id == 1 || page.id == 2 || page.id == 3
      	flash[:alert] = "Core pages cannot be deleted."
      else
      	page.destroy
      	flash[:notice] = "Page was destroyed."
      end

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
    		:bootsy_image_gallery_id,
    		posts_attributes: [:id, :name, :description, :keywords, :done, :body, :_destroy],
    		images_attributes: [:id, :photo, :headline, :caption, :done, :_destroy],
    		banner_images_attributes: [:id, :photo, :headline, :caption, :done, :_destroy]
    	)
  	end
	end
end