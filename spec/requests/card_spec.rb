require 'rails_helper'

RSpec.describe "Managing cards" do

  before do
    visit new_card_path
  end

  it "should be able to add card" do
  	expect(page).to have_title 'Флэшкарточкер | Новая карточка'
  end

end