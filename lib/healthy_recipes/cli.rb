class CLI

  def call
    ## greet user
    self.greeting
    ## list out the categories
    ## let user select a category
    ## use that user's selection as an argument to scrape that category
    # HealthyRecipes::RecipeScraper.scrape_all_categories
    # RecipeScraper.scrape_all_categories
    self.list_categories
    self.choose_categories
    # RecipeScraper.scrape_ingredients_and_directions(recipe)
    # loop do
    #   user_input = main_menu
    #   if user_input == "exit" || user_input.include?("n")
    #     return
    #   else
    #     self.list_categories
    #     self.choose_categories
    #   end
    # end
  end


  def start_scraping

  end


  def greeting
    puts ""
    puts "---------------------------------------------------------------"
    
    puts "Welcome!"
    puts "This is a gem to let user's find healthy recipes!"
    puts "why eating healthy is beneficial"
    puts "add some other eat health facts"
    puts "---------------------------------------------------------------"
    puts ""
  end


  def list_categories
    puts "The categories you can choose from:"
    puts ""
    # binding.pry
    RecipeScraper.scrape_all_categories.each_with_index{|category, index| puts "#{index+1}. #{category}"}
    puts ""
    # binding.pry
    # puts HealthyRecipes::Category.all.each_with_index{|c, i| puts "#{i+1}. #{c.name.split.map(&:capitalize).join(" ")}"}
  end
  
  def choose_categories
    # sleep(1)
    puts "Please choose a category number:"
    puts ""
    category_input = gets.strip.to_i - 1 
    ### Once user gives input, use that input as argument to scrape which category.
    # recipe = Recipes.category[index]
    # binding.pry
    RecipeScraper.scrape_recipe_by_categories(category_input)
    # RecipeScraper.scrape_ingredients_and_directions(recipe)
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