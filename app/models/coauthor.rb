class Coauthor < ActiveRecord::Base
  belongs_to :user
  belongs_to :lemma
  validates_presence_of :user, :lemma
  validates_associated :user, :lemma
  #-------------
  def active?
   activion
  end
  #----------------
end
