class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,  :only => [:new, :create, :edit, :update, :destroy]
  respond_to :html

  def index
    @games = Game.not_started
    respond_with(@games)
  end

  def show
    @players = @game.players
    respond_with(@game)
  end

  def new
    @game = Game.new
    respond_with(@game)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    @game.creater_id = current_user.id
    if @game.save
      game_board = GameBoard.new(:player_id => current_user.id, :game_id => @game.id)
      game_board.save
    end
    flash[:notice] = 'Game was successfully created.' if @game.save
    if game_has_started?
      flash[:notice] = 'بازی شروع شده است.'
      redirect_to game_board
    else
      respond_with(@game)
    end
  end



  def update
    @game = Game.find(params[:id])
    flash[:notice] = 'Game was successfully updated.' if @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.destroy
    respond_with(@game)
  end
  def isSubmit
   
   @submit = 0
   @users = GameBoard.where(game_id: params[:id])
   @game = Game.find(params[:id])
    @submit = @game.done
    flash[:notice] =@submit
    render :layout => false

  end
  def calculate_score
    @game = Game.find(params[:id])
    @users = GameBoard.where(game_id: @game.id)
    @board = params[:game_board]
    if(@game.done === 1)
      @game.update(number_of_rounds: @game.number_of_rounds-1 , done: 0)  
    end
  end
  private
    def game_has_started?
      return @game.players.count >= @game.number_of_players
    end
    def is_final_user?
      return @game.players.count == @game.number_of_players
    end
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:creater_id, :number_of_rounds, :number_of_players, :players)
    end
end
