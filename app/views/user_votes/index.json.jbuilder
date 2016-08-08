json.array!(@user_votes) do |user_vote|
  json.extract! user_vote, :id, :user_id, :joke_id
  json.url user_vote_url(user_vote, format: :json)
end
