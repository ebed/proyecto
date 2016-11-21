require 'rails_helper'

RSpec.describe "delivery_companies/edit", type: :view do
  before(:each) do
    @delivery_company = assign(:delivery_company, DeliveryCompany.create!(
      :nombre => "MyString",
      :address_id => 1,
      :telefono => "MyString"
    ))
  end

  it "renders the edit delivery_company form" do
    render

    assert_select "form[action=?][method=?]", delivery_company_path(@delivery_company), "post" do

      assert_select "input#delivery_company_nombre[name=?]", "delivery_company[nombre]"

      assert_select "input#delivery_company_address_id[name=?]", "delivery_company[address_id]"

      assert_select "input#delivery_company_telefono[name=?]", "delivery_company[telefono]"
    end
  end
end
