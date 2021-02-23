class CreateSocials < ActiveRecord::Migration[6.1]
  def change
    create_table :socials do |t|
      t.string :socialmedia
      t.string :link
      t.timestamps
    end
  end
end
