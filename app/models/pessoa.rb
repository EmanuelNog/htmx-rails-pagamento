class Pessoa < ApplicationRecord
  has_many :contas, foreign_key: 'Pessoa_id', dependent: :destroy
  
  # When a pessoa is deleted:
  # 1. All their contas will be deleted (due to dependent: :destroy above)
  # 2. All transacoes of those contas will be deleted (due to the Conta model's has_many below)
end
