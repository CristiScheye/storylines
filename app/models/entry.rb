class Entry < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  validates :body, length: {minimum: 3, maximum: 150}
end