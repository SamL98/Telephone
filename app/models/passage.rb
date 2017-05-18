class Passage < ApplicationRecord
    belongs_to :chain
    validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :text, presence: true
    validates :derivation, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :time_spent
end
