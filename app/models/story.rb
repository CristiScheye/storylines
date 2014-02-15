class Story < ActiveRecord::Base
  has_many :entries
  belongs_to :user
  validates :title, presence: true, length: {maximum: 50}
  validates :first_entry, length: {minimum: 3, maximum: 150}

  def finished?
    self.entries.size >= 5
  end

  def self.finished_stories
    joins(:entries).group("stories.id").having("count(entries.id) >= 5")
  end

  def self.unfinished
    joins('LEFT JOIN entries ON stories.id = entries.story_id').group("stories.id").having("count(entries.id) < 5")
  end

  def self.rand_unfinished
    unfinished.sample
  end

  def previous_entry
    if self.entries.size == 0
      self.first_entry
    else
      self.entries.last.body
    end
  end
end
