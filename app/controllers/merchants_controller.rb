class MerchantsController < ApplicationController
  def dashboard
    @merchant = Merchant.find(params[:id])
    @top_5_customers = @merchant.customers.top_five_by_merchant(@merchant.id)
    @items_to_be_shipped = @merchant.items.not_yet_shipped
  end
end
