class FlightsController < ProtectedController
  before_action :set_flight, only: %i[show update destroy]

  # GET /flights
  def index
    @flights = current_user.flights.all.order(date: :desc)
    # @flights = Flight.all
    render json: @flights
  end

  # GET /flights/1
  def show
    render json: @flight
  end

  # POST /flights
  def create
    @flight = current_user.flights.build(flight_params)
    # @flight = Flight.new(flight_params)
    if @flight.save
      render json: @flight, status: :created, location: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /flights/1
  def update
    if @flight.update(flight_params)
      render json: @flight
    else
      render json: @flight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /flights/1
  def destroy
    @flight.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flight
    @flight = current_user.flights.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def flight_params
    params.require(:flight).permit(:user_id, :flight_type, :date, :time, :distance, :duration, :launch, :lz, :wing, :notes)
  end
end
