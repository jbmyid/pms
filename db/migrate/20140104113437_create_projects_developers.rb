class CreateProjectsDevelopers < ActiveRecord::Migration
  def change
    create_table :developers_projects do |t|
      t.integer :project_id
      t.integer :developer_id
      t.timestamps
    end
  end
end
