module Authors
  class CertsController < AuthorsController
    before_action :set_cert, only: %i[ show edit update destroy ]

    # GET /certs or /certs.json
    def index
      @certs = Cert.all
    end

    # GET /certs/1 or /certs/1.json
    def show
    end

    # GET /certs/new
    def new
      @cert = Cert.new
    end

    # GET /certs/1/edit
    def edit
    end

    # POST /certs or /certs.json
    def create
      @cert = Cert.new(cert_params)

        if @cert.save
        else
        end
      redirect_to edit_cert_path(@cert)
    end

    # PATCH/PUT /certs/1 or /certs/1.json
    def update
      respond_to do |format|
        if @cert.update(cert_params)
          format.html { redirect_to cert_url(@cert), notice: "Cert was successfully updated." }
          format.json { render :show, status: :ok, location: @cert }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @cert.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /certs/1 or /certs/1.json
    def destroy
      @cert = Cert.find(params[:id])
      @cert.destroy
      redirect_to certs_path, status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cert
        @cert = Cert.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def cert_params
        params.require(:cert).permit(:title, :date_awarded, :description)
      end
  end
end
