module SaniSyncable
  extend ActiveSupport::Concern

  included do
    attr_accessor :dont_sync

    after_create  :after_create_sync
    after_update  :after_update_sync
    after_destroy :after_destroy_sync
  end

  def after_create_sync
    sync_to_sani "create"
  end
  def after_update_sync
    sync_to_sani "update"
  end
  def after_destroy_sync
    sync_to_sani "destroy"
  end
  def sync_to_sani(action)
    SaniPostWorker.perform_async(self.to_json, self.class.name.downcase, action, Time.now.to_json) unless dont_sync
  end
end
