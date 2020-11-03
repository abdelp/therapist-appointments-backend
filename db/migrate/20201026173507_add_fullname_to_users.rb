# Migration to Add fullname column to Users model
class AddFullnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fullname, :string
  end
end
