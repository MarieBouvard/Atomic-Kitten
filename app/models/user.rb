class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :first_name, 
    presence: true
  validates :last_name,
    presence: true
   
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :user_cart

    def user_cart
      Cart.create(user_id: self.id)
    end 
end
