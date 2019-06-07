class RecipeScraper

  STATIC_URL = "http://www.whfoods.com/recipestoc.php"

  @@category = []


  def self.seperate_categories
    parsed_url = Nokogiri::HTML(open(STATIC_URL))

    recipe_container = parsed_url.css("div.slot-6-7-8")

    hello = recipe_container.css("ul.blist").text.split("\n")

    breakfast = recipe_container.css("h3#breakfast+ul.blist").text.split("\n").reject(&:empty?)

    binding.pry

  end

  def self.scrape_recipe_name_and_url_non_vegan

    parsed_url = Nokogiri::HTML(open(STATIC_URL))

    recipe_container = parsed_url.css("div.slot-6-7-8")
    recipe_container.css("li a").each do |dish|
      name = dish.text.gsub(/^[ \t]/, "")
      url = "http://www.whfoods.com/#{dish.attr("href")}"
      
        ## add food category and animalfriendly

        # binding.pry
        #try to add food category
      type = recipe_container.css("h3").text if recipe_container.css("ul.blist~li a")
      animal_friendly = 

      Recipes.new(name, url, type, animal_friendly)
    
    end
    binding.pry
  end

  # scrape level 2 for recipe and instructions

  # scrape level 3 for macros

end