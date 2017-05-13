class TelephoneController < ApplicationController
  def login
  end

  def survey
    chain_id = params[:chain].to_s
    chain = Chain.where('identifier = ?', chain_id).first
    params[:chain_id] = chain.id

    chain.users.create!(user_params())
    chain.save!

    @place = params[:place].to_i
    @chain = chain_id
  end

  def start_survey
    params = survey_params()

    indeces = [0, 1, 2, 3, 4, 5]
    visited = params[:visited].split(',').map(&:to_i)
    indeces.delete_if { |x| visited.include? x }
    indeces.shuffle!

    @index = indeces.first
    @visited = params[:visited] + ',' + @index.to_s

    @chain = params[:chain_id]
    chain = Chain.where("identifier = ?", @chain).first
    passages = chain.passages

    if params[:input] != ""
      passages.create!(number: params[:number], passage_id: params[:pid], text: params[:input], derivation: params[:place] + 1, time_spent: params[:time])
      chain.save!
    end

    if indeces.count == 0
      puts "number is invalid"
      redirect_to "/finish"
      return
    end

    @passage = passages.where("number = ? AND derivation = ?", @index, params[:place]).last
    if !@passage
      flash.now[:alert] = "There is no passage with your chosen parameters"
      redirect_to "/"
    end
  end

  def finish_survey
  end

  def format_data
    original_out = $stdout.clone
    $stdout = File.new('data.csv', 'w')
    Chain.all.each do |chain|
      chain.passages.all.each do |passage|
        print chain.identifier + ','
        print passage.passage_id + ','
        print passage.number.to_s + ','
        print passage.text + ','
        print passage.derivation.to_s + ','
        print passage.time_spent.to_s + ','
        puts ''
      end
    end
    $stdout = original_out
  end

  private

  def user_params
    { chain_id: params[:chain_id].to_i, name: params[:name].to_s, place: params[:place].to_i }
  end

  def survey_params
    { input: params[:input].to_s, number: params[:index].to_i,
      place: params[:place].to_i, chain_id: params[:chain].to_s,
      time: params[:time_spent].to_i, visited: params[:visited].to_s,
      pid: params[:pid].to_s }
  end
end
