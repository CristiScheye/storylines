class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :body
      t.integer :story_id
      t.integer :user_id
      t.timestamps
    end
  end
end
