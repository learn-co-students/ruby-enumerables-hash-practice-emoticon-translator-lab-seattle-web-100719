require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)

  hash = {}
  each_meaning = {}
  each_emoticon = {}

  emoticons.each do |key, value|
    each_meaning[value[1]] = key
    each_emoticon[value[0]] = value[1]
  end

  hash["get_meaning"] = each_meaning
  hash["get_emoticon"] = each_emoticon

  hash
end

def get_japanese_emoticon(file, emoticon)
  response = load_library(file)
  response["get_emoticon"].has_key?(emoticon) ? response["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  response = load_library(file)
  response["get_meaning"].has_key?(emoticon) ? response["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
