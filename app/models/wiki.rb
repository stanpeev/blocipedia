class Wiki
  include Mongoid::Document
  belongs_to :user

  field :title, type: String
  field :body, type: String
  field :private, type: Mongoid::Boolean


  
end
