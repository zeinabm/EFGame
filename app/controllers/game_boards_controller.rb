class GameBoardsController < ApplicationController
  before_action :set_game_board, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @game_boards = GameBoard.all
    respond_with(@game_boards)
  end

  def show
    @items = Item.all
    respond_with(@game_board)
  end

  def new
    @game_board = GameBoard.new
    respond_with(@game_board)
  end

  def edit
  end

  def create
    @game = Game.find(params[:game_id])
    @game_board = @game.game_boards.new()
    @game_board.player = current_user
    current_user.game_boards << @game_board
    
    validate_action_create
    @game_started = true if game_is_starting?
    
    respond_to do |format|
      if @game_board.save
        format.html { redirect_to @game_board, notice: 'game_board was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game_board }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @game_board.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    flash[:notice] = 'GameBoard was successfully updated.' if @game_board.update(game_board_params)
    respond_with(@game_board)
  end

  def destroy
    @game_board.destroy
    respond_with(@game_board)
  end
  
  private
    def game_is_starting?
      return @game.players.count >= @game.number_of_players
    end
    def game_is_full?
      return @game.players.count > @game.number_of_players
    end
    
    def validate_action_create
      @errors = []
      if game_is_full?
        @errors << 'ظرفیت این بازی تکمیل است'
      end
      if @game.players.where(:id => current_user.id).count != 0 and game_is_starting?
        @errors << 'شما قبلا به این بازی پیوسته اید و بازی شروع شده است.'
      end
    end
    
    def set_game_board
      @game_board = GameBoard.find(params[:id])
    end

    def game_board_params
      params.require(:game_board).permit(:game_id, :player_id)
    end
end