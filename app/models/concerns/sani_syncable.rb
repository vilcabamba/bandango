module SaniSyncable
  extend ActiveSupport::Concern

  included do
    attr_accessor :dont_sync

    after_create  :after_create_sync
    after_update  :after_update_sync
    after_destroy :after_destroy_sync
  end

  private

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
    SaniPostWorker.perform_async(self.send(:sani_json), self.class.name.downcase, action, Time.now.to_json) unless dont_sync
  end
  def sani_json
    Hash.new.tap { |hash|
      sani_attributes.each do |attribute|
        hash[attribute] = send(attribute)
      end
    }.to_json
  end
end
