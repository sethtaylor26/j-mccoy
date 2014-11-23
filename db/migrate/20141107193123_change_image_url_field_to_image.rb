class ChangeImageUrlFieldToImage < ActiveRecord::Migration
  def change
  	rename_column :events, :image_url, :image
  end
end
