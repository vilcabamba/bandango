bandango = YAML::load_file(File.join(Rails.root.to_s, "config", "bandango.yml"))
SANI = {
  business_token: bandango["business_token"],
  token: bandango["token"],
  host:  bandango["host"]
}
