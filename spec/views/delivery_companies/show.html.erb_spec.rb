require 'rails_helper'

RSpec.describe "delivery_companies/show", type: :view do
  before(:each) do
    @delivery_company = assign(:delivery_company, DeliveryCompany.create!(
      :nombre => "Nombre",
      :address_id => 2,
      :telefono => "Telefono"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Telefono/)
  end
end
