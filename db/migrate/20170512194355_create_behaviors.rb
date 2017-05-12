class CreateBehaviors < ActiveRecord::Migration[5.0]
  def change
    create_table :behaviors do |t|
      t.text :name
      t.integer :count
      t.references :trial, foreign_key: true

      t.timestamps
    end
  end
end
