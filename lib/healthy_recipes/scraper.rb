class RecipeScraper

  DOMAIN = "http://www.whfoods.com/"
  PATH_TO_RECIPE_PAGE = "recipestoc.php"

    ### NOTES
    # first scrape categories
    # second scrape recipes in that category
    # third scrape macros for that recipe

    ## scrape all the categories to start off
  def self.scrape_all_categories

    parsed_url = Nokogiri::HTML(open(DOMAIN + PATH_TO_RECIPE_PAGE))
    category_name_container = parsed_url.css("div.slot-6-7-8 h2#recipes~h3")

    categories = category_name_container[0..9].map(&:text) ## non vegan
    category_name_container[10..16].each { |container| categories << "Vegan " + container.text}  ## vegan
    
    return categories

  end

    ## once given input, scrape that input's catgory
  def self.scrape_recipe_by_categories(input_category)

    case input_category

    when 1 
      selector, cate = "breakfast", "breakfast"
    when 2 
      selector, cate = "salad", "salad entrees"
    when 3 
      selector, cate = "soup", "soups"
    when 4 
      selector, cate = "fish", "fish" 
    when 5 
      selector, cate = "poultry", "chicken and turkey"
    when 6 
      selector, cate = "meat", "lean meat"
    when 7 
      selector, cate = "vegetarian", "vegetarian entrees"
    when 8 
      selector, cate = "sidesalad", "side salad/dressings"
    when 9 
      selector, cate = "sideveg", "side vegetables"
    when 10 
      selector, cate = "dessert", "desserts"
    when 11 
      selector, cate = "vbreakfast", "vegan breakfast"
    when 12 
      selector, cate = "vsalad", "vegan salad entrees"
    when 13 
      selector, cate = "vsoup", "vegan soups"
    when 14 
      selector, cate = "vvegetarian", "vegan vegetarian entrees"
    when 15 
      selector, cate = "vsidesalad", "vegan side salad/dressings"
    when 16 
      selector, cate = "vsideveg", "vegan side vegetables"
    when 17 
      selector, cate = "vdessert", "vegan desserts"
    end

    parsed_url = Nokogiri::HTML(open(DOMAIN + PATH_TO_RECIPE_PAGE))
    recipe_container = parsed_url.css("div.slot-6-7-8 h3##{selector}+ul.blist li a")
    recipe_container.each do |dish| 
      
      name = dish.text.gsub(/^[ \t]/, "") ## clean up leading white space
      url = DOMAIN + "#{dish.attr("href")}"
      category = "#{cate.split.map(&:capitalize).join(" ")}"
      animal_friendly = category.include?("Vegan") ? "Yes" : "No"

      Recipes.new(name, url, category, animal_friendly)

    end

  end

    ## scrapes the second layer for ingredients, direction, and url for 3rd page.
  def self.scrape_ingredients_and_directions(recipe)

    recipe_url = recipe.url
    parsed_url = Nokogiri::HTML(open(recipe_url))
    level_one_container = parsed_url.css("div.slot-6-7-8")
    level_one_container.each do |steps|

      recipe.ingredients = steps.css("tr td ul.llist").text
      recipe.instructions = steps.css("p~ol").text
      recipe.in_depth_url = DOMAIN + steps.css("p b:contains('In-Depth Nutritional Profile')+a").attr('href').text unless steps.css("p b:contains('In-Depth Nutritional Profile')+a").attr('href').nil?
      # binding.pry
    end
  end

    # scrape level 3 for macros
  def self.scrape_macro_nutrients_page(recipe)

    recipe_page_2_url = recipe.in_depth_url
    parsed_url = Nokogiri::HTML(open(recipe_page_2_url))
    binding.pry
  end



end
