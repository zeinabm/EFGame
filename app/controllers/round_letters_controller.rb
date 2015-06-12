class RoundLettersController < ApplicationController
  before_action :set_round_letter, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @round_letters = RoundLetter.all
    respond_with(@round_letters)
  end

  def show
    respond_with(@round_letter)
  end

  def new
    @round_letter = RoundLetter.new
    respond_with(@round_letter)
  end

  def edit
  end

  def create
    @game = Game.find(params[:game_id])
    @round_letter = @game.round_letters.new()
    @round_letter.letter = params[:letter]
    flash[:notice] = '' if @round_letter.save
    redirect_to(@game) and return
  end

  def update
    flash[:notice] = 'RoundLetter was successfully updated.' if @round_letter.update(round_letter_params)
    respond_with(@round_letter)
  end

  def destroy
    @round_letter.destroy
    respond_with(@round_letter)
  end

  private
    def set_round_letter
      @round_letter = RoundLetter.find(params[:id])
    end

    def round_letter_params
      params.require(:round_letter).permit(:game_id, :letter)
    end
end
