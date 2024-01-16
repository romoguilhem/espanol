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
    
    if @errors_array.nil?
      @translations = database.sample(@game.number_of_words)
    else
      # On va chercher dans la database les errors de la précédente game
      @translations = "Youpi"
    end
  end

  def correction
    # On récupère l'errorsArray
    @errors_array = JSON.parse(request.body.read)['errors_array']
    # render json: { message: 'Traitement réussi', data: @errors_array.count }
    @new_game = Game.new(number_of_words: @errors_array.count)

    if @new_game.save
      redirect_to game_path(@new_game)
    else
      redirect_to root_path
    end
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
