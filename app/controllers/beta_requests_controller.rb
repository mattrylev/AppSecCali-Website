class BetaRequestsController < ApplicationController
  def create
    beta_request = BetaRequest.new(beta_request_params)

    if beta_request.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      flash[:error] = beta_request.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  private

  def beta_request_params
    params.require(:beta_request).permit(:name, :email)
  end
end