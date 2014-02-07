class Story < ActiveRecord::Base
  has_many :entries
  validates :title, presence: true, length: {maximum: 30}
  validates :first_entry, length: {minimum: 3, maximum: 100}

  def finished?
    self.entries.size >= 5
  end

  def self.finished_stories
    joins(:entries).group("stories.id").having("count(entries.id) >= 5")
  end

  def self.unfinished
    joins(:entries).group("stories.id").having("count(entries.id) < 5")
  end

  def self.unstarted

  end

  def self.rand_unfinished
    unfinished.merge(unstarted).sample
  end


end
