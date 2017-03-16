class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.text :description
      t.integer :priority
      t.integer :object_id

      t.timestamps
    end
  end
end
