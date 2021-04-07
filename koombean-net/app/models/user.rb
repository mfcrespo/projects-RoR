class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :links, dependent: :destroy
  has_one_attached :avatar
  accepts_nested_attributes_for :links, reject_if: :reject_link, allow_destroy: true
  validate :acceptable_avatar

  def reject_link(attr)
    attr['socialname'].blank? || attr['link'].blank?
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

end
