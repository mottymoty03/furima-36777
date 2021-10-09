class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :items
  has_many :purchases
  has_many :sns_credentials

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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
