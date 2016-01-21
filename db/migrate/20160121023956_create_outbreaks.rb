class CreateOutbreaks < ActiveRecord::Migration
  def change
    create_table :outbreaks do |t|
      t.float :latitude
      t.float :longitude
      t.integer :danger

      t.timestamps null: false
    end
  end
end
