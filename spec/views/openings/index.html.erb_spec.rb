require 'spec_helper'

describe "openings/index" do
  before(:each) do
    assign(:openings, [
      stub_model(Opening,
        :user_id => 1,
        :link => "Link"
      ),
      stub_model(Opening,
        :user_id => 1,
        :link => "Link"
      )
    ])
  end

  it "renders a list of openings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
