resource "google_eventarc_pipeline_iam_binding" "eventarc_pipeline_iam_bindings" {
  for_each = var.eventarc_pipeline_iam_bindings

  members     = each.value.members
  pipeline_id = each.value.pipeline_id
  role        = each.value.role
  location    = each.value.location
  project     = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

