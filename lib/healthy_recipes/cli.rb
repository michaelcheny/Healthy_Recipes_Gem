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
    # user_input = main_menu
    # unless user_input == "exit" || user_input.include?("n")
      self.list_categories
      # self.choose_categories
    # end
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

    input = gets.strip.downcase
    return input
  end

  def list_categories
    puts "The categories you can choose from:"
    puts ""
    puts Recipes.all #.each_with_index{|c, i| puts "#{i+1}. #{c.name}"}
  end
  
  def choose_categories
    puts "choose"
    

  end

  def reject_input
    puts "Invalid input, please try again."
  end

end