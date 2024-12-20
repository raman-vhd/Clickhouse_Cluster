variable "ssh_key_master" {
  description = "Master ssh public key file path to get attached to all servers. (leave empty for no master ssh-key)"
  type        = string
}

variable "local_files_path" {
  description = "Path to store local files generated"
  type        = string

  validation {
    condition     = provider::local::direxists(pathexpand(var.local_files_path))
    error_message = "Local file path cannot be empty"
  }
}
