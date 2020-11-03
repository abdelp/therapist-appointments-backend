# frozen_string_literal: true

class RenameStartDateAndEndDateInAppointments < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :start_date, :start_at
    rename_column :appointments, :end_date, :end_at
  end
end
