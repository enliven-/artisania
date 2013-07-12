class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string       :name
      t.text         :description
      t.integer      :user_id
      t.integer      :design_versions_count, :default => 0


      t.timestamps
    end
  end
end
