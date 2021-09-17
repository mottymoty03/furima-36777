class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[0-9])[a-z\d]{6,}\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :lastname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :firstname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :lastname_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :firstname_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birthday, presence: true
end
