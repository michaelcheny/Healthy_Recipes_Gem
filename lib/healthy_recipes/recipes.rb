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

  def self.get_category_names
    self.all.map{|recipe| recipe.category}.uniq
  end

  def self.group_by_category(user_selected_category)
    # binding.pry
    self.all.map{|recipe| return recipe if recipe.category == user_selected_category}
  end



end