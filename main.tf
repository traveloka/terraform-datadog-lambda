locals {
  monitor_enabled = "${var.enabled && length(var.recipients) > 0 ? 1 : 0}"
}

resource "datadog_timeboard" "lambda" {
  count = "${var.enabled ? 1 : 0}"

  title       = "${var.product_domain} - ${var.function_name} - Lambda"
  description = "A generated timeboard for Lambda"

  template_variable {
    default = "${var.function_name}"
    name    = "function_name"
    prefix  = "functionname"
  }

  template_variable {
    default = "${var.environment}"
    name    = "environment"
    prefix  = "environment"
  }

  graph {
    title     = "Duration"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:aws.lambda.duration{$function_name, $environment} by {functionname}"
      type = "line"
    }

    request {
      q    = "avg:aws.lambda.duration.sum{$function_name, $environment} by {functionname}"
      type = "line"
    }

    request {
      q    = "avg:aws.lambda.duration.maximum{$function_name, $environment} by {functionname}"
      type = "line"
    }

    request {
      q    = "avg:aws.lambda.duration.minimum{$function_name, $environment} by {functionname}"
      type = "line"
    }
  }

  graph {
    title     = "Errors"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:aws.lambda.errors{$function_name, $environment} by {functionname}.as_count()"
      type = "area"
    }
  }

  graph {
    title     = "Invocations"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:aws.lambda.invocations{$function_name, $environment} by {functionname}.as_count()"
      type = "area"
    }
  }

  graph {
    title     = "Throttles"
    viz       = "timeseries"
    autoscale = true

    request {
      q    = "avg:aws.lambda.throttles{$function_name, $environment} by {functionname}.as_count()"
      type = "area"
    }
  }
}
