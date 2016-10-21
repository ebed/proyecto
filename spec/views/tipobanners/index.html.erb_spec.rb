require 'rails_helper'

RSpec.describe "tipobanners/index", type: :view do
  before(:each) do
    assign(:tipobanners, [
      Tipobanner.create!(
        :name => "Name"
      ),
      Tipobanner.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of tipobanners" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
