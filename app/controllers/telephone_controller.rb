class TelephoneController < ApplicationController
  def login
  end

  def survey
    chain = Chain.where('identifier = ?', params[:chain].to_s).first
    chain.users.create!(user_params())
    chain.save!
    @place = params[:place].to_i
    @chain = params[:chain].to_s
  end

  def start_survey
    input = params[:input].to_s
    number = params[:index].to_i
    place = params[:place].to_i

    if number >= Passage.where("derivation = ?", place).count
      puts "number is invalid"
      redirect_to "/finish"
      return
    end

    if input != ""
      Passage.new(number: number - 1, text: input, derivation: place + 1).save
    end

    @passage = Passage.where("number = ? AND derivation = ?", number, place).first
    if !@passage
      flash.now[:alert] = "There is no passage with your chosen parameters"
      redirect_to "/"
    end
  end

  def finish_survey
  end

  private
  def user_params
    { name: params[:name].to_s, place: params[:place].to_i }
  end
end
