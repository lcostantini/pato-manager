class Task < Ohm::Model
  attribute :name
  attribute :description
  attribute :created_at
  attribute :state
  attribute :category

  index :name
  index :created_at
  index :category
end
