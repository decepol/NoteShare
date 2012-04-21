require 'spec_helper'

describe "paragraphs/edit" do
  before(:each) do
    @paragraph = assign(:paragraph, stub_model(Paragraph,
      :prev => nil,
      :next => nil,
      :body => "MyText"
    ))
  end

  it "renders the edit paragraph form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paragraphs_path(@paragraph), :method => "post" do
      assert_select "textarea#paragraph_body", :name => "paragraph[body]"
    end
  end
end
