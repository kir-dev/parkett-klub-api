json.merge! party.attributes
json.djs do
  json.array! party.djs do |dj|
    json.id dj.id
    json.name dj.name
    json.content dj.content
  end
end
json.bands do
  json.array! party.bands do |band|
    json.id band.id
    json.name band.name
    json.url band.url
  end
end
