class LogsController < ApplicationController
  def create
    params['logs'].each do |log|
      Log.create!(log)
    end
    render_success
  end
end
