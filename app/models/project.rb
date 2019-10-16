class Project < ApplicationRecord


    #///****************************  Project Validation  *****************************///

    validates :title,:description,:start_date, presence: true



    #///****************************  Task Association  *****************************///

    has_and_belongs_to_many :users
    has_many :tasks ,:dependent => :destroy

end
