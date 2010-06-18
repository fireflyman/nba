class CtsController < ApplicationController
  # GET /cts
  # GET /cts.xml
  def index
    @cts = Ct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cts }
    end
  end

  # GET /cts/1
  # GET /cts/1.xml
  def show
    @ct = Ct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ct }
    end
  end

  # GET /cts/new
  # GET /cts/new.xml
  def new
    @ct = Ct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ct }
    end
  end

  # GET /cts/1/edit
  def edit
    @ct = Ct.find(params[:id])
  end

  # POST /cts
  # POST /cts.xml
  def create
    @ct = Ct.new(params[:ct])

    respond_to do |format|
      if @ct.save
        flash[:notice] = 'Ct was successfully created.'
        format.html { redirect_to(@ct) }
        format.xml  { render :xml => @ct, :status => :created, :location => @ct }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cts/1
  # PUT /cts/1.xml
  def update
    @ct = Ct.find(params[:id])

    respond_to do |format|
      if @ct.update_attributes(params[:ct])
        flash[:notice] = 'Ct was successfully updated.'
        format.html { redirect_to(@ct) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ct.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cts/1
  # DELETE /cts/1.xml
  def destroy
    @ct = Ct.find(params[:id])
    @ct.destroy

    respond_to do |format|
      format.html { redirect_to(cts_url) }
      format.xml  { head :ok }
    end
  end
end
