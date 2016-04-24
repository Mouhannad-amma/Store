class StoreController < ApplicationController
	before_action :set_counter_catalog, only: [:index]
  def index
  	@products = Product.order(:title)
  end


  private

  def set_counter_catalog
  	session[:counter].nil? ?   session[:counter] = 1 :  session[:counter] += 1
  end

end
