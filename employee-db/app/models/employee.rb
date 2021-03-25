class Employee < ApplicationRecord
  before_save :sanitize_text
  enum departments: { accounting: "Accounting", finance: "Finance", operations: "Operations", security: "Security", human_resources: "Human Resources" }, _prefix: :department
  department_options = %w(yes no)
  def sanitize_text
    self.name = name.titleize
    self.lastname = lastname.titleize
    self.email = email.downcase
    self.position = position.capitalize
  end  
  
  validates :name, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true, numericality: true, length: {is:11}
  validates :email, presence: true, email: true, uniqueness: true,
              length: {maximum:100}
  validates :position, presence: true
  validates :salary, presence: true
  validates :department, presence: true, :inclusion => {in: departments.values}
end
