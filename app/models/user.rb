class User < ApplicationRecord
	validates  :firstname, :lastname, :email, :password, presence: true	
	validates :email, uniqueness: true
	validates :email, uniqueness: { case_sensitive: false }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, length: { in: 6..20}
	validates :gender, inclusion: %w(male female)
	
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
