class Trainee < ApplicationRecord
	has_many :networks, dependent: :destroy 
	accepts_nested_attributes_for :networks, reject_if: :all_blank, allow_destroy: true
	
	before_save { self.firstname = firstname.capitalize }
	before_save { self.lastname = lastname.capitalize }
	before_save { self.city = city.capitalize }
	before_save { self.country = country.capitalize }
	before_save { self.email = email.downcase }  
	
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :city, presence: true 
	validates :country, presence: true
	validates :phone, presence: true, length: {is:10}, 
			    numericality: {only_integer: true}
	validates :bio, length: {minimum:3, maximum:100}
	validates :email, presence: true, 
			    email: true, uniqueness: { case_sensitive: false }, 
			    length: {maximum:100}
      
	#has_secure_password                    
      end