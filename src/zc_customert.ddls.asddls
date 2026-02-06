@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view for customer'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_customert
  provider contract transactional_query
  as projection on zr_customert
{
  key CustomerUuid,
      Name,
      City,
      Country,
      Email,
      Createdat,
      Createdby,
      Lastchangedat,
      Lastchangedby
}
