class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :page_id
      t.string :name
      t.date :date
      t.text :description
      t.text :keywords
      t.text :body
      t.string :slug

      t.timestamps null: false
    end
  end
end
