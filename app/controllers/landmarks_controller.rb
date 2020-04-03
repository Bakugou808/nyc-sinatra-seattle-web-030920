class LandmarksController < ApplicationController
  # add controller methods


  #read all

  get '/landmarks' do 
    @landmarks = Landmark.all 
    erb :'landmarks/index'
  end

  #read instance

  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  #create

  # get '/landmarks/new' do 
  #   erb :'landmarks/new'
  # end

  # post '/landmarks' do 
  #   binding.pry
  #   @landmark = Landmark.create(params[:landmark]) ---> Landmark.create(name: "eifel tower", figure_id: 3, year_completed: 1698)
  # end


end
