class CLI

  def call
    self.greeting
    RecipeScraper.make_recipes_from_categories
    self.main_menu
  end
   

  def greeting
    puts "\n\nWelcome!"
    puts "This is a gem to let user's find healthy recipes!\n\n"
  end


  def main_menu
    puts "Type anything to enter main menu or 'Q' to (Q)uit"
    user_input = gets.strip.downcase

    if user_input == "q"
      self.farewell
    else
      self.list_categories
    end 
  end


  def list_categories
    puts "\n\nCategories:\n\n"
    self.list_with_index_helper(Recipes.get_category_names)

    self.choose_category
  end


  def choose_category
    puts "\n\nPlease choose a valid category number or (Q)uit\n"
    user_selected_index = gets.strip.downcase

    if user_selected_index.to_i.between?(1, Recipes.get_category_names.length)
      category = Recipes.get_category_names[user_selected_index.to_i - 1]
      self.recipe_selection_from_category(category)
    elsif user_selected_index == "q"
      self.farewell
    else
      self.reject_input
      self.list_categories
    end
  end

 
  def recipe_selection_from_category(selected_category)
    recipes = Recipes.group_by_category(selected_category)
  
    puts "\n#{selected_category}\n\n"

    self.recipe_list_helper(recipes)
    puts "\n\nPlease enter a recipe number or (B)ack to main menu or (Q)uit\n"
    recipe_index = gets.strip.downcase

    if recipe_index.to_i.between?(1, recipes.length)
      selected_recipe = recipes[recipe_index.to_i - 1]
      Recipes.get_recipe_info(selected_recipe) 
      self.display_recipe_info(selected_recipe)
    elsif recipe_index == "b"
      self.list_categories
    elsif recipe_index == "q"
      self.farewell
    else 
      self.reject_input
      self.recipe_selection_from_category(selected_category)
    end
  end


  def display_recipe_info(recipe)
    puts "----------------------------------------------------------------------------"
    puts "\n#{recipe.name}\n\n"
    puts "Category:                  #{recipe.category}"
    puts "Animal friendly:           #{recipe.animal_friendly}\n\n"
    puts "Serving size:              #{recipe.serving_size}"
    puts "Calories per serving:      #{recipe.calories}"
    puts "\n\nIngredients:         \n#{recipe.ingredients}"
    puts "\nStep by step instructions: \n\n"
    self.list_with_index_helper(recipe.instructions)
    puts "\n----------------------------------------------------------------------------\n\n"

    self.ask_user_what_to_do(recipe.category)
  end


  def ask_user_what_to_do(category_from_recipe_displayed)
    puts "Choose (B)ack to recipe selection or (M)ain menu or (Q)uit:"
    user_input = gets.strip.downcase

    if user_input == "b"
      self.recipe_selection_from_category(category_from_recipe_displayed)
    elsif user_input == "m"
      self.list_categories
    elsif user_input == "q"
      self.farewell
    else
      self.reject_input
      self.ask_user_what_to_do(category_from_recipe_displayed)
    end
  end

  def list_with_index_helper(list)
    list.each_with_index{|item, index| puts "(#{index + 1}) #{item}"}
  end

  def recipe_list_helper(list)
    list.each_with_index{|recipe, index| puts "(#{index + 1}) #{recipe.name}"}
  end

  def farewell
    puts "\nThanks for trying this app out. Goodbye\n\n"
    exit
  end


  def reject_input
    puts "\nInvalid input, try again."
    sleep(2)
  end

end