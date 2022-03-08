class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/profiles" do
    profiles = Profile.all.shuffle 
    profiles.to_json
  end

  get "/likes" do
    likes = Like.all
    likes.to_json
  end

  get "/users" do 
    users = User.all
    users.to_json
  end

  get "/matches" do
    match_array = Like.matching_profiles
    matches = match_array.collect do |match|
      match.profile
    end
    matches.to_json
  end

  patch "/likes/:userid/:profileid" do
    "Hey there #{params[userid]} it's #{params[profileid]}"
    #  Like.like_function(params[:userid], params[:profileid])
  end

  patch "/likes/dislike" do
    Like.dislike_function(params[:user], params[:profile])
  end

  patch "/likes/undo" do
    Like.undo_function(params[:user], params[:profile])
  end

end
