require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "check the homepage loads correctly" do
    # navigate to the homepage
    visit '/'
    # capture a screenshot of the homepage
    save_and_open_screenshot
    # verify that the header text exists and it says 'Awesome Products'
    assert_selector 'h1', text: 'Awesome Products'
    # verify that we have 5 cards on the homepage
    assert_selector '.card-product', count: Product.count
  end

  test "user can create a new product" do
    # 1. user logs in
    login_as users(:george)
    
    # 2. user clicks on link to New Product page
    visit '/products/new'
    save_and_open_screenshot

    # 3. user fill out form and submits new product
    fill_in 'product_name', with: 'Le Wagon'
    fill_in 'product_tagline', with: 'Change your life, learn to code.'
    save_and_open_screenshot
    
    click_on 'Create Product'
    save_and_open_screenshot


    # ensure we have successfully created the product in the database
    ## user has redirected to the homepage
    assert_equal root_path, page.current_path
    ## the card we just created is visible on the homepage
    assert_text 'Change your life, learn to code.'
  end
end
