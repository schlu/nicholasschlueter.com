class WelcomeController < ApplicationController
  def index
    @items = Item.latest
  end
end
