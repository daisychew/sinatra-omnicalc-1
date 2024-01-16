require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @input_num = params.fetch("users_number")
  @result_num = params.fetch("users_number").to_f ** 2

  erb(:squared)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @input_num = params.fetch("users_number")
  @result_num = Math.sqrt(params.fetch("users_number").to_f)  

  erb(:square_rooted)
end
