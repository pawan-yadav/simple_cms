# Contact Forms
class ContactForm < ActiveRecord::Base
  validates :name, presence: true
  validates :comments, presence: true
end
