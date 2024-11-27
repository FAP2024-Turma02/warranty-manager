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
    @warranty = Warranty.new(permitted_attributes(Warranty))

    authorize @warranty

    @warranty.save!

    render json: WarrantySerializer.call(@warranty), status: :created
  end

  def update
    authorize warranty

    warranty.update!(permitted_attributes(warranty))

    render json: WarrantySerializer.call(warranty), status: :ok
  end

  def destroy
    authorize warranty

    warranty.destroy

    head :no_content
  end

  private

  def permitted_attributes(klass)
    params.require(:warranty).permit(:product_id, :warranty_number,
    :issue_date, :expirity_date, :validity_period)
  end

  def warranty
    @warranty ||= Warranty.find(params[:id])
  end

  def render_created(resource)
    render json: WarrantySerializer.call(resource), status: :created
  end

  def render_errors(resource)
    render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
  end
end
