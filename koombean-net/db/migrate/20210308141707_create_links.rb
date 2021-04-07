class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :socialname
      t.string :link
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
