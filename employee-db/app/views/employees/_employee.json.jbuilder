json.extract! employee, :id, :name, :lastname, :phone, :email, :position, :salary, :department, :created_at, :updated_at
json.url employee_url(employee, format: :json)
