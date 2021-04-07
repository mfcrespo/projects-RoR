class CreateNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :networks do |t|
      t.text :socialname
      t.references :trainee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
