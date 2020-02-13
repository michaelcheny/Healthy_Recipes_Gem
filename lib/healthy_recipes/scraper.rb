class RecipeScraper

  DOMAIN = "http://www.whfoods.com/"
  PATH_TO_RECIPE_PAGE = "recipestoc.php"

   
  def self.scrape_all_categories

    parsed_url = Nokogiri::HTML(URI.open(DOMAIN + PATH_TO_RECIPE_PAGE))
    category_name_container = parsed_url.css("div.slot-6-7-8 h2#recipes~h3")

    categories = []
    category_name_container[0..9].each{|container| categories << container.text} 
    category_name_container[10..16].each{|container| categories << "Vegan " + container.text}  
    
    return categories
  end


  def self.make_recipes_from_categories
    
    self.scrape_all_categories.each do |each_category|

      case each_category

      when "Breakfast"
        selector = "breakfast" 
      when "Salad Entrees" 
        selector = "salad" 
      when "Soups"
        selector = "soup" 
      when "Fish"
        selector = "fish"  
      when "Chicken and Turkey"
        selector = "poultry" 
      when "Lean Meat"
        selector = "meat" 
      when "Vegetarian Entrees"
        selector = "vegetarian" 
      when "Side Salad/Dressings"
        selector = "sidesalad" 
      when "Side Vegetables"
        selector = "sideveg" 
      when "Desserts"
        selector = "dessert" 
      when "Vegan Breakfast" 
        selector = "vbreakfast" 
      when "Vegan Salad Entrees"
        selector = "vsalad" 
      when "Vegan Soups" 
        selector = "vsoup" 
      when "Vegan Vegetarian Entrees"
        selector = "vvegetarian"
      when "Vegan Side Salad/Dressings"
        selector = "vsidesalad" 
      when "Vegan Side Vegetables" 
        selector = "vsideveg" 
      when "Vegan Desserts" 
        selector = "vdessert" 
      end

      parsed_url = Nokogiri::HTML(URI.open(DOMAIN + PATH_TO_RECIPE_PAGE))
      recipe_container = parsed_url.css("div.slot-6-7-8 h3##{selector}+ul.blist li a")
      recipe_container.each do |dish| 
        
        name = dish.text.gsub(/^[ \t]/, "") 
        url = DOMAIN + "#{dish.attr("href")}"
        category = "#{each_category}"
        animal_friendly = category.include?("Vegan") ? "Yes" : "No"

        Recipes.new(name, url, category, animal_friendly)
      end
    end
  end

    
  def self.scrape_ingredients_and_directions(recipe)

    recipe_url = recipe.url

    parsed_url = Nokogiri::HTML(URI.open(recipe_url))
    level_one_container = parsed_url.css("div.slot-6-7-8")
    level_one_container.each do |steps|

      recipe.ingredients = steps.css("tr td ul.llist").text
      recipe.instructions = steps.css("p~ol").text.split("\n").delete_if(&:empty?)
      recipe.serving_size = steps.css("p~ol~b:contains('Serves')").text.gsub("Serves ", "") unless steps.css("p~ol~b").empty?
      recipe.in_depth_url = DOMAIN + steps.css("p b:contains('In-Depth Nutritional Profile')+a").attr('href').text unless steps.css("p b:contains('In-Depth Nutritional Profile')+a").attr('href').nil?
      
    end
  end

    
  def self.scrape_calories_page(recipe)

    recipe_page_2_url = recipe.in_depth_url
    parsed_url = Nokogiri::HTML(URI.open(recipe_page_2_url))
    nutrient_container = parsed_url.css("div.slot-6-7-8  table")
    nutrient_container.each do |item|

      recipe.calories = item.css("tr td:contains('Calories')+td")[0].text.to_i.round 
    end
  end

end


