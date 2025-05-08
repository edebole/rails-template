if NextRails.next?
  Rails.application.config.enable_reloading = true
  Rails.application.config.action_mailer.default_url_options = { host: "localhost", port: 3000 }
  Rails.application.config.active_job.verbose_enqueue_logs = true
  Rails.application.config.action_view.annotate_rendered_view_with_filenames = true
  Rails.application.config.action_controller.raise_on_missing_callback_actions = true
end
