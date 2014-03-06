class Entry < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  validates :body, length: {minimum: 3, maximum: 150}

  def self.previous_by_users_other_than(user)
    where(id: Entry.select("max(entries.created_at)").group(:story_id)).where.not(user: user)
  end
end