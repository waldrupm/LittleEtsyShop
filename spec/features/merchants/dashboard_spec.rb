require 'rails_helper'

describe 'Merchant dashboard' do
  it 'shows the merchant name on dashboard' do
    merchant = Merchant.create(name: "Gary's Tavern")

    visit "/merchants/#{merchant.id}/dashboard"
    expect(page).to have_content(merchant.name)
  end

  it 'shows links to merchant items and invoices' do
    merchant = Merchant.create(name: "Gary's Tavern")

    visit "/merchants/#{merchant.id}/dashboard"

    expect(page).to have_link('My Items')
    expect(page).to have_link('My Invoices')
  end
end
