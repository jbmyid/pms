class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.references :project
      t.references :developer
      t.string :state

      t.timestamps
    end
  end
end
