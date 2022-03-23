class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, from: nil, to: 1, null: false
      t.string :author, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
