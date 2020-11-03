# frozen_string_literal: true

class CreateSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :specialties do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
    add_index :specialties, :name, unique: true
  end
end
