class AddDefaultImageToItem < ActiveRecord::Migration
  def change
    change_column :items, :image, :string, default: "http://www.vbdl.org/wp-content/uploads/2015/09/cartoon-zombies-373177.jpg"
  end
end
