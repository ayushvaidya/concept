class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = current_user.cards.build
  end

  # GET /cards/1/edit
  def edit
  end

  def sort
    params[:card].each_with_index do |id, index|
      Card.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end


  # POST /cards
  # POST /cards.json
  def create
    @card = current_user.cards.build(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to project_path(id: @card.project_id), notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: project_path(id: @card.project_id) }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update

    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to project_path(id: @card.project_id), notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: project_path(id: @card.project_id) }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to project_path(id: @card.project_id), notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:list_id, :epic_id, :project_id, :name)
    end
end
