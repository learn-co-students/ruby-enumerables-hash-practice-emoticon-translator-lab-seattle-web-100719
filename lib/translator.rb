# require modules here
require "yaml"
link_yml= './lib/emoticons.yml'



def load_library(path)
  # code goes here
   emoticons = YAML.load_file(path)
   emoticons_l={}
   emoticons_l[:get_meaning]={}
   emoticons_l[:get_emoticon]={}
   emoticons_l[:get_meaning] = emoticons.map{ |key_meaning, value_emo| [value_emo[1],key_meaning] }.to_h
   emoticons_l[:get_emoticon] = emoticons.map{ |key_meaning, value_emo| [value_emo[0],value_emo[1]] }.to_h  
   emoticons_l
end

def load_library2(path)
  emoticons = YAML.load_file(path)
end
  



def get_japanese_emoticon(path, t_w_emoticon)
  # code goes here
  emoticons=load_library(path)
  j_emoticon= "Sorry, that emoticon was not found"
  emoticons[:get_emoticon].each_key { |t_w_emo|  j_emoticon = emoticons[:get_emoticon][t_w_emo] if t_w_emoticon==t_w_emo}
  j_emoticon
end

def get_english_meaning(path, j_emoticon)
  # code goes here
  emoticons=load_library(path)
  emoticon_meaning = "Sorry, that emoticon was not found"
  emoticons[:get_meaning].each_key { |j_emo|  emoticon_meaning = emoticons[:get_meaning][j_emo] if j_emoticon==j_emo}
  emoticon_meaning
end

