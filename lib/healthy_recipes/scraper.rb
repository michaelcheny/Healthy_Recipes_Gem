class RecipeScraper

  STATIC_URL = "http://www.whfoods.com/recipestoc.php"

  
  def self.scrape_recipe_name

    parsed_url = Nokogiri::HTML(open(STATIC_URL))

    recipe_card = parsed_url.css
    binding.pry

  end

end