class Wiki
  include Mongoid::Document
  belongs_to :user

  scope :visible_to, -> (user) { user && ((user.role == 'premium') || (user.role == 'admin')) ? all : where((private == false) || (private == nil))  }

  field :title, type: String
  field :body, type: String
  field :private, type: Mongoid::Boolean

end
