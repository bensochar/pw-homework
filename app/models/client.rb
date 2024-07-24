class Client < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :buildings
  has_many :custom_fields, class_name: 'CustomField::Base', dependent: :destroy
end
