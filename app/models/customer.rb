class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # before_commit :is_matching_login_user, only: [:edit, :update, :destroy]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :searches, dependent: :destroy
        has_many :posts, dependent: :destroy
        has_one_attached :image
        validates :name, presence: true
        validates :email, presence: true
end
