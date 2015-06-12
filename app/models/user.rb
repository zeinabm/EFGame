class User < ActiveRecord::Base
  has_many :created_games, :class_name => "Game", :foreign_key => "creater_id"
  has_many :game_boards, :foreign_key => "player_id", :dependent => :destroy
  has_many :joined_games, through: :game_boards, :source => :game
  has_one :judge_board, :class_name => "GameBoard", :foreign_key => "judge_id"
  has_many :chats, :foreign_key => "sender_id", :dependent => :destroy

  #has_and_belongs_to_many :joined_games, :class_name => "Game"
  acts_as_easy_captcha

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable :confirmable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_format_of :password,
                         :with => /\A(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{4,20}\Z/ ,
                            :message =>  "رمز عبور باید حتما شامل حداقل یک حرف بزرگ, یک حرف کوچک و رقم باشد." ,:if => '!password.nil?'
  validates_uniqueness_of :username
  validates_presence_of :birth_year, :name, :lastname

end
