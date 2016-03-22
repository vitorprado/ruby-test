class RenameMakeToBrand < ActiveRecord::Migration
  def change
    rename_table :makes, :brands
  end
end
