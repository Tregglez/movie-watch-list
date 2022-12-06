require 'open-uri'
require 'json'

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)['results']

movies.each do |movie|
puts "Creating #{movie['title']}"
base_poster_url = "https://image.tmdb.org/t/p/original"
Movie.create(
  title: movie['title'],
  overview: movie['overview'],
  poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
  rating: movie['vote_average']
)
end
puts "Movies created"
