class Page < ActiveRecord::Base
	include Bootsy::Container
	
	extend FriendlyId
		friendly_id :name, use: :slugged

	has_many :posts, dependent: :destroy
	has_many :photos, dependent: :destroy
	has_many :menu_items, dependent: :destroy
	accepts_nested_attributes_for :posts, :reject_if => :all_blank, :allow_destroy => true

	validates :name, :presence => true, :uniqueness => true

  # Global Page Options !!

	# -----------------------------------------------------
	# Default Page Title and Description Options
	# -----------------------------------------------------
	DASHBOARD_MESSAGE   = "Welcome to Simple CMS."
	DEFAULT_DESCRIPTION = ""
	DEFAULT_KEYWORDS    = ""

	# -----------------------------------------------------
	# View Options
	# -----------------------------------------------------
	SHOW_PAGE_TITLES	 = :false
  SHOW_BANNER_IMAGES = :true
  SHOW_IMAGES        = :true

	# -----------------------------------------------------
	# CMS Form Options
	# -----------------------------------------------------
  SHOW_KEYWORDS_INPUT     	= :true
  SHOW_DESCRIPTION_INPUT  	= :true
  SHOW_IMAGE_UPLOAD       	= :true
  SHOW_BANNER_IMAGE_UPLOAD  = :true

  # -----------------------------------------------------
  # Page Ordering Options
  # -----------------------------------------------------
  SORT_BY         = "name"
  SORT_ORDER      = "ASC"

end
