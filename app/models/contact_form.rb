class ContactForm < ActiveRecord::Base
	validates_presence_of :name, :comments
end
