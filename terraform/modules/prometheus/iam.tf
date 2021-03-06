resource "google_service_account" "prometheus" {
  account_id   = "${var.name}"
  display_name = "${var.name}"

  count = "${var.create_resources}"
}

resource "google_project_iam_member" "prometheus" {
  project = "${var.project}"
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.prometheus.email}"

  count = "${var.create_resources}"
}
