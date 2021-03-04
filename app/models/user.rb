class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, password_length: 7..128

  validates :nickname, presence: true
  validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  #validates :password,:password_confirmation,format: {with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\z/} #encrypted_password,
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :birthday, presence: true

end
