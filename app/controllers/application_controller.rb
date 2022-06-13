require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes

  
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_good_order = BakedGood.all
    baked_good_order.order(price: :desc).to_json
  end 

  get '/baked_goods/most_expensive' do
    # binding.pry
    baked_goods = BakedGood.all
    baked_goods.order(price: :desc).first.to_json
  end
end
