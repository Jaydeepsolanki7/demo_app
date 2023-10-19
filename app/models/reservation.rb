class Reservation < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :bus
  has_many :seats
  has_many :reservation_details, dependent: :destroy 
  enum :reservation_status, [:pending, :accepted, :rejected]
  enum gender: {male: "male", female: "female", other: "other"}

  accepts_nested_attributes_for :reservation_details, allow_destroy:true, reject_if: :all_blank

  # before_update :ensure_name_and_email_presence

  # def ensure_name_and_email_presence
  #   if user_name.blank? || user_email.blank?
  #     errors.add(:base, 'Name and Email must be present before updating')
  #     throw(:abort)
  #   end
  # end
end
