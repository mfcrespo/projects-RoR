class CreateNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :networks do |t|
      t.string :socialname
      t.string :link
      t.belongs_to :koombean, null: false, foreign_key: true

      t.timestamps
    end
  end
end
