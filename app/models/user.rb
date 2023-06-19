class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must contain at least one letter and one digit' }
  validates :family_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :birth_day, presence: true
  validates :nickname, presence: true

  validates :family_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－々]+\z/, message: 'is invalid' }
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-んァ-ヶー－々]+\z/, message: 'is invalid' }
end
