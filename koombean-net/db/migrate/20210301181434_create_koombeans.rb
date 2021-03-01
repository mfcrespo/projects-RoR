class CreateKoombeans < ActiveRecord::Migration[6.1]
  def change
    create_table :koombeans do |t|
      t.string :firstname
      t.string :lastname
      t.string :city
      t.string :country
      t.integer :phone
      t.text :bio
      t.string :area
      t.string :email
      t.timestamps
    end
  end
end
