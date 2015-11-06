json.array!(@votes) do |vote|
  json.extract! vote, :id, :link_id
  json.url vote_url(vote, format: :json)
end
