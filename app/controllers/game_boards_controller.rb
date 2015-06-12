class GameBoardsController < ApplicationController
  before_action :set_game_board, only: [:show, :judge, :submit, :edit, :update, :destroy]
  before_action :assign_judge_to_boards, only: :submit
  before_action :set_game, only: :submit

  respond_to :html

  def index
    @game_boards = GameBoard.all
    respond_with(@game_boards)
  end

  def show
    @items = Item.all
    @game_board = GameBoard.find(params[:id])
    @game = @game_board.game
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
  def submit
    @game_board.update(game_board_params)
    @game.update(done: 1)
    @judge_board = current_user.judge_board
  end
  
  def judge   
    @judge_board = current_user.judge_board
  end
    
  def calculate_score
    @score = 0
    @score = @score + 1 if params[:game_board][:Name] == "1"
    @score = @score + 1 if params[:game_board][:LastName] == "1"
    @score = @score + 1 if params[:game_board][:City] == "1"
    @score = @score + 1 if params[:game_board][:Country] == "1"
    @score = @score + 1 if params[:game_board][:food] == "1"
    @score = @score + 1 if params[:game_board][:animal] == "1"
    @score = @score + 1 if params[:game_board][:object] == "1"
    flash[:notice] = @score
    @game_board = GameBoard.find(params[:id])
    @game_board.update(score: @score + @game_board.score, has_been_judged?: true, judge: nil)
    @game = Game.find(@game_board.game_id)
    
    if @game.game_boards.any? {|i| !i.has_been_judged?}
      @wait = true
    else 
      @wait = false
    end
    
    respond_to do |format|
        format.js
    end
  end
  

  def destroy
    @game_board.destroy
    redirect_to games_path
  end
  
  private
  def assign_judge_to_boards 
    game = Game.find(@game_board.game_id)
    if !game.went_for_judgement
      game.went_for_judgement = true
      game.save
      players = game.players
      judge_players = game.players
      players.each do |player|
        selected_as_judge = judge_players.select{|a| a!=player}.sample
        # logger.warn "selected_as_judge #{selected_as_judge.attributes.inspect}"
        player.game_boards.first.update(judge_id: selected_as_judge.id)
        judge_players = judge_players - [selected_as_judge]
      end   
    end 
  end
    
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
    def set_game
      @game = Game.find(@game_board.game_id)
    end

    def game_board_params
      params.require(:game_board).permit(:game_id, :player_id, :judge_id, :Name, :LastName, :City, :Country, :food, :animal, :object)
    end
end