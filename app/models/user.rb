class User < ApplicationRecord
    belongs_to :chain
    validates :chain_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :name, presence: true, format: { with: /(test||subj)\d+/, message: "name must be of form: user+digit" }
    validates :place, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
