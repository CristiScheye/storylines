class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :first_entry
      t.timestamps
    end
  end
end
