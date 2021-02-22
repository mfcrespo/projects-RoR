class Trainee < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true, uniqueness: {message: "The username is already used"}
  validates :city, presence: true
  validates :country, presence: true
  validates :phone, presence: true, length: {is:10}, numericality: {only_integer: true}
  validates :bio, length: {minimum:3, maximum:100}
  validates :email, presence: true, email: true, uniqueness: true
end