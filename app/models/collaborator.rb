class Collaborator
  include Mongoid::Document

  belongs_to :user
  belongs_to :wiki

def self.search(collaborator_name)
    if collaborator_name
        collaborator_name.downcase!
        where('LOWER(name) LIKE ?', "%#{collaborator_name}%")
    else
        all
    end
end
end
