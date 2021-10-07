class Item < ApplicationRecord
  validates :name, :description, :unit_price, presence: true
  validates_numericality_of :unit_price

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  belongs_to :merchant
end
