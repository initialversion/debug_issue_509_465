class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :location_id
      t.integer :day_id
      t.string :description
      t.integer :number_of_volunteers_required
      t.integer :organization_id

      t.timestamps

    end
  end
end
