class Category

  @@all

  attr_accessor :name, :categories

  def initialize(name)
    @name = name
    @categories = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_recipe(recipe)
    binding.pry
    @categories << recipe
    recipe.categories = self
    # binding.pry
  end

  def categories
    @categories
  end

end

## make a self.find_by_name class that takes in arg

## make a self.create class

## make a self.find_or_create_by_name class that takes in arg of name

## 