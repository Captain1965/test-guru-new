class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.string :string
      t.string :level
      t.string :integer

      t.timestamps
    end
  end
end
