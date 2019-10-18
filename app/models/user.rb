class User < ApplicationRecord


  # //************************  user Association   *******************************//


    validates :name,:age,:gender,:city,:phone,:address,:email,:password ,presence: true
    validates :email, uniqueness: true



    # //************************  user Association   *******************************//

  has_many :attendences ,dependent: :destroy

  belongs_to :role

  has_and_belongs_to_many :projects,:dependent => :destroy

  has_and_belongs_to_many :tasks ,  :dependent => :destroy




  #//*******************************   devise Module   ***********************//#


  # Include default devise modules. Others available are:
  # # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # **********************      Image uploader    ************************* //#

  mount_uploader :image, SoftimageUploader



end
