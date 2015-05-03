class GameBoardsController < ApplicationController
  before_action :set_game_board, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @game_boards = GameBoard.all
    respond_with(@game_boards)
  end

  def show
    @items = Item.all
    @game_board = GameBoard.find(params[:id])
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
    @game_board.score = 0
    current_user.game_boards << @game_board
    @started_game_board = GameBoard.where(:game_id => params[:game_id], :player_id => current_user.id).first
    validate_action_create
    @game_started = true if game_is_starting?
    @game_boards = GameBoard.where(:game_id => params[:game_id])

    respond_to do |format|
      if @game_board.save
	    # PrivatePub.publish_to("/game_rosters/new", game: @game)
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
    
  def calculate_score
    @score =0
    params[:game_board].each { |i| if i.at(1)!="" then @score=@score+1 end }
    flash[:notice] = @score
    @game_board = GameBoard.find(params[:id])
    @game_board.update(score: @score + @game_board.score)
    @game = Game.find(@game_board.game_id)
    @game.update(done: 1)
    @user = User.find(@game_board.player_id)
    @user.update(score: @score + @user.score)

  end

  def destroy
    # if @game_board.destroy
    #   redirect_to game_boards_path
    # end
     def destroy
@game_board.destroy
respond_with(@game_board)
end
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
    end
    
    def is_final_user?
      return @game.players.count == @game.number_of_players
    end


    def set_game_board
      @game_board = GameBoard.find(params[:id])
    end

    def game_board_params
      params.require(:game_board).permit(:game_id, :player_id)
    end
end