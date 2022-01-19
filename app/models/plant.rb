class Plant < ApplicationRecord
  belongs_to :genus
  belongs_to :user
  delegate :family, :to => :genus
  has_many :synonyms, dependent: :destroy
  has_many :common_names, dependent: :destroy
  has_many :images, dependent: :destroy
  has_and_belongs_to_many :light_reqts
  has_and_belongs_to_many :foliage_colors
  has_and_belongs_to_many :flower_colors

  accepts_nested_attributes_for :common_names, allow_destroy: true, reject_if: proc { |att| att['name'].blank? }

  def genus_name=(name)
    self.genus = Genus.find_or_create_by(name: name)
  end

  def genus_name
    self.genus ? self.genus.name : nil
  end

end
