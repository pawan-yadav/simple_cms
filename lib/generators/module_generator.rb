class ModuleGenerator < Rails::Generators::NamedBase
	ModuleGenerator.source_root('lib/templates/erb/module')

	# Module generator documentation
	desc "Module Options:
  --name                  # string, required, no default
  --banner-images         # true || false, optional, default is false
  --images                # true || false, optional, default is false"

  # Define our arguments
  argument :name, type: :string
  argument :banner_images, type: :string, default: 'false'
  argument :images, type: :string, default: 'false'

  def create_module_migrations
  	create_file "db/migrate/#{Time.now.year}#{Time.now.to_i}_create_#{plural_name}.rb", <<-FILE
class Create#{plural_name.camelize} < ActiveRecord::Migration
  def change
		create_table :#{plural_name} do |t|
			t.integer :#{plural_name.singularize}_id
			t.string :name
			t.text :description
			t.text :keywords
			t.text :body
			t.string :slug

		  t.timestamps null: false
		end
	end
end
    FILE
  end

  def create_image_migrations
  	create_file "db/migrate/#{Time.now.year}#{Time.now.to_i}2_add_fields.rb", <<-FILE
class AddFields < ActiveRecord::Migration
  def change
  	add_column :banner_images, :#{plural_name.singularize}_id, :integer
  	add_column :images, :#{plural_name.singularize}_id, :integer
  end
end
		FILE
  end

  # Create the directory in admin for the named module
  def create_admin_directories
		empty_directory "app/views/admin/#{file_name}/"
	end

	def create_routes
		inject_into_file 'config/routes.rb', after: "# -- insert here --\n" do
			"    resources :#{plural_name} do
      collection do
        get 'destroy'
      end
    end\n"
		end
	end

	# Create all the standard stuff
	def create_models
		template "models/parent.erb", "app/models/#{plural_name.singularize}.rb"
	end

	# If banner-images and images associations
	def create_associations
		if banner_images == 'true'
			inject_into_file 'app/models/banner_image.rb', after: "# -- insert here --\n" do
				"  belongs_to :#{plural_name.singularize}\n"
			end
		end

		if images == 'true'
			inject_into_file 'app/models/image.rb', after: "# -- insert here --\n" do
				"  belongs_to :#{plural_name.singularize}\n"
			end
		end
	end

	# Admin User.id = 1 can access all sections. Define whether others can as well
	# Default is true
	def create_access_rules
		inject_into_file 'app/models/user.rb', after: "# -- insert here --\n" do
			"  CAN_ACCESS_#{plural_name.upcase}					= 'true'\n"
		end
	end

	def create_controllers
		template "controllers/parent_controller.erb", "app/controllers/admin/#{plural_name}_controller.rb"
	end

	def create_views
		template "views/_banner_image_fields.html.erb", "app/views/admin/#{plural_name}/_banner_image_fields.html.erb"
		template "views/_form.html.erb", "app/views/admin/#{plural_name}/_form.html.erb"
		template "views/_image_fields.html.erb", "app/views/admin/#{plural_name}/_image_fields.html.erb"
		template "views/_post_fields.html.erb", "app/views/admin/#{plural_name}/_post_fields.html.erb"
		template "views/edit.html.erb", "app/views/admin/#{plural_name}/edit.html.erb"
		template "views/new.html.erb", "app/views/admin/#{plural_name}/new.html.erb"
		template "views/index.html.erb", "app/views/admin/#{plural_name}/index.html.erb"
	end

	def create_nav_links
		inject_into_file 'app/views/admin/shared/_navs.html.erb', after: "<!-- #insert here -->\n" do
				"						<% if User::CAN_ACCESS_#{plural_name.upcase} == 'true' || current_user.id == 1 %>
				  		<li class='<%= params[:controller] == 'admin/#{plural_name}' ? 'active' : '' %>'>
				      	<a href='/admin/#{plural_name}'><i class='fa fa-fw fa-file'></i> #{plural_name.capitalize}</a>
				  		</li>
						<% end %>\n"
		end
	end
end