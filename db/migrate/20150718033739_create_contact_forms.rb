class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :phone_number
      t.string :email_address
      t.text :comments

      t.timestamps null: false
    end
  end
end
