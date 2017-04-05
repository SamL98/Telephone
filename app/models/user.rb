class User < ApplicationRecord
    belongs_to :chain
    validates :name, presence: true, format: { with: /(user)\d+/, message: "name must be of form: user+digit" }
    validates :place, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
