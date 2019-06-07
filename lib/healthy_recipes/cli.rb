
class CLI

  def call
    self.greeting
    # RecipeScraper.scrape_recipe_name_and_url_non_vegan
    RecipeScraper.seperate_categories("vegan veggies")
  end

  def greeting
    puts ""
    puts "testing"
    puts "Welcome"
    puts "we're gonna scrape this site for the nutritional values of foods"
    puts "www.whfoods.com"
    puts "stay put, these are just placeholder texts"
    puts ""
  end


end