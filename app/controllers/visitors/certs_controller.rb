module Visitors
  class CertsController < VisitorsController
    before_action :set_cert, only: %i[ show edit update destroy ]

    # GET /certs or /certs.json
    def index
      @certs = Cert.all
    end

    # GET /certs/1 or /certs/1.json
    def show
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
