class ChangeWebmotorsIdToId < ActiveRecord::Migration
  def change
  	change_column :brands, :webmotors_id, :id
  end
end
