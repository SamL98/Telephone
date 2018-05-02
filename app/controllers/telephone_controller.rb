class TelephoneController < ApplicationController
  def login
  end

  def first_instr
    params = login_params
    @user = params[:name]
    @is_lay = params[:is_lay]

    aset = ArticleSet.where("pair=? and derivation=? and is_lay=?", params[:pair], params[:place]-1, @is_lay).first
    @old_aset = aset.id
    @pair = params[:pair]
    @place = params[:place]

    @index = 0
    @visited = '-1'
    @source = -1
  end

  def next_instr
    params = passage_params

    @index = params[:index]
    @visited = params[:visited]

    @user = params[:name]
    @is_lay = params[:is_lay]
    @place = params[:place]

    @old_aset = params[:old_aset]
    @pair = params[:pair]

    if params[:input] != '' and params[:source] >= 0
      new_pass = Passage.new(text: params[:input], user: @user, is_lay: @is_lay, source: params[:source])
      new_pass.save!

      last_index = params[:index]
      new_lay = @is_lay

      if @place == 1 and [2, 3, 6, 7].include? last_index
        new_lay = !new_lay
      end
      new_aset = ArticleSet.where("pair = ? and derivation = ? and is_lay = ?", @pair, @place, new_lay).first
      ps = new_aset.ps
      ps[last_index] = new_pass.id
      new_aset.update(ps: ps)
    end

    indeces = (0..7).to_a
    visited = params[:visited].split(',').map(&:to_i)
    indeces.delete_if { |x| visited.include? x }
    if indeces.count == 0
      puts "number is invalid"
      redirect_to "/finish"
      return
    end
  end

  def survey
    params = passage_params

    indeces = (0..7).to_a
    visited = params[:visited].split(',').map(&:to_i)
    indeces.delete_if { |x| visited.include? x }
    indeces.shuffle!

    @index = indeces[0]
    @visited = params[:visited] + ',' + @index.to_s
    @user = params[:name]
    @is_lay = params[:is_lay]
    @place = params[:place]

    @old_aset = params[:old_aset]
    @pair = params[:pair]

    @passage = Passage.find(ArticleSet.find(@old_aset).ps[@index])
  end

  def finish_survey
  end

  require 'csv'

  def format_data
    original_out = $stdout.clone
    $stdout = File.new('data.csv', 'w')
    texts = []
    Chain.all.each do |chain|
      chain.passages.all.each do |passage|
        if passage.derivation > 1
          data = [passage.user, chain.identifier, passage.passage_id, passage.number, passage.text, passage.derivation, passage.time_spent]
          text = data.to_csv
          text += "\n"
          texts << text
        end
      end
    end
    @texts = texts
    $stdout = original_out
  end

  private

  def login_params
    {
      name: params[:name].to_s,
      is_lay: params[:is_lay].to_s == 'true',
      pair: params[:pair].to_i,
      place: params[:place].to_i
    }
  end

  def passage_params
    { 
      pair: params[:pair].to_i,
      place: params[:place].to_i,
      name: params[:name].to_s,
      is_lay: params[:is_lay].to_s == 'true',
      index: params[:index].to_i,
      visited: params[:visited].to_s,
      input: params[:input].to_s,
      source: params[:source].to_i,
      old_aset: params[:old_aset].to_i
    }
  end

end
