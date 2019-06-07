
class Recipes

  

  @@all = []

  attr_accessor :name, :url, :type, :animal_friendly, :categories


    ## will need to initialize recipes with more attrs
  def initialize(name = nil, url = nil, category = nil, animal_friendly = nil)
    @name = name
    @url = url
    @category = category
    @animal_friendly = animal_friendly
    @@all << self
  end

  def self.all
    @@all
  end

  def categories
    self.categories.name
  end

  # add recipe
  # add ingredients 
  # add prep and cook time
  # add calories
  # add macros

  

end