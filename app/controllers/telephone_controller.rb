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

    place = params[:place]
    number = params[:number]
    time = params[:time]
    input = params[:input]
    @chain = params[:chain_id]

    chain = Chain.where("identifier = ?", @chain).first
    passages = chain.passages

    if number >= passages.where("derivation = ?", place).count
      puts "number is invalid"
      redirect_to "/finish"
      return
    end

    if input != "" && time > 0
      passages.create!(number: number - 1, text: input, derivation: place + 1, time_spent: time)
      chain.save!
    end

    @passage = passages.where("number = ? AND derivation = ?", number, place).first
    if !@passage
      flash.now[:alert] = "There is no passage with your chosen parameters"
      redirect_to "/"
    end
  end

  def finish_survey
  end

  private
  def user_params
    { chain_id: params[:chain_id].to_i, name: params[:name].to_s, place: params[:place].to_i }
  end

  def survey_params
    { input: params[:input].to_s, number: params[:index].to_i, 
    place: params[:place].to_i, chain_id: params[:chain].to_s, 
    time: params[:time_spent].to_i }
  end
end
