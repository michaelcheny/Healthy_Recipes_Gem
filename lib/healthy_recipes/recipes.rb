class Recipes

  @@all = []

  attr_accessor :name, :url, :category, :type, :animal_friendly, :ingredients, :instructions, :in_depth_url, :macros, :calories
  # attr_reader :category


    # will need to initialize recipes with more attrs
  def initialize(name = nil, url = nil, category = nil, animal_friendly = nil)
    @name = name
    @url = url
    @category = category 
    @animal_friendly = animal_friendly
    @instructions = nil
    @ingredients = nil
    @in_depth_url = "Unavailable"
    @macros = "Unavailable"
    @calories = "Unavailable"
    self.class.all << self
  end

  def self.all
    @@all
  end


end