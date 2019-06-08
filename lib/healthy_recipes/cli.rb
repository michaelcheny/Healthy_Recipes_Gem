class CLI

  ## blank line  ""
  ## seperator   "---------------------------------------------------------------"
  ## squiglyline "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

  # def initialize
  #   start = RecipeScraper.new
  #   start.scrape_all_categories
  # end

  def call
    self.greeting
    sleep(1)
    # self.art
    
    RecipeScraper.scrape_all_categories
    # RecipeScraper.scrape_ingredients_and_directions(recipe)
    loop do
      user_input = main_menu
      if user_input == "exit" || user_input.include?("n")
        return
      else
        self.list_categories
        self.choose_categories
      end
    end
  end


  def start_scraping

  end
#   def art
#  puts "   __                _ 
#     / _|              | |
#    | |_ ___   ___   __| |
#    |  _/ _ \ / _ \ / _` |
#    | || (_) | (_) | (_| |
#    |_| \___/ \___/ \__,_|"
#   end
   

  def greeting
    puts ""
    puts "---------------------------------------------------------------"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "Welcome!"
    puts "This is a gem to let user's find healthy recipes!"
    puts "why eating healthy is beneficial"
    puts "add some other eat health facts"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "---------------------------------------------------------------"
    puts ""
  end

  def main_menu
    puts ""
    puts "Choose a category of recipes"
    puts "enter anything"
    input = gets.strip.downcase
    return input
  end

  def list_categories
    puts "The categories you can choose from:"
    puts ""
    puts Recipes.all.each_with_index{|c, i| puts "#{i+1}. #{c.name}"}
  end
  
  def choose_categories
    puts "choose"
    index = gets.strip.to_i - 1
    recipe = Recipes.all[index]
    RecipeScraper.scrape_ingredients_and_directions(recipe)
    # self.display_recipe_info(recipe)
  end

  def display_recipe_info(recipe)
    puts recipe.name
    puts recipe.url
    # puts recipe.directions
    # puts recipe.ingredients
  end

  def reject_input
    puts "Invalid input, please try again."
  end

end