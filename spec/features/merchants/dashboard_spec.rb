require 'rails_helper'

describe 'Merchant dashboard' do
  it 'shows the merchant name on dashboard' do
    merchant = Merchant.create(name: "Gary's Tavern")

    visit "/merchants/#{merchant.id}/dashboard"
    expect(page).to have_content(merchant.name)
  end
end
