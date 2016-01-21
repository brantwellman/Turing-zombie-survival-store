class ChangeSafeHouseColumnForUser < ActiveRecord::Migration
  def change
    remove_column :users, :safe_house, :boolean, default: false
    add_column :users, :safe_house, :integer, default: 0
  end
end
