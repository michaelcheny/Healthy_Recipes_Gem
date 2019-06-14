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
   
    ### maybeeeee add code from food database project to let user find individual food macros
 


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
    puts "\n\nPlease choose category number: (or 'exit' to quit)\n"
    user_selected_index = nil
    until user_selected_index == "exit"
      user_selected_index = gets.strip
      if user_selected_index.to_i.between?(1, Recipes.get_category_names.length)
        category = Recipes.get_category_names[user_selected_index.to_i - 1]
        self.choose_recipes_from_category(category)
      elsif user_selected_index == "exit"
        self.exit
      else
        puts "WHAT? TRY AGAIN!"
      end
    end
  end


  def choose_recipes_from_category(selected_category)
    recipes = Recipes.group_by_category(selected_category)
    puts ""
    recipes.each.with_index(1){|recipe_object, index| puts "#{index}. #{recipe_object.name}"}

    puts "\n\nPlease choose a recipe number:\n"
    recipe_index = gets.strip.to_i - 1
    selected_recipe = recipes[recipe_index]
    
    self.get_recipe_info(selected_recipe) 
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