class Project < ApplicationRecord
  has_and_belongs_to_many :technologies
  has_many :applications, :dependent => :destroy
  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :applications, :allow_destroy => true

  validates :name, presence: true
end
