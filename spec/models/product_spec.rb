require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    let(:category) { Category.new(name: 'Grocery') }
    let(:product) { Product.new(name: "Orange", price: 12.34, quantity: 30, category: category) }

    it "is valid with valid attributes" do
      expect(product).to(be_valid)
    end

    # Name should be required
    it "is not valid without a name" do
      product.name = nil
      product.save
      expect(product).to be_invalid
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include 'Name can\'t be blank'
    end

    # Price should be required
    it "is not valid without a price" do
      product.price_cents = nil
      product.save
      expect(product).to be_invalid
      expect(product.errors.size).to eql(3)
      expect(product.errors.full_messages).to include 'Price cents is not a number'
      expect(product.errors.full_messages).to include 'Price is not a number'
      expect(product.errors.full_messages).to include 'Price can\'t be blank'
    end

    # Quantity should be required
    it "is not valid without a quantity" do
      product.quantity = nil
      product.save
      expect(product).to be_invalid
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include 'Quantity can\'t be blank'
    end

    # Category should be required
    it "is not valid without a category" do
      product.category = nil
      product.save
      expect(product).to be_invalid
      expect(product.errors.size).to eql(1)
      expect(product.errors.full_messages).to include 'Category can\'t be blank'
    end

  end
end
