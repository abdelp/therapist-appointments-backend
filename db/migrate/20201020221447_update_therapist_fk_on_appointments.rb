# frozen_string_literal: true

class UpdateTherapistFkOnAppointments < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :appointments, :therapists
    add_foreign_key :appointments, :therapists, primary_key: :user_id
  end
end
