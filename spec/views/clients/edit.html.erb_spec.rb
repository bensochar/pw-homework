require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  let(:client) {
    Client.create!(
      email: "MyString",
      password_digest: "MyString",
      name: "MyString"
    )
  }

  before(:each) do
    assign(:client, client)
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(client), "post" do

      assert_select "input[name=?]", "client[email]"

      assert_select "input[name=?]", "client[password_digest]"

      assert_select "input[name=?]", "client[name]"
    end
  end
end
