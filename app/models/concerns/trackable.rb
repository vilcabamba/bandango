module Trackable
  extend ActiveSupport::Concern

  included do
    include PublicActivity::Common
  end

  def track_activity(action, owner, parameters={})
    create_activity action, owner: owner, params: changed_params(parameters)
  end

  def changed_params(parameters)
    # select changed attributes only
    parameters.select { |attribute, value|
      previous_changes.include?(attribute) and
      previous_changes[attribute].first.to_s.strip != previous_changes[attribute].last.to_s.strip
    } if parameters
  end
end
