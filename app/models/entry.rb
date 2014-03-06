class Entry < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  validates :body, length: {minimum: 3, maximum: 150}

  def self.previous_by_users_other_than(user)
    where(id: Entry.select("max(entries.id").group(:story_id).order("created_at desc")).where.not(user: user)
  end
end