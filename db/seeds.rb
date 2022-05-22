require "open-uri"

url = 'https://tmdb.lewagon.com/movie/top_rated'
awnser_serialized = URI.open(url).read
awnser = JSON.parse(awnser_serialized)
awnser['results'].each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}", rating: movie['vote_average'])
end
