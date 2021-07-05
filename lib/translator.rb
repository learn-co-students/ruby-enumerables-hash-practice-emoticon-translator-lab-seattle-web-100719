require 'yaml'

def load_library(file_path)
  x = YAML.load_file(file_path)
  x
  new_hash = {}
  new_hash['get_meaning'] = {}
  new_hash['get_emoticon'] = {}

  x.each do |k, v|
  new_hash['get_meaning'][v[1]] = k
    new_hash['get_emoticon'][v[0]] = v[1]
  end
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  sorted_hash = load_library(path)
  get_emo = sorted_hash['get_emoticon']

  if get_emo.has_key?("#{emoticon}")
    return get_emo["#{emoticon}"]
  else
    return 'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(pathx, emoticon)
  sorted_hash = load_library(pathx)
  get_emo = sorted_hash['get_meaning']

  if get_emo.has_key?("#{emoticon}")
    return get_emo["#{emoticon}"]
  else
    return 'Sorry, that emoticon was not found'
  end
end