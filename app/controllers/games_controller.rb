require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
    @letters
  end

def english_word?(word)
  url = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(url.read)
  json ['found']
end

  def score
    if english_word?(params[:suggestion])
      @true = "congrats"
    else
      @true = "sorry"
    end
  end
end
