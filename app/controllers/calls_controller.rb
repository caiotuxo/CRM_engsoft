class CallsController < ApplicationController
  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calls }
    end
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
    @call = Call.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/new
  # GET /calls/new.json
  def new
    @call = Call.new 
    @contacts = Contact.all


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/1/edit
  def edit
    @call = Call.find(params[:id])
    @contacts = Contact.all
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(params[:call])
    @call.contact = Contact.find(params[:contact][:contact_id])

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Ligacao agendada com sucesso.' }
        format.json { render json: @call, status: :created, location: @call }
      else
        format.html { render action: "new" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /calls/1
  # PUT /calls/1.json
  def update
    @call = Call.find(params[:id])
    if params[:contact]
      contact_id = params[:contact][:contact_id]
    end

    respond_to do |format|
      if @call.update_attributes(params[:call]) && (@call.contact = Contact.find(contact_id) unless !contact_id) && @call.save
        format.html { redirect_to @call, notice: 'Ligacao alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @call = Call.find(params[:id])
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call = Call.find(params[:id])
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :no_content }
    end
  end
end
