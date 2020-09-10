require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      title: "MyString",
      donation_goal: "9.99",
      user: nil
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input[name=?]", "project[title]"

      assert_select "input[name=?]", "project[donation_goal]"

      assert_select "input[name=?]", "project[user_id]"
    end
  end
end
