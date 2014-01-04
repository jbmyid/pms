class Project < ActiveRecord::Base
  attr_accessible :description, :name, :developer_ids

  validates :name, :description, presence: true
  has_many :todos, dependent: :destroy
  has_and_belongs_to_many :developers

  def dev_names
    developers.pluck(:name)
  end
end
