class Lemma < ActiveRecord::Base
 #------------添加標簽云-----
  acts_as_taggable
 #-----------------------------
  has_many :coauthors
  has_many :users ,:through => :coauthors
 #-----------------------------  
 named_scope :reward, :select => "id,title,point",:limit=> 10,:order =>"point DESC"
 named_scope :latest, :select => "id,title,updated_at",:limit=> 10,:order =>"updated_at DESC"
 named_scope :hot, :select => "id,title,hits",:limit=> 10,:order =>"hits DESC"
 
  def contains?(user)
    not contains(user).nil?
  end
 
  def contains(user)
    coauthors.find_by_user_id(user)
  end
 #---------------------------------
 
 def hit!
  self.class.increment_counter :hits, id
 end
 
end
