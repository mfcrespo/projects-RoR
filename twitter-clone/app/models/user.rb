class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  before_save :sanitize_text


       
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true, 
             email: true, uniqueness: true, 
             length: {maximum:100}

  def sanitize_text
    self.username = username.downcase
    self.name = name.titleize
    self.email = email.downcase
  end
end
