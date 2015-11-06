json.array!(@links) do |link|
  json.extract! link, :id, :title, :url, :summary
  json.url link_url(link, format: :json)
end
