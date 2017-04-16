class Chain < ApplicationRecord
    has_many :users
    has_many :passages
    validates :identifier, presence: true, format: { with: /[ML]\d{1,2}/, message: "name must follow regex: /(M|L)\\(d|d\\d)" }
end
