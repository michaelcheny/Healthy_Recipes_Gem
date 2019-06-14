class CLI

  def call
    self.greeting
    RecipeScraper.make_recipes_from_categories

    loop do
      user_input = main_menu

      if user_input == "exit" #|| user_input.include?("n")
        self.exit
        return
      else
        self.list_categories
      end

    end
  end
   
 


  def greeting
    puts ""
    puts "Welcome!"
    puts "This is a gem to let user's find healthy recipes!"
    puts ""
  end


  def main_menu
    puts "Type anything to enter category selection menu: (Or 'exit' to exit)"
    input = gets.strip.downcase
    return input
  end


  def list_categories
    puts "\n\nCategories:\n\n"
    Recipes.get_category_names.each.with_index(1){|category, index| puts "#{index}. #{category}"}

    self.choose_category
  end

  def choose_category

    puts "\n\nPlease choose a valid category number: (or 'exit' to quit)\n"

    user_selected_index = nil

    until user_selected_index == "exit" || "back"
      user_selected_index = gets.strip

      if user_selected_index.to_i.between?(1, Recipes.get_category_names.length)
        category = Recipes.get_category_names[user_selected_index.to_i - 1]
        self.choose_recipes_from_category(category)
      elsif user_selected_index == "back"
        self.go_back
      elsif user_selected_index == "exit"
        CLI.
      else
        puts "Please choose a valid category number: (or 'exit' to quit)"
      end

    end
  end


  def choose_recipes_from_category(selected_category)
    recipes = Recipes.group_by_category(selected_category)
    puts ""
    recipes.each.with_index(1){|recipe_object, index| puts "#{index}. #{recipe_object.name}"}
    # binding.pry
    puts "\n\nPlease choose a recipe number: (or 'exit' to exit)\n"
    recipe_index = nil
    until recipe_index.to_i.between?(1, recipes.length)
    recipe_index = gets.strip
      if recipe_index.to_i.between?(1, recipes.length)
        selected_recipe = recipes[recipe_index.to_i - 1]
        self.get_recipe_info(selected_recipe) 
      elsif recipe_index == "back"
        self.go_back
      else 
        puts "Please choose a recipe number: (or 'exit' to exit)"
      end
    end
  end


  def get_recipe_info(recipe)
    RecipeScraper.scrape_ingredients_and_directions(recipe) 
    RecipeScraper.scrape_calories_page(recipe) unless recipe.in_depth_url == "Unavailable"
    self.display_recipe_info(recipe)
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
    puts "\n"

    self.seperator
    puts "\n\n"
    # self.ask_user_what_do_now
  end

  def ask_user_what_do_now
    puts "Enter 'back' to go back or 'exit' to exit':"
    user_input = gets.strip.downcase
    if user_input == "back"
      self.go_back
    elsif user_input == "exit"
      self.exit
    end
  end

  def go_back
    puts "Enter 'back' to return"
    return
  end

  def exit
    puts "\nThanks for trying this app out. Goodbye\n"
    return
  end

 




  ### make more classes so each class does one thingjkdskjdfhsjkfjhsjdfsjdfakjdalkdkasdaklsjdqwioeqiweqoiweuiqiowueqeqweqweqekaklsdjkasldja  a kdjaskl jakljsdjaslkdjkalsdakljsdljalskj dajjkdlaskjdajsdkljq123123149083490238490298349203894kldjklfjsdfsdf


  def reject_input
    puts "Invalid input, please try again."
  end

  def seperator
    puts "----------------------------------------------------------------------------"
  end

end