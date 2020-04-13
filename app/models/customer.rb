class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :postcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

# is_deletedカラムがnil以外のCustomer（大会済）をはじく
  def active_for_authentication?
    super && (self.is_deleted == nil)
  end

# Customerの検索をする際の検索方法を選択できるようにする
  def self.search(method,search)
    if method == "forward_match"
      @customers = Customer.where("last_name LIKE?","#{search}%")
    elsif method == "backward_match"
      @customers = Customer.where("last_name LIKE?","%#{search}")
    elsif method == "perfect_match"
      @customers = Customer.where("last_name LIKE?","#{search}")
    elsif method == "partial_match"
      @customers = Customer.where("last_name LIKE?","%#{search}%")
    else
      @customers = Customer.all
    end
  end
end
