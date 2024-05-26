class Search < ApplicationRecord
  has_one_attached :image
  belongs_to :customer, optional: true
  validates :address_prefecture, presence: true
  validates :address_city, presence: true
  validates :distance, presence: true
  validates :distance_time, presence: true
  validates :rent, presence: true
  validates :security_deposit, presence: true
  validates :key_money, presence: true
  validates :management_fee, presence: true
  validates :guarantee_charge, presence: true
  def self.ransackable_attributes(auth_object = nil)
  ["address_city", "address_prefecture", "created_at", "customer_id", "distance", "distance_time", "guarantee_charge", "id", "key_money", "management_fee", "name", "rent", "security_deposit", "updated_at"]
  end
  #  def change
  #   add_column :searches, :latitude, :float
  #   add_column :searches, :longitude, :float
  #  end
  # geocoded_by :address_prefecture
  # geocoded_by :address_city
  # after_validation :geocode, if: :address_prefecture_changed?
  # after_validation :geocode, if: :address_city_changed?
end
