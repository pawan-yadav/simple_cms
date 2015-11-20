class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.integer :page_id
    	t.string :name
    	t.text :description
    	t.text :keywords
    	t.text :body
    	t.string :slug

      t.timestamps null: false
    end

    Page.create :name => 'Home', :description => "Welcome to the Simple CMS demo. This is the front end of the website. This content is controlled in the CMS section located at cms-demo.ghostcake.com/admin. Content will be reset every hour.", :keywords => "", :body => "", :slug => 'home'
    Page.create :name => 'Blog', :description => "", :keywords => "", :body => "", :slug => 'blog'
    Page.create :name => 'Contact', :description => "", :keywords => "", :body => "", :slug => 'contact'
  end
end
