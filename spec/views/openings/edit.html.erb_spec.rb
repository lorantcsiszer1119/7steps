require 'spec_helper'

describe "openings/edit" do
  before(:each) do
    @opening = assign(:opening, stub_model(Opening,
      :user_id => 1,
      :link => "MyString"
    ))
  end

  it "renders the edit opening form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", opening_path(@opening), "post" do
      assert_select "input#opening_user_id[name=?]", "opening[user_id]"
      assert_select "input#opening_link[name=?]", "opening[link]"
    end
  end
end
