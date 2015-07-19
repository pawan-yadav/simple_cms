module Admin
	class MenuItemsController < AdminController
		before_filter :authenticate_user!

		def index
			set_menu_items
		end

		def edit
			set_menu_item
		end

		def new
			@menu_item = MenuItem.new
		end

		def update
			set_menu_item

			if @menu_item.update(menu_item_params)
				flash[:notice] = "Menu item has been updated."
				redirect_to action: 'index'
			else
				render action: 'edit', id: @menu_item.id
			end
		end

		def create
			@menu_item = MenuItem.new(menu_item_params)

			if @menu_item.save
				flash[:notice] = "Menu item was created."
				redirect_to action: 'index'
			else
				render action: 'new'
			end
		end

		def save
			set_menu_item
		end

		def destroy
      menu_item = MenuItem.find(params[:menu_item_id])
      menu_item.destroy

      redirect_to action: 'index'
    end

		def move_up
      menu_item = MenuItem.find(params[:menu_item_id])
      menu_item.move_higher
      menu_item.save

      respond_to do |format|
        format.js { list_refresh }
      end
    end

    def move_down
      menu_item = MenuItem.find(params[:menu_item_id])
      menu_item.move_lower
      menu_item.save

      respond_to do |format|
        format.js { list_refresh }
      end
    end

		private
			def list_refresh
        set_menu_items
        return render(:file => 'admin/menu_items/list_refresh.js.erb')
      end

			def set_menu_item
				@menu_item = MenuItem.find(params[:id])
			end

			def set_menu_items
				@menu_items = MenuItem.where(:menu_item_id => nil).order('position ASC')
			end

			def menu_item_params
	    	params.require(:menu_item).permit(
	    		:page_id,
	    		:menu_item_id,
	    		:position
	    	)
	  	end
	end
end