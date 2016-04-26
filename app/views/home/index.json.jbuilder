json.screen_name @user.screen_name
json.description @user.description
json.tweets_count @user.tweets_count
json.followers_count @user.followers_count
json.favourites_count @user.favourites_count
json.banner @user.profile_banner
json.profile_image @user.profile_image

json.tweets @user.tweets do |tweet|
  json.author tweet.author
  json.text tweet.message
  json.created_at time_ago_in_words(tweet.created_at)
  json.id tweet.id
  json.image tweet.big_profile_image
  json.is_retweet tweet.retweet?
end
