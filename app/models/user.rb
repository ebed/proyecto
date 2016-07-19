class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :scores
  has_one :seller
  has_many :sells

  def name
     self.nombre
  end

  def isSeller?
    Seller.where(user_id: self.id).count > 0
  end
end
