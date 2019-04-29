json.merge! party.attributes
json.djs do
  json.array! party.djs do |dj|
    json.name dj.name
    json.content dj.content
  end
end
json.bands do
  json.array! party.bands do |band|
    json.name band.name
    json.url band.url
  end
end
