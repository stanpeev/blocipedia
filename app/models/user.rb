class User
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  # wikis I created
  has_many :wikis

  has_many :collaborators

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :name,               type: String, default: ""
  field :role,               type: String, default: "standard"

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ##Confirmable
   field :confirmation_token,   type: String
   field :confirmed_at,         type: Time
   field :confirmation_sent_at, type: Time
   field :unconfirmed_email,    type: String # Only if using reconfirmable


  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  def standard?
    role == 'standard'
  end

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

   def self.search(query)
    where("name like ?", "%#{query}%") 
  end

  private

   def user_params
    params.require(:user).permit(:name, :email)
  end
end
