class Employee < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only letter and whitespace"}
  validates :nip, presence: true, numericality: { only_integer: true }, uniqueness: true
  
  enum hoby: %w[soccer volleyball tabletennis]
  enum gender: %w[male female]
  validates :hoby, presence: true, inclusion: { in: hobies.keys, message: "hoby must be one of #{hobies.keys}"}
  validates :gender, presence: true, inclusion: { in: genders.keys, message: "hoby must be one of #{genders.keys}"}

  scope :filter_by_nip, ->(nip) { where("CAST(nip AS TEXT) ILIKE ?", "%#{nip}%")}
  scope :filter_by_name, ->(name) { where("name ILIKE ?","%#{name}%")}
end
