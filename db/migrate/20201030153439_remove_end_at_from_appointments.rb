# Migration to Remove end_at column from Appointments model
class RemoveEndAtFromAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :end_at
  end
end
