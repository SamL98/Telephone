# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'

sets = {}
File.readlines(Rails.root.join('counterbalancing/articles-Table 1.csv').to_s).each do |line|
  terms = line.parse_csv
  set = terms[0]
  set.gsub(/ /, '')
  if sets[set.to_sym]
    sets[set.to_sym] << [terms[1], terms[2]]
  else
    sets[set.to_sym] = [[terms[1], terms[2]]]
  end
end

Chain.destroy_all
Passage.destroy_all

i = 0
File.readlines(Rails.root.join('counterbalancing/counterbalancing List-Table 1.csv').to_s).each do |line|
  m_chain = Chain.new(identifier: 'M' + (i+1).to_s)
  l_chain = Chain.new(identifier: 'L' + (i+1).to_s)
  m_chain.save!
  l_chain.save!
  terms = line.parse_csv
  j = 0
  sets[terms[1].to_sym].each do |article|
    l_chain.passages.create!(user: '', chain_id: l_chain.id, passage_id: article[0], number: j, text: article[1], derivation: 1, time_spent: 0)
    j += 1
  end
  sets[terms[2].to_sym].each do |article|
    l_chain.passages.create!(user: '', chain_id: l_chain.id, passage_id: article[0], number: j, text: article[1], derivation: 1, time_spent: 0)
    j += 1
  end
  j = 0
  sets[terms[4].to_sym].each do |article|
    m_chain.passages.create!(user: '', chain_id: m_chain.id, passage_id: article[0], number: j, text: article[1], derivation: 1, time_spent: 0)
    j += 1
  end
  sets[terms[5].to_sym].each do |article|
    m_chain.passages.create!(user: '', chain_id: m_chain.id, passage_id: article[0], number: j, text: article[1], derivation: 1, time_spent: 0)
    j += 1
  end
  i += 1
end
