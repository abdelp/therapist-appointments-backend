# frozen_string_literal: true

class RemoveEndAtFromAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :end_at
  end
end
