class Story < ActiveRecord::Base
  has_many :entries
  validates :title, presence: true, length: {maximum: 30}
  validates :first_entry, length: {minimum: 3, maximum: 100}
end