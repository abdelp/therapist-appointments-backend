# Migration to create Appointments relation
class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: true
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
  end
end
