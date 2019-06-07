class RecipeScraper

  STATIC_URL = "http://www.whfoods.com/recipestoc.php"

  @@category = []

  def self.scrape_categories
    scrape_category("breakfast")
  end

  def self.seperate_categories(category)
    parsed_url = Nokogiri::HTML(open(STATIC_URL))
    recipe_container = parsed_url.css("div.slot-6-7-8")

    selector = ""

    if category == "breakfast"
      selector = "breakfast"
    elsif category == "salad"
      selector = "salad"
    elsif category == "soup"
      selector = "soup"
    elsif category == "fish"
      category_container = recipe_container.css("h3#soup+ul.blist")
    elsif category == "poultry"
      category_container = recipe_container.css("h3#poultry+ul.blist")
    elsif category == "meat"
      category_container = recipe_container.css("h3#meat+ul.blist")
    elsif category == "vegetarian"
      category_container = recipe_container.css("h3#vegetarian+ul.blist")
    elsif category == "side salad"
      category_container = recipe_container.css("h3#side_salad+ul.blist")
    elsif category == "side veggies"
      category_container = recipe_container.css("h3#sideveg+ul.blist")
    elsif category == "dessert"
      category_container = recipe_container.css("h3#dessert+ul.blist")
    end

    binding.pry








    hello = recipe_container.css("ul.blist").text.split("\n")
      ## Non-animal friendly dishes
    breakfast = recipe_container.css("h3#breakfast+ul.blist").text.split("\n").reject(&:empty?)
    salad_entrees = recipe_container.css("h3#salad+ul.blist").text.split("\n").reject(&:empty?)
    soups = recipe_container.css("h3#soup+ul.blist").text.split("\n").reject(&:empty?)
    fish = recipe_container.css("h3#fish+ul.blist").text.split("\n").reject(&:empty?)
    poultry = recipe_container.css("h3#poultry+ul.blist").text.split("\n").reject(&:empty?)
    meat = recipe_container.css("h3#meat+ul.blist").text.split("\n").reject(&:empty?)
    vegetarian = recipe_container.css("h3#vegetarian+ul.blist").text.split("\n").reject(&:empty?)
    side_salad = recipe_container.css("h3#sidesalad+ul.blist").text.split("\n").reject(&:empty?)
    side_vege = recipe_container.css("h3#sideveg+ul.blist").text.split("\n").reject(&:empty?)
    dessert = recipe_container.css("h3#dessert+ul.blist").text.split("\n").reject(&:empty?)

      ## Animal friendly dishes
    vegan_breakfast = recipe_container.css("h3#vbreakfast+ul.blist").text.split("\n").reject(&:empty?)
    vegan_salads = recipe_container.css("h3#vsalad+ul.blist").text.split("\n").reject(&:empty?)
    vegan_soups = recipe_container.css("h3#vsoup+ul.blist").text.split("\n").reject(&:empty?)
    vegan_veggies = recipe_container.css("h3#vvegetarian+ul.blist").text.split("\n").reject(&:empty?)
    vegan_side_salad = recipe_container.css("h3#vsidesalad+ul.blist").text.split("\n").reject(&:empty?)
    vegan_side_vege = recipe_container.css("h3#vsideveg+ul.blist").text.split("\n").reject(&:empty?)
    vegan_dessert = recipe_container.css("h3#vdessert+ul.blist").text.split("\n").reject(&:empty?)
    # binding.pry


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
      category = recipe_container.css("h3").text if recipe_container.css("ul.blist~li a")
      animal_friendly = 

      Recipes.new(name, url, category, animal_friendly)
    
    end
    binding.pry
  end

  # scrape level 2 for recipe and instructions

  # scrape level 3 for macros

end