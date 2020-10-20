class CreateSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :specialties do |t|
      t.text :description, null: false

      t.timestamps
    end
  end
end
