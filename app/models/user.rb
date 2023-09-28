class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
  # validates :name, presence: true
  # validates :age, presence: true
  # validates :gender, presence: true
  # after_create :send_admin_mail
  # def send_admin_mail
  #   UserMailer.send_new_user_message(self).deliver
  # end
end
