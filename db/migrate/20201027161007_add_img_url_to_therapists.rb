class AddImgUrlToTherapists < ActiveRecord::Migration[6.0]
  def change
    add_column :therapists, :img_url, :text
  end
end
