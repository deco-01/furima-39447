class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/ }
  validates :password_confirmation, presence: true
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :birth_day, presence: true
  validates :nickname, presence: true

  validates :family_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－]+\z/, message: 'is invalid' }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－]+\z/, message: 'is invalid' }
end
