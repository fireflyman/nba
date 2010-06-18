class CoauthorsController < ApplicationController
  before_filter :load_coauthor
  before_filter :new_coauthor_from_params, :only => :create
  filter_access_to :all, :attribute_check => true
  def create
    if @coauthor.save
      flash[:notice] = '成功加入该词条的共同创作者！'
      redirect_to @lemma
    else
      flash[:notice] = '试图加入该词条的共同创作者失败！'
      redirect_to @lemma
    end
  end
 
  def destroy
    @coauthor = Coauthor.find(params[:id])
    @coauthor.destroy
    flash[:notice] = "成功退出该词条的共同创作者！"
    redirect_to @lemma
  end
 
  protected
  def load_coauthor
    @lemma = Lemma.find(params[:lemma_id])
  end
 
  def new_coauthor_from_params
    @coauthor = @lemma.coauthors.new(:user => current_user)
  end
end