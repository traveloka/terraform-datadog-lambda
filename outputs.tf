output "timeboard_title" {
  value       = "${join(",", datadog_timeboard.lambda.*.title)}"
  description = "The title of datadog timeboard for Lambda"
}
