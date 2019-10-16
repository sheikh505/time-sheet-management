class Task < ApplicationRecord


  #///****************************  Task Model Validation  *****************************///

  validates :title,:description, presence: true






  #///****************************  Task Association belong to  *****************************///

  belongs_to :project
  has_and_belongs_to_many :users



end
