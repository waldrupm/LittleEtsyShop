class Item < ApplicationRecord
  validates :name, :description, :unit_price, presence: true
  validates_numericality_of :unit_price

  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices
  belongs_to :merchant

  def self.not_yet_shipped
    joins(:invoices).select('items.name, invoices.id as invoice_id, invoices.created_at as invoice_date')
                    .where.not(invoice_items: { status: 'shipped' })
                    .order('invoice_date desc')
  end
end
