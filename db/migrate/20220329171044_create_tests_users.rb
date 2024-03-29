# frozen_string_literal: true

class CreateTestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
