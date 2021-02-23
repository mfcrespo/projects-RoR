class AddAreaIdToTrainees < ActiveRecord::Migration[6.1]
  def change
    add_column :trainees, :area_id, :int 
  end
end
