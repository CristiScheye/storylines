class Story < ActiveRecord::Base
  has_many :entries
  belongs_to :user
  validates :title, presence: true, length: {maximum: 50}
  validates :first_entry, length: {minimum: 3, maximum: 150}

  def self.finished_stories
    # joins(:entries).group("stories.id").having("count(entries.id) >= 5")
    where(finished: true)
  end

  def self.unfinished
    # joins('LEFT JOIN entries ON stories.id = entries.story_id').group("stories.id").having("count(entries.id) < 5")
    where(finished: false)
  end

  def self.unstarted
    includes(:entries).where(:entries => {id: nil})
  end

  def self.for_users_other_than(user)
    where.not(user: user)
  end

  def self.for_prev_entries_not_by(user)
    where(id: Entry.previous_by_users_other_than(user).pluck(:story_id))
  end

  def previous_entry
    if self.entries.size == 0
      self.first_entry
    else
      self.entries.last.body
    end
  end

  def author
    self.author_name || self.user.username
  end
end
