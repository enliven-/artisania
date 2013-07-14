class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.string      :name
      t.integer     :project_id
      t.integer     :user_id
      
      t.timestamps
    end
  end
end
