class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.first(4)
  end

  def about
  end
end