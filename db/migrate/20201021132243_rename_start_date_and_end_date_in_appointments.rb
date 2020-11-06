# Migration to Rename start_date and end_date with standardized suffix
class RenameStartDateAndEndDateInAppointments < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :start_date, :start_at
    rename_column :appointments, :end_date, :end_at
  end
end
