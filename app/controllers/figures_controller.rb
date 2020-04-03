class FiguresController < ApplicationController
  # add controller methods

  #Create
  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do 
    create_fig_params = {name: params[:figure][:name], title_ids: params[:figure][:title_ids], landmark_ids: params[:figure][:landmark_ids]}
    @figure = Figure.create(create_fig_params)
    if !params[:figure][:title][:name].empty?
      new_title = Title.create(params[:figure][:title])
      @figure.titles << new_title 
    end 
    if !params[:figure][:landmark][:name].empty? && !params[:figure][:landmark][:year_completed].empty?
      new_landmark = Landmark.create(params[:figure][:landmark])
      @figure.landmarks << new_landmark 
    end 

    redirect to "/figures/#{@figure.id}"
  end

  #Read
  #Read(all) --> /index will display all instances of figure

  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end

  #read instance
  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end 


  #Update

  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @titles = Title.all 
    @landmarks = Landmark.all 
    erb :'/figures/edit'
  end

  patch '/figures/:id' do 
    update_fig_params = {title_ids: params[:figure][:title_ids], landmark_ids: params[:figure][:landmark_ids]}
    @figure = Figure.find(params[:id])
    @figure.update(update_fig_params)
    if !params[:figure][:title][:name].empty?
      new_title = Title.create(params[:figure][:title])
      @figure.titles << new_title 
    end 
    if !params[:figure][:landmark][:name].empty? && !params[:figure][:landmark][:year_completed].empty?
      new_landmark = Landmark.create(params[:figure][:landmark])
      @figure.landmarks << new_landmark 
    end 

    redirect to "/figures/#{@figure.id}"
    
  end 


  #Delete

  delete '/figures/:id' do 
    @figure = Figure.find(params[:id])
    @figure.delete 

    redirect to '/figures'

  end



end
