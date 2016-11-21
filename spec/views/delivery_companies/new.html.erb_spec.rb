require 'rails_helper'

RSpec.describe "delivery_companies/new", type: :view do
  before(:each) do
    assign(:delivery_company, DeliveryCompany.new(
      :nombre => "MyString",
      :address_id => 1,
      :telefono => "MyString"
    ))
  end

  it "renders new delivery_company form" do
    render

    assert_select "form[action=?][method=?]", delivery_companies_path, "post" do

      assert_select "input#delivery_company_nombre[name=?]", "delivery_company[nombre]"

      assert_select "input#delivery_company_address_id[name=?]", "delivery_company[address_id]"

      assert_select "input#delivery_company_telefono[name=?]", "delivery_company[telefono]"
    end
  end
end
