CLASS lhc_customer DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR customer RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR customer RESULT result.
    METHODS valcreate FOR VALIDATE ON SAVE
      IMPORTING keys FOR customer~valcreate.

ENDCLASS.

CLASS lhc_customer IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD valCreate.

    DATA: go_regex   TYPE REF TO cl_abap_regex,
          go_matcher TYPE REF TO cl_abap_matcher,
          go_match   TYPE c LENGTH 1,
          gv_msg     TYPE string.

    READ ENTITIES OF zr_customert IN LOCAL MODE
    ENTITY customer
    FIELDS ( Email Name )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_result)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    IF lt_reported IS NOT INITIAL OR lt_failed IS NOT INITIAL.
      reported = CORRESPONDING #( DEEP lt_reported ).
      failed = CORRESPONDING #( DEEP lt_failed ).

    ELSE.
      LOOP AT lt_result INTO DATA(ls_result).
        IF ls_result-Name IS INITIAL.
          failed-customer = VALUE #( BASE failed-customer ( %tky = ls_result-%tky ) ).
          reported-customer = VALUE #( BASE reported-customer ( %tky = ls_result-%tky
                                                                %msg = new_message_with_text( text = 'Name is missing' ) ) ).
        ENDIF.
        IF ls_result-Email IS INITIAL.
          failed-customer = VALUE #( BASE failed-customer ( %tky = ls_result-%tky ) ).
          reported-customer = VALUE #( BASE reported-customer ( %tky = ls_result-%tky
                                                                %msg = new_message_with_text( text = 'Email is missing' ) ) ).

        ELSE.

          CREATE OBJECT go_regex
            EXPORTING
              pattern     = '\w+(\.\w+)*@(\w+\.)+(\w{2,4})'
              ignore_case = abap_true.

          go_matcher = go_regex->create_matcher( text = ls_result-Email ).

          IF go_matcher->match( ) IS INITIAL.
            failed-customer = VALUE #( BASE failed-customer ( %tky = ls_result-%tky ) ).
            reported-customer = VALUE #( BASE reported-customer ( %tky = ls_result-%tky
                                                                  %msg = new_message_with_text( text = 'Email is invalid enter correct email address' ) ) ).

          ENDIF.

        ENDIF.
      ENDLOOP.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
