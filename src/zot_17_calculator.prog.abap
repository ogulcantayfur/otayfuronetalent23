*&---------------------------------------------------------------------*
*& Report zot_17_calculator
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_17_calculator.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_val1 TYPE i OBLIGATORY ,
              p_val2 TYPE i OBLIGATORY .
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_topla RADIOBUTTON GROUP g1,
              p_cikar RADIOBUTTON GROUP g1,
              p_carp  RADIOBUTTON GROUP g1,
              p_bol   RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b2.


START-OF-SELECTION.

IF p_topla = 'X'.
  DATA(lv_toplama) = p_val1 + p_val2.
  cl_demo_output=>write( lv_toplama ).
ELSEIF p_cikar = 'X'.
  DATA(lv_cikarma) = p_val1 - p_val2.
  cl_demo_output=>write( lv_cikarma ).
ELSEIF p_carp = 'X'.
  DATA(lv_carpma)  = p_val1 * p_val2.
  cl_demo_output=>write( lv_carpma ).
ELSEIF p_bol = 'X'.
  IF p_val2 = 0 .
  cl_demo_output=>write( 'Geçersiz İşlem' ).
  ElSE.
  DATA lv_bolme TYPE p decimals 4.
  lv_bolme   = p_val1 / p_val2.
  cl_demo_output=>write( lv_bolme ).
  ENDIF.
ENDIF.

cl_demo_output=>display(  ).
