class Project < ApplicationRecord
  has_and_belongs_to_many :technologies
  has_many :applications
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :applications

  validates :name, presence: true
end
