*&---------------------------------------------------------------------*
*& Report zot_17_p_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_17_p_twitter.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_id TYPE i LENGTH 10 OBLIGATORY ,
              p_tweet TYPE c LENGTH 140 OBLIGATORY .
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_at RADIOBUTTON GROUP g1,
              p_degis RADIOBUTTON GROUP g1,
              p_sil  RADIOBUTTON GROUP g1,
              p_goster   RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b2.


START-OF-SELECTION.

DATA: twitter TYPE TABLE OF zot_17_t_twitter.

IF p_at = 'X'.



twitter = VALUE #(
        ( tweet_no  = p_id tweet = p_tweet
          )
     ).
     INSERT zot_17_t_twitter FROM TABLE @twitter.
     COMMIT WORK AND WAIT.


ELSEIF p_degis = 'X'.
twitter = VALUE #(
        ( tweet_no  = p_id tweet = p_tweet
          )
     ).
     MODIFY zot_17_t_twitter FROM TABLE @twitter.
     COMMIT WORK AND WAIT.

ELSEIF p_sil = 'X'.

DELETE FROM zot_17_t_twitter WHERE tweet_no = p_id and tweet = p_tweet .
COMMIT WORK AND WAIT.

ELSEIF p_goster = 'X'.

SELECT * FROM zot_17_t_twitter INTO TABLE @twitter.
cl_demo_output=>display( twitter ).


ENDIF.
