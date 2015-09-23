class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # -----------------------------------------------------
	# CMS User Configuration - This Overrides any type of
	# ACL functionality
	# *****Note******
	# The user with User.id = 1 has access to all sections 
	# -----------------------------------------------------
	CAN_ACCESS_USERS					= 'true'
	CAN_ACCESS_MENUS					= 'true'
	CAN_ACCESS_BLOG_POSTS			= 'true'
	CAN_ACCESS_PAGES					= 'true'
	CAN_ACCESS_CONTACT_FORMS	= 'true'
end
