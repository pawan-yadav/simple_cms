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

    Page.create :name => 'Home', :description => "", :keywords => "", :body => "", :slug => 'home'
    Page.create :name => 'Blog', :description => "", :keywords => "", :body => "", :slug => 'blog'
    Page.create :name => 'Contact', :description => "", :keywords => "", :body => "", :slug => 'contact'
  end
end
