class Trainee < ApplicationRecord
  before_save { self.firstname = firstname.capitalize }
  before_save { self.lastname = lastname.capitalize }
  before_save { self.city = city.capitalize }
  before_save { self.country = country.capitalize }
  before_save { self.email = email.downcase }
  before_save { self.github = "https://www.github.com/" + github.downcase }
  before_save { self.linkedin = "https://www.linkedin.com/" + linkedin.downcase }
  before_save { self.twitter = "https://www.twitter.com/" + twitter.downcase }

  belongs_to :area
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true, 
                      uniqueness: { case_sensitive: true }
  validates :city, presence: true 
  validates :country, presence: true
  validates :phone, presence: true, length: {is:10}, 
                      numericality: {only_integer: true}
  validates :bio, length: {minimum:3, maximum:100}
  validates :email, presence: true, 
                      email: true, uniqueness: { case_sensitive: true }, 
                      length: {maximum:100}

  #has_secure_password                    
end