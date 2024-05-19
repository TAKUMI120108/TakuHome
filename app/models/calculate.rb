class Calculate < ApplicationRecord
   validates :home_pay, presence: true
  validates :other_payment_amount, presence: true
  validates :rent, presence: true
  validates :security_deposit, presence: true
  validates :key_money, presence: true
  validates :management_fee, presence: true
  validates :guarantee_charge, presence: true
end
