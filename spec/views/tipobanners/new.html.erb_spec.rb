require 'rails_helper'

RSpec.describe "tipobanners/new", type: :view do
  before(:each) do
    assign(:tipobanner, Tipobanner.new(
      :name => "MyString"
    ))
  end

  it "renders new tipobanner form" do
    render

    assert_select "form[action=?][method=?]", tipobanners_path, "post" do

      assert_select "input#tipobanner_name[name=?]", "tipobanner[name]"
    end
  end
end
