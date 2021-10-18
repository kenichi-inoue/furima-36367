class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :user_family_name, presence: true
         validates :user_first_name, presence: true
         validates :katakana_user_family_name, presence: true
         validates :katakana_user_first_name, presence: true
         validates :birthday, presence: true
         
end
