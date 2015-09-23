class BannerImage < ActiveRecord::Base
	belongs_to :page
	belongs_to :post

	validates_presence_of :photo

	has_attached_file :photo, styles: { banner: "1200x400#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
