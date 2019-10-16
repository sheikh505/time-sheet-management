class Attendence < ApplicationRecord


  # //************* Attendence Validation ************ //#


   validates :datee , presence: true





 # //*******   attendence user  Association ********//

  belongs_to :user

  # before_validation :check_reapeted_attendence
  # before_create :check_reapeted_attendence



  private

  #
  # def check_reapeted_attendence
  #
  # debugger
  #   aa = Attendence.where(datee:Date.today , user_id: self.user_id, status: true)
  #
  #   if aa.any?
  #
  #     errors.add(:Sorry, " User Already exist! ")
  #
  #   end
  #
  # end


  #
  # def check_reapeted_attendence
  #
  #   aa = Attendence.where(datee:Date.today , user_id: self.user_id)
  #
  #   if aa.any?
  #
  #     return false
  #
  #
  #   end
  #
  # end
  #






end
