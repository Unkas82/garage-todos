class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :task_id, null: false
      t.text    :text, null: false
      t.string  :file

      t.timestamps
    end
    add_foreign_key :comments, :tasks, on_delete: :cascade
  end
end
