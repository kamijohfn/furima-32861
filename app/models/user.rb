class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, password_length: 6..128

  validates :nickname, presence: true
  validates :password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/}
  validates :last_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥々]+\z/}
  validates :first_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥々]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  validates :birthday, presence: true

end
