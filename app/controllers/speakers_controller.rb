class SpeakersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: ENV['ADMIN_PASSWORD'] || 'ASDF', :except => [:cfp, :new, :create, :index, :show, :privacy]
  before_action :set_speaker, only: [:edit, :update, :destroy]

  # GET /speakers
  def index
    @speakers = Speaker.all
  end

  def cfp
  end

  def privacy
  end

  # GET /speakers/1
  def show
    @speaker = Speaker.find(params[:id])
    raise ActiveRecord::RecordNotFound .new('Not Found') unless @speaker.confirmed?
  end

  # GET /speakers/new
  def new
    @speaker = Speaker.new
  end

  # GET /speakers/1/edit
  def edit
  end

  # POST /speakers
  def create
    @speaker = Speaker.new(speaker_params)

    if @speaker.save
      flash[:notice] = "Thanks for submitting!"
      Notifier.cfp_submission(@speaker).deliver
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /speakers/1
  def update
    if @speaker.update(speaker_params)
      redirect_to @speaker, notice: 'Speaker was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /speakers/1
  def destroy
    @speaker.destroy
    redirect_to speakers_url, notice: 'Speaker was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def speaker_params
      params.require(:speaker).permit(:name, :bio, :email, :image_url, :twitter_handle, :title, :company, :website, :training, :abstract)
    end
end
