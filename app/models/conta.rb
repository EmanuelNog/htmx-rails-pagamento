class Conta < ApplicationRecord
  belongs_to :pessoa, foreign_key: 'Pessoa_id'
  has_many :transacoes, class_name: 'Transacao', foreign_key: 'Conta_id', dependent: :destroy
end
