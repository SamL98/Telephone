# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'

(1..2).each do |i|
  ps = []
  (1..8).each do |j|
    passage = Passage.new(text: "Article #{j}. Pair #{i}", user: "admin", is_lay: false, source: -1)
    passage.save!
    ps << passage.id
  end
  ArticleSet.create(ps: ps, pair: i, derivation: 0, is_lay: true).save!
  ArticleSet.create(ps: ps, pair: i, derivation: 0, is_lay: false).save!
  (1..3).each do |k|
    ArticleSet.create(ps: Array.new(8, 0), pair: i, derivation: k, is_lay: true).save!
    ArticleSet.create(ps: Array.new(8, 0), pair: i, derivation: k, is_lay: false).save!
  end
end