class Post < ActiveRecord::Base
	include Bootsy::Container
	
	belongs_to :page
	has_many :photos, dependent: :destroy

	validates_presence_of :name
end
