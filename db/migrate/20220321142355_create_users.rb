# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :login, limit: 10
      t.string :password
      t.string :email, limit: 20

      t.timestamps
    end
  end
end
