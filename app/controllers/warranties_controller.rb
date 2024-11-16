class WarrantiesController < ApplicationController
  def index
    @warranties = policy_scope(Warranty)
    render json: @warranties.map { |warranty| WarrantySerializer.call(warranty) }
  end

  def show
    authorize warranty
    render json: WarrantySerializer.call(warranty)
  end

  def create
    @warranty = Warranty.new(permitted_attributes(Warranty.new))
    authorize @warranty 
    @warranty.save!
    render json: WarrantySerializer.call(@warranty), status: :created
  end

  def update
    authorize warranty
    warranty.update!(permitted_attributes(warranty))
    render json: { status: 'success', message: 'Garantia atualizada com sucesso', data: warranty }, status: :ok
  end

  def destroy
    authorize warranty
    warranty.destroy
    render_deletion_message('Warranty')
  end

  private

  def warranty
    @warranty ||= Warranty.find(params[:id])
  end
end
