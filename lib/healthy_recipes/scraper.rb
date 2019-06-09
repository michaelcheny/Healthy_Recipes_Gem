class RecipeScraper

  DOMAIN = "http://www.whfoods.com/"
  PATH_TO_RECIPE_PAGE = "recipestoc.php"

  def self.scrape_recipe_by_categories(category)
    case category
    when 1 #|| "breakfast"
      selector = "breakfast"
    when 2 #|| "salad entrees"
      selector = "salad"
    when 3 #|| "soups"
      selector = "soup"
    when 4 #|| "fish"
      selector = "fish" ###finish changing these names
    when 5 #|| "chicken and turkey"
      selector = "poultry"
    when 6 #|| "lean meat"
      selector = "meat"
    when 7 #|| "vegetarian entrees"
      selector = "vegetarian"
    when 8 #|| "side salad/dressings"
      selector = "sidesalad"
    when 9 #|| "side vegetables"
      selector = "sideveg"
    when 10 #|| "desserts"
      selector = "dessert"

    when 11 #|| "vegan breakfast"
      selector = "vbreakfast"
    when 12 #|| "vegan salad entrees"
      selector = "vsalad"
    when 13 #|| "vegan soups"
      selector = "vsoup"
    when 14 #|| "vegan vegetarian entrees"
      selector = "vvegetarian"
    when 15 #|| "vegan side salad/dressings"
      selector = "vsidesalad"
    when 16 #|| "vegan side vegetables"
      selector = "vsideveg"
    when 17 #|| "vegan desserts"
      selector = "vdessert"
    end

    # @@recipes = []
    # puts "Scraping recipes from #{category.split.map(&:capitalize).join(" ")} category."
    binding.pry
    parsed_url = Nokogiri::HTML(open(DOMAIN + PATH_TO_RECIPE_PAGE))
    # binding.pry
    recipe_container = parsed_url.css("div.slot-6-7-8")
    # binding.pry
    recipe_container.css("h3##{selector}+ul.blist li a").each do |dish|  
      binding.pry
        ## clean up leading white space
      
      name = dish.text.gsub(/^[ \t]/, "")
      url = DOMAIN + "#{dish.attr("href")}"
      # type = "#{category.split.map(&:capitalize).join(" ")}"
      # categoryy = Category.find_or_create_by_name(category)
      animal_friendly = type.include?("Vegan") ? "Yes" : "No"

      # puts "Adding #{name} to recipes. Hang tight."
      
        ## shove Recipes.new(attrs) into recipes
      # recipes << {
      #   name: name,
      #   ingredient_url: url,
      #   category: categoryy,
      #   animal_friendly: animal_friendly
      # }
      # @@recipes = Recipes.new(name, url, categoryy, animal_friendly)
      Recipes.new(name, url, type, animal_friendly)
      # Recipes.new(name, url, category, animal_friendly)
    end
    # binding.pry
    # return @@recipes
  end

      ## scrape all the categories to start off
  def self.scrape_all_categories
    parsed_url = Nokogiri::HTML(open(DOMAIN + PATH_TO_RECIPE_PAGE))
    general_container = parsed_url.css("div.slot-6-7-8")
    ## non vegan
    categories = general_container.css("h2#recipes~h3")[0..9].map(&:text)
    ## vegan
    general_container.css("h2#recipes~h3")[10..16].each { |container| categories << "Vegan " + container.text}
    return categories
  end






  def self.scrape_ingredients_and_directions(recipe)
    recipe_url = recipe.url
    level_one_container = Nokogiri::HTML(open(recipe_url))
    level_one_container.css("div.slot-6-7-8").each do |steps|
      recipe.ingredients = steps.css("tr td ul.llist").text
      recipe.directions = steps.css("p~ol").text
      recipe.in_depth_url = steps.css("p b:contains('In-Depth Nutritional Profile')+a").attr('href').text unless steps.css("p b:contains('In-Depth Nutritional Profile')+a").attr('href').nil?
    binding.pry
    end
  end

  def scrape_nutrients_page 


  end







  # scrape level 2 for recipe and instructions

  # scrape level 3 for macros









  # def self.scrape_recipe_name_and_url_non_vegan

  #   parsed_url = Nokogiri::HTML(open(STATIC_URL))

  #   recipe_container = parsed_url.css("div.slot-6-7-8")
  #   recipe_container.css("li a").each do |dish|
  #     name = dish.text.gsub(/^[ \t]/, "")
  #     url = "http://www.whfoods.com/#{dish.attr("href")}"
      
  #       ## add food category and animalfriendly





    # scrape_recipe_by_categories("breakfast")
    # scrape_recipe_by_categories("salad")
    # scrape_recipe_by_categories("soup")
    # scrape_recipe_by_categories("fish")
    # scrape_recipe_by_categories("poultry")
    # scrape_recipe_by_categories("meat")
    # scrape_recipe_by_categories("vegetarian")
    # scrape_recipe_by_categories("side salad")
    # scrape_recipe_by_categories("side veggies")
    # scrape_recipe_by_categories("dessert")
    # scrape_recipe_by_categories("vegan breakfast")
    # scrape_recipe_by_categories("vegan salad")
    # scrape_recipe_by_categories("vegan soup")
    # scrape_recipe_by_categories("vegan veggies")
    # scrape_recipe_by_categories("vegan side salad")
    # scrape_recipe_by_categories("vegan side veggies")
    # scrape_recipe_by_categories("vegan dessert")
  



  #       # binding.pry
  #       #try to add food category
  #     category = recipe_container.css("h3").text if recipe_container.css("ul.blist~li a")
  #     animal_friendly = 

  #     Recipes.new(name, url, category, animal_friendly)
    
  #   end
  #   binding.pry
  # end

  

end
