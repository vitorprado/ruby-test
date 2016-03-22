class RenameBrandRelationInModel < ActiveRecord::Migration
  def change
    rename_column :models, :make_id, :brand_id
  end
end
