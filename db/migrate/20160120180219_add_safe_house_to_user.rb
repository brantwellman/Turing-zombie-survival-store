class AddSafeHouseToUser < ActiveRecord::Migration
  def change
    add_column :users, :safe_house, :boolean, default: false
  end
end
