class RequestDrugsController < ApplicationController
  before_action :set_request_drug, only: [:show, :edit, :update, :destroy]

  def index
    @request_drugs = RequestDrug.all
  end

  def show
  end

  def new
    @request_drug = RequestDrug.new
  end

  def edit
  end

  def create
    @request = Request.find(params[:request_id])
    @new_request_drug = @request.request_drugs.build(request_drug_params)

    if @new_request_drug.save
      redirect_to @request, notice: 'Request drug was successfully created.'
    else
      render :new
    end
  end

  def update
    if @request_drug.update(request_drug_params)
      redirect_to @request_drug, notice: 'Request drug was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @request_drug.destroy

    redirect_to @request_drug.request, notice: 'Request drug was successfully destroyed.'
  end

  private

    def set_request_drug
      @request_drug = RequestDrug.find(params[:id])
    end

    def request_drug_params
      params.require(:request_drug).permit(:id, :drug_id, :request_id)
    end
end
