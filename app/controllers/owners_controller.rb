class OwnersController < ApplicationController

  # get '/owners' do
  #   @owners = Owner.all
  #   erb :'/owners/index' 
  # end

  get '/owners/new' do 
    @pets = Pet.all
    erb :'/owners/new'

  end

  post '/owners' do 
  @owner = Owner.create(params["owner"])
  pet_params = params["pet"]["name"]
  if !pet_params.empty?
  pet = Pet.create(name: params["pet"]["name"])
  @owner.pets << pet
  end
  @owner.save
  redirect "/owners/#{@owner.id}"
  end
  
  
  get '/owners/:id' do
  @owner = Owner.find_by(id: params["id"])
  erb :'owners/show'
  end
  
  get '/owners' do
   @owners = Owner.all
   erb :'owners/index'
  end
    
  get '/owners/:id/edit' do 
    @owner = Owner.find_by_id(params["id"])
    erb :"/owners/edit"
  end
  
  
  
  

  # get '/owners/:id' do 
  #   @owner = Owner.find(params[:id])
  #   erb :'/owners/show'
  # end

  patch '/owners/:id' do 
    @owner = Owner.find(params["id"])
    @owner.name = params["owner"]["name"]
    
    @owner.pets.each do |pet|
      if pet.owner_id == params["id"].to_i 
        old_pet = Pet.find_by(owner_id: params["id"])
        old_pet.name = params["pet"]["name"]
        old_pet.save
      end 
    end 
     @owner.save
    redirect :"/owners/#{@owner.id}"
  end
end



