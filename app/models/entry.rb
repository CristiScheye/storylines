class Entry < ActiveRecord::Base
  belongs_to :story
  validates :body, length: {minimum: 3, maximum: 100}
end