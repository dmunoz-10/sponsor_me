# frozen_string_literal: true

# Project Model
class Project < ApplicationRecord
  has_rich_text :description
  has_one_attached :thumbnail

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :perks, dependent: :destroy
  accepts_nested_attributes_for :perks, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank? }

  scope :active, -> { where(status: 'active') }
  scope :inactive, -> { where(status: 'inactive') }

  def active?
    status == 'active'
  end

  def inactive?
    status == 'inactive'
  end
end
