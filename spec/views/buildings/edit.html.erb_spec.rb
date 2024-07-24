require 'rails_helper'

RSpec.describe "buildings/edit", type: :view do
  let(:building) {
    Building.create!(
      location: nil,
      client: nil
    )
  }

  before(:each) do
    assign(:building, building)
  end

  it "renders the edit building form" do
    render

    assert_select "form[action=?][method=?]", building_path(building), "post" do

      assert_select "input[name=?]", "building[location_id]"

      assert_select "input[name=?]", "building[client_id]"
    end
  end
end
