class Challenge < ApplicationRecord
  belongs_to :user
  has_many :tag_challenges

  validates_presence_of :title
  validates_presence_of :description

end
