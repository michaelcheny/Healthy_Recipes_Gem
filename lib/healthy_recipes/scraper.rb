class RecipeScraper

  STATIC_URL = "http://www.whfoods.com/recipestoc.php"

  
  def self.scrape_recipe_name

    parsed_url = Nokogiri::HTML(open(STATIC_URL))

    recipe_container = parsed_url.css("div.slot-6-7-8 li a")
    recipe_container.each do |dish|
      name = dish.text.gsub(/^[ \t]/, "")
      url = "http://www.whfoods.com/#{dish.attr("href")}"
      
      Recipes.new(name, url)
    
    end
    # dishes = recipe_container.css("ul.blist")
    # whatisthis = dishes.css("li a")
      
    binding.pry
    
  end

end