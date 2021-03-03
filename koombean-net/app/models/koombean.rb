class Koombean < ApplicationRecord
	has_many :networks, dependent: :destroy
  has_one_attached :avatar
  accepts_nested_attributes_for :networks, reject_if: :reject_network, allow_destroy: true
  before_save :sanitize_text
  validate :acceptable_avatar

  
  def reject_network(attr)
    attr['socialname'].blank? || attr['link'].blank?
  end

  def sanitize_text
    self.firstname = firstname.titleize
    self.lastname = lastname.titleize
    self.city = city.titleize
    self.country = country.titleize
    self.email = email.downcase
  end

  def acceptable_avatar
    return unless avatar.attached?
  
    unless avatar.byte_size <= 5.megabyte
      errors.add(:avatar, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPG, JPEG or PNG")
    end
  end

	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :city, presence: true 
	validates :country, presence: true
	validates :phone, presence: true, length: {is:10}, 
			    numericality: {only_integer: true}
	validates :bio, length: {minimum:3, maximum:100}
	validates :email, presence: true, 
			    email: true, uniqueness: true, 
			    length: {maximum:100}
  
end 