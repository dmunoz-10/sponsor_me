# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/index', type: :view do
  before do
    assign(:projects, [
             Project.create!(
               title: 'Title',
               donation_goal: '9.99',
               user: nil
             ),
             Project.create!(
               title: 'Title',
               donation_goal: '9.99',
               user: nil
             )
           ])
  end

  it 'renders a list of projects' do
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
