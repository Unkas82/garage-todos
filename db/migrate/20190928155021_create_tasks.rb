class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer  :project_id, null: false, index: true
      t.string   :name, null: false
      t.time     :deadline
      t.integer  :index
      t.boolean  :is_done

      t.timestamps
    end
    add_foreign_key :tasks, :projects, on_delete: :cascade
  end
end
