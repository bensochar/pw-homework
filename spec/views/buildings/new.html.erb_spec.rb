require 'rails_helper'

RSpec.describe "buildings/new", type: :view do
  before(:each) do
    assign(:building, Building.new(
      location: nil,
      client: nil
    ))
  end

  it "renders new building form" do
    render

    assert_select "form[action=?][method=?]", buildings_path, "post" do

      assert_select "input[name=?]", "building[location_id]"

      assert_select "input[name=?]", "building[client_id]"
    end
  end
end
