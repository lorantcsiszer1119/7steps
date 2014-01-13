require 'spec_helper'

describe "openings/show" do
  before(:each) do
    @opening = assign(:opening, stub_model(Opening,
      :user_id => 1,
      :link => "Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Link/)
  end
end
