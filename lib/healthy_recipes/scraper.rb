class RecipeScraper

  DOMAIN = "http://www.whfoods.com/"
  PATH_TO_RECIPE = "recipestoc.php"

  # def self.scrape_categories
  #   scrape_category("breakfast")
  # end

  def self.seperate_categories(category)
    
    case category
      ## carnivore
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
    ## herbivore
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

    parsed_url = Nokogiri::HTML(open(DOMAIN + PATH_TO_RECIPE))
    recipe_container = parsed_url.css("div.slot-6-7-8")
    recipe_container.css("h3##{selector}+ul.blist li a").each do |dish|

      name = dish.text.gsub(/^[ \t]/, "")
      url = DOMAIN + "#{dish.attr("href")}"
      
        ## add food category and animalfriendly

      category = "#{category.split.map(&:capitalize).join(" ")}"
      animal_friendly = 

      Recipes.new(name, url, category, animal_friendly)
    
    end
    binding.pry
  end

  # scrape level 2 for recipe and instructions

  # scrape level 3 for macros


    # hello = recipe_container.css("ul.blist").text.split("\n")
    #   ## Non-animal friendly dishes
    # breakfast = recipe_container.css("h3#breakfast+ul.blist").text.split("\n").reject(&:empty?)
    # salad_entrees = recipe_container.css("h3#salad+ul.blist").text.split("\n").reject(&:empty?)
    # soups = recipe_container.css("h3#soup+ul.blist").text.split("\n").reject(&:empty?)
    # fish = recipe_container.css("h3#fish+ul.blist").text.split("\n").reject(&:empty?)
    # poultry = recipe_container.css("h3#poultry+ul.blist").text.split("\n").reject(&:empty?)
    # meat = recipe_container.css("h3#meat+ul.blist").text.split("\n").reject(&:empty?)
    # vegetarian = recipe_container.css("h3#vegetarian+ul.blist").text.split("\n").reject(&:empty?)
    # side_salad = recipe_container.css("h3#sidesalad+ul.blist").text.split("\n").reject(&:empty?)
    # side_vege = recipe_container.css("h3#sideveg+ul.blist").text.split("\n").reject(&:empty?)
    # dessert = recipe_container.css("h3#dessert+ul.blist").text.split("\n").reject(&:empty?)
      ## Animal friendly dishes
    # vegan_breakfast = recipe_container.css("h3#vbreakfast+ul.blist").text.split("\n").reject(&:empty?)
    # vegan_salads = recipe_container.css("h3#vsalad+ul.blist").text.split("\n").reject(&:empty?)
    # vegan_soups = recipe_container.css("h3#vsoup+ul.blist").text.split("\n").reject(&:empty?)
    # vegan_veggies = recipe_container.css("h3#vvegetarian+ul.blist").text.split("\n").reject(&:empty?)
    # vegan_side_salad = recipe_container.css("h3#vsidesalad+ul.blist").text.split("\n").reject(&:empty?)
    # vegan_side_vege = recipe_container.css("h3#vsideveg+ul.blist").text.split("\n").reject(&:empty?)
    # vegan_dessert = recipe_container.css("h3#vdessert+ul.blist").text.split("\n").reject(&:empty?)
    # # binding.pry







  def self.scrape_recipe_name_and_url_non_vegan

    parsed_url = Nokogiri::HTML(open(STATIC_URL))

    recipe_container = parsed_url.css("div.slot-6-7-8")
    recipe_container.css("li a").each do |dish|
      name = dish.text.gsub(/^[ \t]/, "")
      url = "http://www.whfoods.com/#{dish.attr("href")}"
      
        ## add food category and animalfriendly






        # binding.pry
        #try to add food category
      category = recipe_container.css("h3").text if recipe_container.css("ul.blist~li a")
      animal_friendly = 

      Recipes.new(name, url, category, animal_friendly)
    
    end
    binding.pry
  end

  

end

# RecipeScraper.seperate_categories("breakfast")