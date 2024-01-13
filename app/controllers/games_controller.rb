class GamesController < ApplicationController
  def new
    @game = Game.new

    @database_size = database.count
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])

    @translations = database.sample(@game.number_of_words)
  end

  private

  def game_params
    params.require(:game).permit(:number_of_words)
  end

  def database
    require "json"
    filepath = "db/translations.json"
    read = File.read(filepath)
    json = JSON.parse(read)
    return json["translations"]
  end
end
