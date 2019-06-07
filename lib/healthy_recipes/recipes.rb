
class Recipes

  

  @@all = []

  attr_accessor :name, :url, :type, :animal_friendly, :categories, :recipes


    ## will need to initialize recipes with more attrs
  def initialize(name = nil, url = nil, category = nil, animal_friendly = nil)
    @name = name
    @url = url
    @category = category
    @animal_friendly = animal_friendly
    @recipe = []
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
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    
  end


end