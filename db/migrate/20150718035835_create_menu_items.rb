class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
    	t.integer :page_id
    	t.integer :menu_item_id
    	t.integer :position

      t.timestamps null: false
    end
  end
end
