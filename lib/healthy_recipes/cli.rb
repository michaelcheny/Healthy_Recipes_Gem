class CLI

  def call
    ## greet user
    self.greeting
    RecipeScraper.make_recipes_from_categories
    self.list_categories
    ## list out the categories
    ## let user select a category
    # self.list_categories
    # self.choose_categories
    ## list out recipes from category
    ## let users choose recipe
    # self.list_recipes_from_category
    # self.choose_recipe_from_category
    ## use that user's selection as an argument to scrape that category

    ##### ADD CONDITIOnals TO make program work like a program
    
    # loop do
    #   user_input = main_menu
    #   if user_input == "exit" || user_input.include?("n")
    #     return
    #   else
    #     self.list_categories
    #     self.choose_categories
    #   end
    # end
    ### maybeeeeeeee add a extra bonus choice for users to select individual foods
    ### maybeeeee add code from food database project to let user find individual food macros
  end


  def greeting
    puts ""
    # self.seperator
    # puts ""
    puts "Welcome!"
    # puts "This is a gem to let user's find healthy recipes!"
    # puts "why eating healthy is beneficial"
    # puts "add some other eat health facts"
    puts ""
    # self.seperator
    # puts ""
    # sleep(1)
  end

  def list_categories
    puts "Categories:"
    Recipes.get_category_names.each.with_index(1){|category, index| puts "#{index}. #{category}"}
    self.choose_category
  end

  def choose_category
    puts "Please choose category number:"
    user_selected_index = gets.strip.to_i - 1

    category = Recipes.get_category_names[user_selected_index]
    # binding.pry
    self.list_recipes_from_category(category)
  end


  def list_recipes_from_category(selected_category)

    recipes = Recipes.group_by_category(selected_category)
    # binding.pry
    recipes.each.with_index(1){|recipe_object, index| puts "#{index}. #{recipe_object.name}"}
    # binding.pry
    #.each.with_index(1){|recipe, index| puts "#{index}. #{recipe}"}

  end

  # def list_categories
  #   puts "The categories you can choose from:\n\n"
  #   # binding.pry
  #   RecipeScraper.scrape_all_categories.each.with_index(1){|category, index| puts "#{index}. #{category}"}
  #   puts "\n"
  #   # puts HealthyRecipes::Category.all.each_with_index{|c, i| puts "#{i+1}. #{c.name.split.map(&:capitalize).join(" ")}"}
  #   # binding.pry
  #   self.choose_categories
  # end
  

  # def choose_categories
  #   puts "Please choose a category number:\n"
  #   category_input = gets.strip.to_i 
  #   ### Once user gives input, use that input as argument to scrape which category.
  #   RecipeScraper.scrape_recipe_by_categories(category_input)
  #   # RecipeScraper.scrape_ingredients_and_directions(recipe)
  #   # self.display_recipe_info(recipe)
  # end


  # def list_recipes_from_category
  #   puts "\n\nHere are your selections:\n\n"
  #   sleep(1)
  #   Recipes.all.each.with_index(1){|recipe, index| puts "#{index}. #{recipe.name}"}
  #   binding.pry
  # end
  

  def choose_recipe_from_category

    puts "\nPlease choose a recipe number: \n"

    recipe_selection_index = gets.strip.to_i - 1
    recipe_number = Recipes.all[recipe_selection_index]

    RecipeScraper.scrape_ingredients_and_directions(recipe_number)
    RecipeScraper.scrape_calories_page(recipe_number) unless Recipes.all[recipe_selection_index].in_depth_url == "Unavailable"

    display_recipe_info(recipe_number)

  end 


  def display_recipe_info(recipe)
    self.seperator
    puts "\n#{recipe.name}\n\n"
    puts "Category:                  #{recipe.category}"
    puts "Animal friendly:           #{recipe.animal_friendly}\n"
    puts "Link to recipe:            #{recipe.url}\n\n"
    puts "Estimated Calories:        #{recipe.calories}"
    puts "\n\nIngredients: \n#{recipe.ingredients}"
    puts "\nStep by step instructions: \n\n"
    recipe.instructions.split("\n").delete_if(&:empty?).each_with_index{|step, i| puts "#{i+1}. #{step}"}
    self.seperator
    binding.pry
  end

  ### make more classes so each class does one thing

  def menu_guidance
    puts "Type 'main' to go back to main menu, or 'exit' to exit."
  end

  def reject_input
    puts "Invalid input, please try again."
  end

  def seperator
    puts "----------------------------------------------------------------------------"
  end

end