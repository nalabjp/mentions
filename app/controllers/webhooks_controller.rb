class WebhooksController < ApplicationController
  before_action :set_webhook

  def create
    @webhook.run(payload: request.raw_post)
    head :no_content
  end

  def show
    head :ok
  end

  private

  def set_webhook
    @webhook = Webhook.new_by_token(params[:token]) || Webhook.find_by!(token: params[:token])
  end
end
