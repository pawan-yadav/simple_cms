class Post < ActiveRecord::Base
	include Bootsy::Container
	
	belongs_to :page
	has_many :images, dependent: :destroy

	validates_presence_of :name, :date

	accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

	# Global Post Options !!

	# -----------------------------------------------------
	# CMS Form Options
	# -----------------------------------------------------
	SHOW_IMAGE_UPLOAD   = 'true'

	# -----------------------------------------------------
	# View Options
	# -----------------------------------------------------
  SHOW_IMAGES = 'true'
end
