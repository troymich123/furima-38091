class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', allow_blank: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true, message: 'には全角（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :last_name
    validates :first_name
  end  

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'には全角（カタカナ）を使用してください' } do
    validates :last_name_jp
    validates :first_name_jp
  end  

  validates :birthday, presence: true

  has_many :items
end
