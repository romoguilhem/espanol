class GamesController < ApplicationController
  def new
    @game = Game.new
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

    require "json"
    filepath = "db/translations.json"
    read = File.read(filepath)
    translations = JSON.parse(read)

    # @translations = translations
    @translations = translations["translations"].sample(@game.number_of_words)
  end

  private

  def game_params
    params.require(:game).permit(:number_of_words)
  end
end
