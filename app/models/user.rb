class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..12

#バリデーション
validates :name, presence: true, length: { maximum: 20 }
validates :name, uniqueness: true

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, {presence: true,
                  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }

validates :introduction, length: { maximum: 200 }

end
