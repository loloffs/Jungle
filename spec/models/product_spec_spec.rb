require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new
  end

  describe 'Validations' do

    it "will not save with invalid name attribute" do
      @product = Product.new(price: 10, quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it "will not save with invalid price attribute" do
      @product = Product.new(name: "something", quantity: 2, category: @category)
      expect(@product).to_not be_valid
    end

    it "will not save with invalid quantity attribute" do
      @product = Product.new(name: "something", price: 10, category: @category)
      expect(@product).to_not be_valid
    end

    it "will not save with invalid category attribute" do
      @product = Product.new(name: "something", price: 10, quantity: 2)
      expect(@product).to_not be_valid
    end

    it "will save with all valid attributes" do
      @product = Product.new(name: "something", price: 10, quantity: 2, category: @category)
      expect(@product).to be_valid
    end

  end
end
