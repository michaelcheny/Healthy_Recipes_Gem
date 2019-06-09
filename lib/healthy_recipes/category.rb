class Category

  @@all = []

  attr_accessor :name, :recipes

  def initialize(name)
    @name = name
    @recipes = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_recipe(recipe)
    # binding.pry
    self.recipes << recipe unless self.recipes.include?(recipe)
    recipe.category = self unless recipe.category #== self
    # recipe.categories = self
    # binding.pry
  end

  def self.create(name)
    self.new(name).tap(&:save)
  end

  def recipes
    self.recipes.map(&:recipe).uniq
  end

  # def self.find_by_name(name)
  #   self.all.find{|category| category.name == name}
  # end

  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end

end

## make a self.find_by_name class that takes in arg

## make a self.create class

## make a self.find_or_create_by_name class that takes in arg of name

## 