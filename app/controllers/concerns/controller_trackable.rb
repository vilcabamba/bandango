module ControllerTrackable
  protected

  def track!(resource, options={})
    default_options = {params: :fetch, action: params[:action]}
    options = default_options.merge(options)
    # get params based on resource class name
    options[:params] = send(resource.class.name.underscore + "_params") if options[:params] == :fetch
    resource.track_activity(options[:action], current_user, options[:params])
  end
end
