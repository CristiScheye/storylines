class AddFinishedToStories < ActiveRecord::Migration
  def change
    add_column :stories, :finished, :boolean, default: false, null: false
  end
end
