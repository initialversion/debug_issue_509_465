class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :neighborhood

      t.timestamps

    end
  end
end
