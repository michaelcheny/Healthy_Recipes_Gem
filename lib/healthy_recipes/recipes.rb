
class Recipes

  

  @@all = []

  attr_reader :name, :calories_per_serving, :grams_per_serving, :url

  def initialize(name, calories_per_serving, grams_per_serving, url)

    @name = name
    @calories_per_serving = calories_per_serving
    @grams_per_serving = grams_per_serving
    @url = url
    @@all << self

  end

  def self.all
    @@all
  end

  

end