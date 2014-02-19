SANI = YAML::load_file(File.join(Rails.root.to_s, "config", "bandango.yml")).symbolize_keys
