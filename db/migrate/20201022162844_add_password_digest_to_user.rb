# frozen_string_literal: true

class AddPasswordDigestToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
  end
end
