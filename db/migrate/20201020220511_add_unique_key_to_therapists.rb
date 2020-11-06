# Migration to Add unique key on Therapists user_id
class AddUniqueKeyToTherapists < ActiveRecord::Migration[6.0]
  def change
    add_index :therapists, :user_id, unique: true, name: 'idx_uk_therapists_on_user_id'
  end
end
