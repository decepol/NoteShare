require 'spec_helper'

describe "paragraphs/index" do
  before(:each) do
    assign(:paragraphs, [
      stub_model(Paragraph,
        :prev => "",
        :next => "",
        :body => "MyText"
      ),
      stub_model(Paragraph,
        :prev => "",
        :next => "",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of paragraphs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
