## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub_namespace.evh](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_hub_namespace_name"></a> [event\_hub\_namespace\_name](#input\_event\_hub\_namespace\_name) | The name of the event hub namespace | `string` | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Managed Service Identity Type of this Virtual Machine. | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The location for this resource to be put in | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | Map used to contain all dynamic settings | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | <pre>{<br>  "source": "terraform"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_primary_connection_string"></a> [default\_primary\_connection\_string](#output\_default\_primary\_connection\_string) | The primary connection string |
| <a name="output_default_primary_connection_string_alias"></a> [default\_primary\_connection\_string\_alias](#output\_default\_primary\_connection\_string\_alias) | The primary connection string alias |
| <a name="output_default_primary_key"></a> [default\_primary\_key](#output\_default\_primary\_key) | The primary key |
| <a name="output_default_secondary_connection_string"></a> [default\_secondary\_connection\_string](#output\_default\_secondary\_connection\_string) | The primary connection string |
| <a name="output_default_secondary_connection_string_alias"></a> [default\_secondary\_connection\_string\_alias](#output\_default\_secondary\_connection\_string\_alias) | The secondary connection string alias |
| <a name="output_default_secondary_key"></a> [default\_secondary\_key](#output\_default\_secondary\_key) | The secondary key |
| <a name="output_id"></a> [id](#output\_id) | The EventHub Namespace ID. |
| <a name="output_name"></a> [name](#output\_name) | The EventHub Namespace name. |
