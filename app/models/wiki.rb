class Wiki
  include Mongoid::Document
  
  # the creator
  belongs_to :user

  has_many :collaborators

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((private == false) || (private == nil))  }

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

  field :title, type: String
  field :body, type: String
  field :private, type: Mongoid::Boolean

end
