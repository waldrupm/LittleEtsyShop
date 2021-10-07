class Item < ApplicationRecord
  validates :name, :description, :unit_price, presence: true
  validates_numericality_of :unit_price
  has_many :invoice_items
  belongs_to :merchant
end
