require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do


  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end




  scenario "Can go to product page from home page by clicking on a product" do
    visit root_path

    page.has_content?('My Cart(0)')

    click_on 'Add'

    page.has_content?('My Cart(1)')

  end


end



# To test for the Cart being updated, you should keep it simple 
# and check the text rendered in the top nav (by the _top_nav.html.erb partial)
#  changes from "My Cart (0)" to to "My Cart (1)".