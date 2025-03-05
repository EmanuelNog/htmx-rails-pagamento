class Transacao < ApplicationRecord
  belongs_to :conta, foreign_key: 'Conta_id'
  
  validates :valor, presence: true, numericality: { greater_than: 0 }
end
