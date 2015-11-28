# Images
class Image < ActiveRecord::Base
  # stock associations
  belongs_to :page
  belongs_to :post

  # Associations added by module generator
  # Do not remove or midify this comment.
  # !!! Important !!!
  # -- insert here --

  validates :photo, presence: true

  has_attached_file :photo, styles: { medium: '500x500>',
                                      thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: %r{/\Aimage\/.*\Z/}
end
