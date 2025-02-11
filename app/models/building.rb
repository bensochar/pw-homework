class Building < ApplicationRecord
  attribute :address, :string
  belongs_to :client
  has_many :custom_fields, through: :client

  accepts_nested_attributes_for :custom_fields
  validates_presence_of :client, :street_address, :city, :state, :postcode, :country

  def address
    "#{street_address} #{city}, #{state} #{postcode}"
  end
end
