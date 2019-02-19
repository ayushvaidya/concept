class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = current_user.lists.build
  end

  # GET /lists/1/edit
  def edit
  end

  def sort
    params[:list].each_with_index do |id, index|
      List.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to project_path(id: @list.project_id), notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: project_path(id: @list.project_id) }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to project_path(id: @list.project_id), notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: project_path(id: @list.project_id) }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to project_path(id: @list.project_id), notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:project_id, :epic_id, :name)
    end
end
