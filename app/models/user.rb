class User < ActiveRecord::Base
  has_many :created_games, :class_name => "Game", :foreign_key => "creater_id"
  has_many :game_rosters, :foreign_key => "player_id"
  has_many :joined_games, through: :game_rosters, :source => :game

  #has_and_belongs_to_many :joined_games, :class_name => "Game"
  acts_as_easy_captcha

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates_format_of :password,
                         :with => /\A(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{4,20}\Z/ ,
                            :message =>  "رمز عبور باید حتما شامل حداقل یک حرف بزرگ, یک حرف کوچک و رقم باشد." ,:if => '!password.nil?'
  validates_uniqueness_of :username
  # validates_presence_of :birth_year, :name, :lastname

end
