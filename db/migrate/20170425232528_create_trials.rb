class CreateTrials < ActiveRecord::Migration[5.0]
  def change
    create_table :trials do |t|
      t.text :title
      t.text :synopsis
      t.text :temp
      t.text :location
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
