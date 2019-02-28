class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    # will change by pundit
    # @flats = policy_scope(Flat).order(created_at: :desc)
    # @flats = Flat.all
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/flats/map_box")
      }
    end
  end

  # render form
  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    # assign signed-in user
    @flat.user = current_user
    authorize @flat

    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
    # authorization in set_flat
  end

  def edit
    # authorize @flat
  end

  def update
    # authorize @flat
    # allowed params; redirect to concrete flat
    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def flat_params
    params.require(:flat).permit(:name, :description, :photo, :price, :address, :location, :capacity)
  end
end
