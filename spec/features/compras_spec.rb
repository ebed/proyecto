require 'spec_helper'
require 'rails_helper'

describe  "El proceso de compra", :type => :feature  do


    it "Me autentico" do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', :with => 'ebedmail@gmail.com'
        fill_in 'Password', :with => 'shalom'
      end
      click_button 'Sign in'
      expect(page).to have_content 'Editar datos'
    end

    it "Selecciono articulo" do
      visit "/"
      find("img[caption='articulo']").click
      expect(page).to have_content("Lista deseos")
    end

end
