@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'restricted view on top of interface view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zr_customert as select from zi_customert

{
    key CustomerUuid,
    Name,
    City,
    Country,
    Email,
    @Semantics.systemDateTime.createdAt: true
    Createdat,
    @Semantics.user.createdBy: true
    Createdby,
    @Semantics.systemDateTime.lastChangedAt: true
    Lastchangedat,
    @Semantics.user.lastChangedBy: true
    Lastchangedby 
}
