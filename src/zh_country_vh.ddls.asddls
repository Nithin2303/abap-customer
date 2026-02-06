@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'country value help derived from i_country_vh'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZH_COUNTRY_VH as select from I_CountryVH
{
    key Country,
    Description,
    CountryThreeLetterISOCode,
    CountryThreeDigitISOCode,
    /* Associations */
    _Text
}
