class Bug < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :title, presence: true
  validates :description, presence: true
  validates :deadline, presence: true
  validates :status, presence: true
  validates :bug_type, presence: true
 
  enum bug_type: { feature: 0, bug: 1 }
  enum status: { completed: 0, started: 1, resolved: 2, firstpoint: 3 } # Include all statuses
  
end
