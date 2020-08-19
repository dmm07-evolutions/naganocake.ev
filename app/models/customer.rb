class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # shipping_addressのアソシエーション
  has_many :shipping_address, dependent: :destroy
  # cart_itemsのアソシエーション
  has_many :cart_items, dependent: :destroy


end
