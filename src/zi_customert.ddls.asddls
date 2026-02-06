@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface entity view for customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_customert
  as select from zdemo_customer
{
  key customer_uuid as CustomerUuid,
      name          as Name,
      city          as City,
      country       as Country,
      email         as Email,
      createdat     as Createdat,
      createdby     as Createdby,
      lastchangedat as Lastchangedat,
      lastchangedby as Lastchangedby
}
