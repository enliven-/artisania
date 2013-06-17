class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.string      :name
      t.integer     :project_id
      t.integer     :project_category_id
      t.integer     :attribute_layer_id
      t.integer     :attribute_id
      
      t.timestamps
    end
  end
end
