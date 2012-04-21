require 'spec_helper'

describe "paragraphs/new" do
  before(:each) do
    assign(:paragraph, stub_model(Paragraph,
      :prev => "",
      :next => "",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new paragraph form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => paragraphs_path, :method => "post" do
      assert_select "input#paragraph_prev", :name => "paragraph[prev]"
      assert_select "input#paragraph_next", :name => "paragraph[next]"
      assert_select "textarea#paragraph_body", :name => "paragraph[body]"
    end
  end
end
