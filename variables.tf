variable "eventarc_pipeline_iam_bindings" {
  description = <<EOT
Map of eventarc_pipeline_iam_bindings, attributes below
Required:
    - members
    - pipeline_id
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members     = set(string)
    pipeline_id = string
    role        = string
    location    = optional(string)
    project     = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

