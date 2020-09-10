# frozen_string_literal: true

# Project Model
class Project < ApplicationRecord
  has_rich_text :description
  has_one_attached :thumbnail

  belongs_to :user
end
