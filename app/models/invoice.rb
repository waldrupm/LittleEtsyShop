class Invoice < ApplicationRecord
  has_many :transactions
  belongs_to :customer

  enum status: ['in progress', 'completed', 'cancelled']
end
