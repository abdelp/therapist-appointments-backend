# Migration to Add img_url column to Therapists model
class AddImgUrlToTherapists < ActiveRecord::Migration[6.0]
  def change
    add_column :therapists, :img_url, :text
  end
end
