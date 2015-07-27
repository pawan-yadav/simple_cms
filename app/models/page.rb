class Page < ActiveRecord::Base
	include Bootsy::Container
	
	extend FriendlyId
		friendly_id :name, use: :slugged

	has_many :posts, dependent: :destroy
	has_many :menu_items, dependent: :destroy
	accepts_nested_attributes_for :posts, :reject_if => :all_blank, :allow_destroy => true

	validates :name, :presence => true, :uniqueness => true

	DASHBOARD_MESSAGE   = "Welcome to Saucedo Brothers CMS."
	DEFAULT_DESCRIPTION = "El Paso locksmith services and products. We have safes, keys and locks."
	DEFAULT_KEYWORDS    = "El Paso Locksmith, Keys, locks, safes, locksmiths, el paso"
end
