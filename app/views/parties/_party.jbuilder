json.merge! party.attributes
json.djs do
  json.array! party.djs do |dj|
    json.name dj.name
    json.content dj.content
  end
end
