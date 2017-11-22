class RootController < ApplicationController
  def index
    render json: {bye: true}
  end

  def status
    version = `youtube-dl --version`.strip
    render json: {version: version}
  end

  def upgrade
    out = `youtube-dl --update`.strip
    render json: {out: out}
  end
end
