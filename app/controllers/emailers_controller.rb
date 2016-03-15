class EmailersController < ApplicationController
  before_action :set_emailer, only: [:show, :edit, :update, :destroy]

  # GET /emailers
  # GET /emailers.json
  def index

    # UserMailer.welcome.deliver
    # UserMailer.delay.welcome

    MailWorker.perform_async

    render :text =>"Thank you for singing up" and return
  end

  # GET /emailers/1
  # GET /emailers/1.json
  def show
  end

  # GET /emailers/new
  def new
    @emailer = Emailer.new
  end

  # GET /emailers/1/edit
  def edit
  end

  # POST /emailers
  # POST /emailers.json
  def create
    @emailer = Emailer.new(emailer_params)

    respond_to do |format|
      if @emailer.save
        format.html { redirect_to @emailer, notice: 'Emailer was successfully created.' }
        format.json { render :show, status: :created, location: @emailer }
      else
        format.html { render :new }
        format.json { render json: @emailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emailers/1
  # PATCH/PUT /emailers/1.json
  def update
    respond_to do |format|
      if @emailer.update(emailer_params)
        format.html { redirect_to @emailer, notice: 'Emailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @emailer }
      else
        format.html { render :edit }
        format.json { render json: @emailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emailers/1
  # DELETE /emailers/1.json
  def destroy
    @emailer.destroy
    respond_to do |format|
      format.html { redirect_to emailers_url, notice: 'Emailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emailer
      @emailer = Emailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emailer_params
      params.fetch(:emailer, {})
    end
end
