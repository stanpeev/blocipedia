class WikiPolicy < ApplicationPolicy

  def index?
  end

  def show?
   (user.present? && ((user.role == 'premium') || (user.role == 'admin'))) || record.private != true
  end

 end