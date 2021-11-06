class User < ApplicationRecord
  has_many :products
  has_many :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
  validates :user_family_name, presence: true
  validates :user_family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :user_first_name, presence: true
  validates :user_first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :katakana_user_family_name, presence: true
  validates :katakana_user_family_name, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :katakana_user_first_name, presence: true
  validates :katakana_user_first_name, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
