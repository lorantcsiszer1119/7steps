require 'spec_helper'

describe "openings/new" do
  before(:each) do
    assign(:opening, stub_model(Opening,
      :user_id => 1,
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new opening form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", openings_path, "post" do
      assert_select "input#opening_user_id[name=?]", "opening[user_id]"
      assert_select "input#opening_link[name=?]", "opening[link]"
    end
  end
end
