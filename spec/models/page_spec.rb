require 'rails_helper'

RSpec.describe Page, type: :model do

  it "can be created" do
    page = FactoryGirl.build(:page, name: 'Example Page')

    expect(page).to be_valid
  end


  it "has a slug after creation" do
    example_page = Page.create!(name: 'This Page')

    expect(example_page.slug).to eq('this-page')
  end
  

  it "orders by name" do
    services = Page.create!(name: "Services")
    about = Page.create!(name: "About")

    expect(Page.order('name ASC')).to eq([about, services])
  end


  it "ensures that empty name fails validation" do
  	page = FactoryGirl.build(:page, name: nil, slug: nil )

    expect(page).to be_invalid
  end


  it "ensures that name is unique" do
    page_1 = FactoryGirl.create(:page)
    page_2 = FactoryGirl.build(:page)

    expect(page_2).to be_invalid
  end
end
