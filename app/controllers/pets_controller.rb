class PetsController < ApplicationController

  # get '/pets' do
  #   @pets = Pet.all
  #   erb :'/pets/index' 
  # end

  get '/pets/new' do 
  erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(params["pet"])
    redirect "pets/#{@pet.id}"
  end
  
  
  get '/pets/:id' do 
    @pet = Pet.find_by_id(params["id"])
     redirect :"pets/show"
  end 


  get '/pets/:id/edit' do 
    @pet = Pet.find_by_id(params["id"])
     redirect :"pets/edit"
  end 
  
  
  get '/pets' do 
    @pet = Pet.all
    erb :'/pets/index'
  end
  
  
  patch '/pets/:id' do 
    @pet = Pet.find_by_id(params["id"])
    @pet.name = params["pet"]["name"]
    @pet.save
    redirect  "pets/#{@pet.id}"
  end
end
 
  
  # post '/pets/:id' do
  #   @pet = Pet.find(params[:id])
  #   @pet.update(params["pet"])
  #   if !params["owner"]["name"].empty?
  #     @pet.owner = Owner.create(name: params["owner"]["name"])
  #   end
  #   @pet.save
  #   redirect "pets/#{@pet.id}"
  # end
  
  

