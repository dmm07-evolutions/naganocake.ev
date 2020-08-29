class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # shipping_addressのアソシエーション
  has_many :shipping_address, dependent: :destroy
  # cart_itemsのアソシエーション
  has_many :cart_items, dependent: :destroy

  has_many :orders, dependent: :destroy

  validates :first_name, presence: true, length: { in: 1..10}
  validates :last_name, presence: true, length: { in: 1..10}
  validates :first_name_kana, presence: true, length: { in: 1..10}
  validates :last_name_kana, presence: true, length: { in: 1..10}
  validates :postcode, presence: true, length: { is: 7 }
  validates :address, presence: true
  validates :phone_number, presence: true

  #退会フラグの判定
  def is_status
  	if is_deleted == true
  		"退会済会員"
  	else
  		"有効会員"
  	end
  end
  #退会フラグがtureかfalseかを判定する
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  #フルネーム
  def full_name
    "#{first_name} #{last_name}"
  end

  #フルネーム（フリガナ）
  def full_name_kana
    "#{first_name_kana} #{last_name_kana}"
  end

end
