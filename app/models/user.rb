class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, :dependent => :delete_all
  has_many :scores, :dependent => :delete_all
  has_one :seller, :dependent => :destroy
  has_many :sells, :dependent => :delete_all

  has_many :selectedarticles, :dependent => :delete_all

  def name
     self.nombre
  end

  def isSeller?
    Seller.where(user_id: self.id).count > 0
  end
end
