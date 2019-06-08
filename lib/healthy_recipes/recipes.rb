class Recipes

  @@all = []

  attr_accessor :name, :url, :type, :animal_friendly, :category, :recipes, :ingredients, :macros


    # will need to initialize recipes with more attrs
  def initialize(name = nil, url = nil, category = nil, animal_friendly = nil)
    @name = name
    @url = url
    @category = category
    @animal_friendly = animal_friendly
    @directions = nil
    @ingredients = nil
    @macros = nil
    self.class.all << self
  end

  def self.all
    @@all
  end

  
  def self.destroy_all
    @@all.clear
  end

  # def categories
  #   self.categories.name
  # end

  # add recipe
  # add ingredients 
  # add prep and cook time
  # add calories
  # add macros
  # def save
  #   @@all << self
  # end
  # def self.create(name)

  # end


end