class Recipes

  @@all = []

  attr_accessor :name, :url, :category, :type, :animal_friendly, :ingredients, :instructions, :in_depth_url, :calories, :serving_size

  def initialize(name = nil, url = nil, category = nil, animal_friendly = nil)
    @name = name
    @url = url
    @category = category 
    @animal_friendly = animal_friendly
    @instructions = "Unavailable"
    @ingredients = "Unavailable"
    @in_depth_url = "Unavailable"
    @serving_size = "Unavailable"
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
    self.all.map{|recipe| recipe if recipe.category == user_selected_category}.compact
  end

  # def self.get_recipe_info(recipe)
  #   RecipeScraper.scrape_ingredients_and_directions(recipe)
  #   RecipeScraper.scrape_calories_page(recipe) unless recipe.in_depth_url == "Unavailable"
  #   return recipe
  # end

end