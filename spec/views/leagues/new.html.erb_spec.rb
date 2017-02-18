require 'rails_helper'

RSpec.describe "leagues/new", type: :view do
  before(:each) do
    assign(:league, League.new(
      :name => "MyString",
      :admin_id => 1
    ))
  end

  it "renders new league form" do
    render

    assert_select "form[action=?][method=?]", leagues_path, "post" do

      assert_select "input#league_name[name=?]", "league[name]"

      assert_select "input#league_admin_id[name=?]", "league[admin_id]"
    end
  end
end
