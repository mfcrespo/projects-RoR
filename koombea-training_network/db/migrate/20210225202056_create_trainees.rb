class CreateTrainees < ActiveRecord::Migration[6.1]
  def change
    create_table :trainees do |t|
      t.string :firstname
      t.string :lastname
      t.string :city
      t.string :country
      t.integer :phone
      t.text :bio
      t.string :preference
      t.string :email
      t.timestamps
    end
  end
end
