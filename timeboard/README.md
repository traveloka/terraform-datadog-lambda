terraform-datadog-timeboard-lambda
=================

Terraform module to create Datadog Timeboard for Lambda.



Usage
-----

```hcl
module "timeboard_lambda_beical-function" {
  source         = "github.com/traveloka/terraform-datadog-lambda.git//timeboard"
  product_domain = "BEI"
  function_name  = "beical-function"
}
```

Terraform Version
-----------------

This module was created using Terraform 0.11.7. 
So to be more safe, Terraform version 0.11.7 or newer is required to use this module.

Authors
-------

* [Karsten Ari Agathon](https://github.com/karstenaa)

License
-------

Apache 2 Licensed. See LICENSE for full details.
