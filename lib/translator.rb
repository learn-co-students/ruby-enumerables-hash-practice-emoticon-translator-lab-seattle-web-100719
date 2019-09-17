# require modules here
require "yaml"

def load_library(library)
  # code goes here
  emoticons = YAML.load_file(library)
  dictionary = {get_meaning: {}, get_emoticon: {}}
  emoticons.keys.each do |meaning|
    english_emoticon = emoticons[meaning][0]
    japanese_emoticon = emoticons[meaning][1]
    dictionary[:get_meaning][english_emoticon]  = "#{meaning}"
    dictionary[:get_meaning][japanese_emoticon] = "#{meaning}"
    dictionary[:get_emoticon][english_emoticon] = japanese_emoticon
    dictionary[:get_emoticon][japanese_emoticon] = english_emoticon
  end
  return dictionary
end

def get_japanese_emoticon(library, emoticon)
  dictionary = load_library(library)
  return dictionary[:get_emoticon][emoticon] ? dictionary[:get_emoticon][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(library, emoticon)
  # code goes here
  dictionary = load_library(library)
  return dictionary[:get_meaning][emoticon] ? dictionary[:get_meaning][emoticon] : "Sorry, that emoticon was not found"
end