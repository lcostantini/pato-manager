class Task < Ohm::Model
  attribute :name
  attribute :description
  attribute :created_at
  attribute :state

  index :created_at
end
