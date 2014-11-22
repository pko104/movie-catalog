require 'sinatra'
require 'csv'
require 'pry'

def movies_full_list(filename)
  movies = []
  CSV.foreach(filename, headers: true) do |row|
    movies << row.to_hash
  end
  movies
end

get '/' do
  erb :index
end

get '/movies' do

@search_array = []
@page = params[:page]
@listed = movies_full_list("movies.csv")
 if params[:query]
   @query = params[:query]
end
   erb :movies
end

get '/movies/:id' do

  @current_movie = movies_full_list("movies.csv").find{|moviehash| moviehash["id"] == params[:id]}

erb :single
end







