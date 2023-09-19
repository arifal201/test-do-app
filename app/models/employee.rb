class Employee < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only letter and whitespace"}
  validates :nip, presence: true, numericality: { only_integer: true }
  
  enum hoby: %w[soccer volleyball tabletennis]
  enum gender: %w[male female]
  validates :hoby, presence: true, inclusion: { in: hobies.keys, message: "hoby must be one of #{hobies.keys}"}
  validates :gender, presence: true, inclusion: { in: genders.keys, message: "hoby must be one of #{genders.keys}"}
end
