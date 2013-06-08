class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      
      t.string  :label
      t.integer :project_id
      
      t.timestamps
    end
  end
end
