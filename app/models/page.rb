class Page < ActiveRecord::Base
	extend FriendlyId
		friendly_id :name, use: :slugged

	has_many :posts, dependent: :destroy
	has_many :menu_items, dependent: :destroy
	accepts_nested_attributes_for :posts, :reject_if => :all_blank, :allow_destroy => true

	validates :name, :presence => true, :uniqueness => true
end
