class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:search]
      @items = Item.where("name LIKE ? ", '%' + params[:search] + '%')
      @items = @items.page(params[:page]).per(12)
      @genre_name = "商品"
    elsif params[:genre_name]
      @items = Genre.find_by(name: params[:genre_name]).items
      @items = @items.page(params[:page]).per(12)
      @genre_name = params[:genre_name]
    else
      @items = Item.page(params[:page]).per(12)
      @genre_name = "商品"
    end
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

end
