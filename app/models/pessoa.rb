class Pessoa < ApplicationRecord
  has_many :contas, foreign_key: 'Pessoa_id', dependent: :destroy
end
