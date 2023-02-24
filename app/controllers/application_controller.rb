class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end
  
  get '/bakeries/:id' do
    # get the bakery with the given id from the database
    bakery = Bakery.find(params[:id])
    # include its baked goods as an array nested inside the bakery object
    bakery.to_json(include: :baked_goods)
  end
  
  get '/baked_goods/by_price' do
    # get all the baked goods from the database, sorted by price in descending order
    baked_goods = BakedGood.order(price: :desc)
    # send them back as a JSON array
    baked_goods.to_json
  end
  
  get '/baked_goods/most_expensive' do
    # get the most expensive baked good from the database
    baked_good = BakedGood.order(price: :desc).first
    # send it back as a JSON object
    baked_good.to_json
  end
end
