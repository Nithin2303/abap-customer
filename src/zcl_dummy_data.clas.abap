CLASS zcl_dummy_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dummy_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  MODIFY ENTITIES OF zr_customert
  ENTITY customer
  CREATE AUTO FILL CID
  WITH VALUE #( ( Name = 'BEAN' %control-Name = if_abap_behv=>mk-on ) )
  MAPPED DATA(ls_mapped)
  REPORTED DATA(ls_reported).

  if ls_mapped is not initial.
  out->write( 'data being commited' ).
  commit entities response of zr_customert
  failed data(ls_commit_failed)
  reported data(ls_commit_reported).
  endif.

  ENDMETHOD.
ENDCLASS.
