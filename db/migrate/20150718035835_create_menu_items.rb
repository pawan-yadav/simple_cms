class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :page_id
      t.integer :menu_item_id
      t.integer :position

      t.timestamps null: false
    end

    MenuItem.create page_id: 1, position: 1
    MenuItem.create page_id: 2, position: 2
    MenuItem.create page_id: 3, position: 3
  end
end
