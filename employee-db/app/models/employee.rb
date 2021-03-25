class Employee < ApplicationRecord
  before_save :sanitize_text
  enum departments: { accounting: "Accounting", finance: "Finance", operations: "Operations", security: "Security", human_resources: "Human Resources" }, _prefix: :department
  
  def self.to_csv(fields = column_names, options = {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |employee|
        csv << employee.attributes.values_at(*fields)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      employee_hash = row.to_hash
      employee = find_or_create_by!(name: employee_hash['name'], lastname: employee_hash['lastname'], phone: employee_hash['phone'], email: employee_hash['email'], position: employee_hash['position'], salary: employee_hash['salary'], department: employee_hash['department'])
      employee.update_attributes(employee_hash)
    end
  end  

  def sanitize_text
    self.name = name.titleize
    self.lastname = lastname.titleize
    self.email = email.downcase
    self.position = position.capitalize
  end  
  
  validates :name, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true, numericality: true, length: {is:10}
  validates :email, presence: true, email: true, uniqueness: true,
              length: {maximum:100}
  validates :position, presence: true
  validates :salary, presence: true
  validates :department, presence: true, :inclusion => {in: departments.values}

end
