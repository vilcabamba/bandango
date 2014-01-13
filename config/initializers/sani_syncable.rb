bandango = YAML::load_file(File.join(Rails.root.to_s, "config", "bandango.yml"))
SANI = {
  token: bandango["token"],
  host:  bandango["host"]
}
