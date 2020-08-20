class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # shipping_addressのアソシエーション
  has_many :shipping_address, dependent: :destroy
  # cart_itemsのアソシエーション
  has_many :cart_items, dependent: :destroy

  def is_status
  	if is_deleted == true
  		"退会済会員"
  	else
  		"有効会員"
  	end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_kana
    "#{first_name_kana} #{last_name_kana}"
  end

end
