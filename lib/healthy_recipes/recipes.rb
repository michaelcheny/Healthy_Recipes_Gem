class Recipes

  @@all = []

  attr_accessor :name, :url, :type, :animal_friendly, :ingredients, :instructions, :in_depth_url, :macros
  attr_reader :category


    # will need to initialize recipes with more attrs
  def initialize(name = nil, url = nil, category = nil, animal_friendly = nil)
    @name = name
    @url = url
    @category = category #if category
    @animal_friendly = animal_friendly
    @instructions = nil
    @ingredients = nil
    @in_depth_url = "Unavailable"
    @macros = "Unavailable"
    self.class.all << self
  end

  def self.all
    @@all
  end

  
  # def self.destroy_all
  #   @@all.clear
  # end

  # def categories=(category)
  #   @category = category
  #   category.add_recipe(self)
  #   binding.pry
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