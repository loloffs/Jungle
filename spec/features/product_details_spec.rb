require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do


  # SETUP
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


  scenario "Can go to product page from home page by clicking on a product" do
    visit root_path

    click_on 'Blue bottle pinterest organic portland.'


    expect(page).to have_css 'article.product'


  end

  end

end
