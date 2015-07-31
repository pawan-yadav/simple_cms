require 'rails_helper'

RSpec.describe Page, type: :model do

  it "orders by name" do
    services = Page.create!(name: "Services")
    about = Page.create!(name: "About")

    expect(Page.order('name ASC')).to eq([about, services])
  end


  it "has a slug after creation" do
  	example_page = Page.create!(name: 'Example Page')

  	expect(example_page.slug).to eq('example-page')
  end

  it "can be created with validations" do
  	page = FactoryGirl.build(:page, name: 'Example Page')

    expect(page).to be_valid
  end

  it "ensures that empty name fails validation" do
  	page = FactoryGirl.build(:page, name: nil, slug: nil )

    expect(page).to be_invalid
  end
end
