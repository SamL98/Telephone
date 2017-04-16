class Chain < ApplicationRecord
    has_many :users
    has_many :passages
    validates :identifier, presence: true
end
