require 'rails_helper'

RSpec.describe "tipobanners/edit", type: :view do
  before(:each) do
    @tipobanner = assign(:tipobanner, Tipobanner.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit tipobanner form" do
    render

    assert_select "form[action=?][method=?]", tipobanner_path(@tipobanner), "post" do

      assert_select "input#tipobanner_name[name=?]", "tipobanner[name]"
    end
  end
end
