class WarrantiesController < ApplicationController
  def index
    @warranties = policy_scope(Warranty) # Usa o Pundit para filtrar os registros que o usuário pode acessar
    render json: @warranties.map { |warranty| WarrantySerializer.call(warranty) }
    @warranties = policy_scope(Warranty) # Usa o Pundit para filtrar os registros que o usuário pode acessar
    render json: @warranties.map { |warranty| WarrantySerializer.call(warranty) }
  end

  def show
    authorize @warranty
    render json: WarrantySerializer.call(@warranty)
  end

  def update
    authorize @warranty
    render json: @warranty.update(warranty_params) ? WarrantySerializer.call(@warranty) : { errors: @warranty.errors.full_messages },
    status: @warranty.errors.any? ? :unprocessable_entity : :ok
  end

  def create
    @warranty = Warranty.new(warranty_params)
    authorize @warranty # Garantir que o usuário tem permissão para criar uma warranty.

    @warranty.save ?
      render(json: WarrantySerializer.call(@warranty), status: :created) :
      render(json: { errors: @warranty.errors.full_messages }, status: :unprocessable_entity)
  end

  def destroy
    authorize @warranty # Garantir que o usuário tem permissão para excluir a warranty

    @warranty.destroy ? head(:no_content) : render(json: { error: 'Failed to delete warranty' }, status: :unprocessable_entity)
  end

  private

  def warranty
  def warranty
    @warranty ||= Warranty.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Warranty not found' }, status: :not_found
  end

  def warranty_params
    params.require(:warranty).permit(:field1, :field2, :field3) # Substitua por os campos reais da sua warranty
  end

  def warranty_params
    params.require(:warranty).permit(:field1, :field2, :field3) # Substitua por os campos reais da sua warranty
  end
end
