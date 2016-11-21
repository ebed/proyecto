require 'rails_helper'

RSpec.describe "delivery_companies/index", type: :view do
  before(:each) do
    assign(:delivery_companies, [
      DeliveryCompany.create!(
        :nombre => "Nombre",
        :address_id => 2,
        :telefono => "Telefono"
      ),
      DeliveryCompany.create!(
        :nombre => "Nombre",
        :address_id => 2,
        :telefono => "Telefono"
      )
    ])
  end

  it "renders a list of delivery_companies" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
  end
end
