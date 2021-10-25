# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require open-uri and json files
#  url_original = 'https://api.themoviedb.org/3/movie/top_rated?api_key=<your_api_key>'
#  url_le_wagon = url_original.sub! 'https://api.themoviedb.org/3', 'http://tmdb.lewagon.com'
#  url_original = url_le_wagon.sub! '<your_api_key>', your_api
#  poster = "#{prefix_poster}#{specif_movie}"
#  fetch 'http://tmdb.lewagon.com/movie/top_rated'
require 'json'
require 'open-uri'
url = 'http://tmdb.lewagon.com/movie/top_rated'
puts 'Creating top movies...'

uri = URI(url)
response = Net::HTTP.get(uri)
results = JSON.parse(response)
window_width = "300"
prefix_poster = "https://image.tmdb.org/t/p/#{window_width}"

results['results'].each do |result|
  poster_url = "#{prefix_poster}#{result['poster_path']}"
  new_movie = Movie.new(title: result['title'], overview: result['overview'],
                        poster_url: poster_url, rating: result['vote_average'])
  new_movie.save!
end
puts 'Finished!...'
