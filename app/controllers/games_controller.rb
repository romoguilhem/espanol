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
    @errors_array = params[:array]
    
    if @errors_array.nil?
      # Cas d'une nouvelle game
      @translation_hashes = database.sample(@game.number_of_words)
    else
      # Cas d'une correction
      @translation_hashes = []
      
      # On va chercher dans la database les errors de la précédente game
      @errors_array.each do |word|
        @translation_hashes << database.find { |hash| hash["french"].include?(word) }
      end
    end
  end

  def correction
    # On récupère l'errorsArray
    errors_array = JSON.parse(request.body.read)['errors_array']

    # On lance la game de correction
    @new_game = Game.new(number_of_words: errors_array.count)

    if @new_game.save
      # On redirige vers la new game et on envoie l'errors_array
      redirect_to game_path(@new_game, array: errors_array)
    else
      render :new
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
    # Avec cette fonction database, on récupère alors un array de hash
  end
end
