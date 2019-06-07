
class Recipes

  

  @@all = []

  attr_accessor :name, :url, :type, :animal_friendly

  def initialize(name = nil, url = nil, type = nil, animal_friendly = nil)
    @name = name
    @url = url
    @type = type
    @animal_friendly = animal_friendly
    @@all << self
  end

  def self.all
    @@all
  end

  

end