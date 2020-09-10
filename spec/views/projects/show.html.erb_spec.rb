# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'projects/show', type: :view do
  before do
    @project = assign(:project, Project.create!(
                                  title: 'Title',
                                  donation_goal: '9.99',
                                  user: nil
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
