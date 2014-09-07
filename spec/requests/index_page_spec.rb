require 'rails_helper'

describe "Index page" do

  describe "user no login" do
    before(:each) {visit root_path}
    it {expect(page).to have_link("Войти", href: login_path)}
    it {expect(page).to have_link("Регистрация", href: new_user_path)}
  end

  describe "when user login" do
    let(:user) {FactoryGirl.create(:user)}
    before(:each) do
      visit root_path
      sign_in(user)
    end

    it {expect(page).to have_link("Все колоды", href: decks_path)}
    it {expect(page).to have_link("Добавить колоду", href: new_deck_path)}
    it {expect(page).to have_link("Изменить профиль", href: edit_user_path(user.id))}
    it {expect(page).to have_link("Выйти", href: logout_path)}

    describe "when user has no decks and cards" do
      before {visit root_path}
      it {expect(page).to have_content("Создайте колоду и добавьте карточки")}
    end

    describe "the user has a deck, but no cards" do
      let(:deck) {FactoryGirl.create(:deck, user_id: user.id)}
      before {visit root_path}
      it {expect(page).to have_content("Добавьте карточки в колоду")}
    end

  end

end
