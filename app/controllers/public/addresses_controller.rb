class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @customer = current_customer
    @address = Address.new
    @addresses = @customer.addresses.page(params[:page]).per(5)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @customer = current_customer
      @addresses = @customer.addresses.page(params[:page]).per(5)
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
