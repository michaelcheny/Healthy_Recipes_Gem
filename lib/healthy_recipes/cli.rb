class CLI

  ## blank line  ""
  ## seperator   "---------------------------------------------------------------"
  ## squiglyline "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

  def call
    self.greeting
    sleep(1.5)
    # self.art
    # RecipeScraper.scrape_recipe_name_and_url_non_vegan
    RecipeScraper.scrape_recipe_by_categories("vegan breakfast")

    user_input = main_menu
    unless user_input == "exit" || user_input.include?("n")
      self.list_categories
      # self.choose_categories
    end
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

    input = gets.strip.downcase
    return input
  end

  def list_categories
    puts "The categories you can choose from:"
    puts ""
    Category.all.each_with_index{|c, i| puts "#{i+1}. #{c.name}"}
  end

end