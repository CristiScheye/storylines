class AddAuthorNameToStoriesAndEntries < ActiveRecord::Migration
  def change
    add_column :entries, :author_name, :string
    add_column :stories, :author_name, :string
  end
end
