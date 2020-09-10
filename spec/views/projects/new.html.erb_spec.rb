# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/new', type: :view do
  before do
    assign(:project, Project.new(
                       title: 'MyString',
                       donation_goal: '9.99',
                       user: nil
                     ))
  end

  it 'renders new project form' do
    render

    assert_select 'form[action=?][method=?]', projects_path, 'post' do
      assert_select 'input[name=?]', 'project[title]'

      assert_select 'input[name=?]', 'project[donation_goal]'

      assert_select 'input[name=?]', 'project[user_id]'
    end
  end
end
