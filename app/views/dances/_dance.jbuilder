json.extract! dance, :id, :name, :content
json.dance_type do
  json.extract! dance.dance_type, :id, :name, :color, :image
end
