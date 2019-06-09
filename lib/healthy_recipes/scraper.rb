class RecipeScraper

  DOMAIN = "http://www.whfoods.com/"
  PATH_TO_RECIPE_PAGE = "recipestoc.php"
  RECIPES = ["breakfast", "salad", "soup", "fish", "poultry", ]

  def self.scrape_recipe_by_categories(category)
    case category
    when "breakfast"
      selector = "breakfast"
    when "salad"
      selector = "salad"
    when "soup"
      selector = "soup"
    when "fish"
      selector = "fish"
    when "poultry"
      selector = "poultry"
    when "meat"
      selector = "meat"
    when "vegetarian"
      selector = "vegetarian"
    when "side salad"
      selector = "sidesalad"
    when "side veggies"
      selector = "sideveg"
    when "dessert"
      selector = "dessert"

    when "vegan breakfast"
      selector = "vbreakfast"
    when "vegan salad"
      selector = "vsalad"
    when "vegan soup"
      selector = "vsoup"
    when "vegan veggies"
      selector = "vvegetarian"
    when "vegan side salad"
      selector = "vsidesalad"
    when "vegan side veggies"
      selector = "vsideveg"
    when "vegan dessert"
      selector = "vdessert"
    end

    # @@recipes = []
    puts "Scraping recipes from #{category.split.map(&:capitalize).join(" ")} category."

    parsed_url = Nokogiri::HTML(open(DOMAIN + PATH_TO_RECIPE_PAGE))
    recipe_container = parsed_url.css("div.slot-6-7-8")
    recipe_container.css("h3##{selector}+ul.blist li a").each do |dish|  

        ## clean up leading white space
      
      name = dish.text.gsub(/^[ \t]/, "")
      url = DOMAIN + "#{dish.attr("href")}"
      type = "#{category.split.map(&:capitalize).join(" ")}"
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

    # categories = []
    ## non vegan
    categories = general_container.css("h2#recipes~h3")[0..9].map{|cat| cat.text}
    ## vegan
    general_container.css("h2#recipes~h3")[10..16].each { |container| categories << "Vegan " + container.text}
      binding.pry
    
  






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






  #       # binding.pry
  #       #try to add food category
  #     category = recipe_container.css("h3").text if recipe_container.css("ul.blist~li a")
  #     animal_friendly = 

  #     Recipes.new(name, url, category, animal_friendly)
    
  #   end
  #   binding.pry
  # end

  

end
