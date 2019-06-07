class CLI

  BLANK_LINE = puts ""
  SEPERATOR   = puts "--------------------------------------------------------------"
  SQUIGLY_LINE = puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

  def call
    self.greeting
    # RecipeScraper.scrape_recipe_name_and_url_non_vegan
    RecipeScraper.scrape_recipe_by_categories("side salad")
  end

  def greeting
    BLANK_LINE
    SQUIGLY_LINE
    puts ""
    puts "testing"
    puts "Welcome"
    puts "we're gonna scrape this site for the nutritional values of foods"
    puts "www.whfoods.com"
    puts "stay put, these are just placeholder texts"
    puts ""
  end


end