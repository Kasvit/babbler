# frozen_string_literal: true

module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend 'flash-message', partial: 'layouts/flash_message'
  end
end
