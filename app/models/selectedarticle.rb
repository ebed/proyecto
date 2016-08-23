class Selectedarticle < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :order

  def self.totalapagar(user_id)
    carro = Selectedarticle.where(user_id: user_id)
    total = 0
    carro.each do |item|
      total = total + (item.article.price * item.qty)
    end

    return total
  end



end
