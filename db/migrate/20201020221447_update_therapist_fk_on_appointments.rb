# Migration to update fk name from appointments to therapists
class UpdateTherapistFkOnAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :appointments, :therapists
    add_foreign_key :appointments, :therapists, primary_key: :user_id
  end
end
