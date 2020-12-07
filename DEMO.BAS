_TITLE "Merry Christmas"
_MOUSEHIDE
_FULLSCREEN _STRETCH , _SMOOTH
SCREEN _NEWIMAGE(640, 400, 256)
_DISPLAY
'_PRINTMODE _KEEPBACKGROUND
RANDOMIZE USING TIMER
MSG$ = SPACE$(42) + "MERRY CHRISTMAS!" + SPACE$(82) + "  FROM PQWARE!  " + SPACE$(40)
'C = CINT(RND)
'IF C = 0 THEN C = 2: ELSE C = 4
COLOR 48, 184
DIM X(0 TO 255)
DIM Y(0 TO 255)
DIM F(0 TO 255)
DIM W(0 TO 255)
WS = CINT(RND * 200) - 100
FOR I = 0 TO 255
    X(I) = CINT(RND * 685) - 46 'CINT(RND * 639)
    Y(I) = CINT(RND * 399)
    F(I) = RND * 0.25 + 0.15
    W(I) = WS / 500
NEXT
IF _FILEEXISTS("SPF.SND") THEN SPF& = _SNDOPEN("SPF.SND"): _SNDLOOP SPF&
DO
    'CLS 0, 0
    CW = CINT(RND * 15) + 5
    FOR L = 0 TO CW
        FOR K = 0 TO 5
            _LIMIT 15
            FOR J = 0 TO 4
                FOR I = 0 TO 255
                    PSET (X(I), Y(I)), 0
                    Y(I) = Y(I) + F(I)
                    X(I) = X(I) + W(I)
                    PSET (X(I), Y(I)), 15
                    IF Y(I) > 137 AND Y(I) < 141 AND CINT(RND * 31) = 0 THEN
                        PSET (X(I), Y(I)), 0
                        PSET (X(I), 139), 15
                        Y(I) = 401
                    END IF
                    IF Y(I) > 397 + CINT(RND * 3) THEN
                        'PSET (X(I), 399), 15
                        X(I) = CINT(RND * 735) - 46
                        Y(I) = 0
                        F(I) = RND * 0.25 + 0.15
                        W(I) = WS / 500
                    END IF
                NEXT
                _PRINTSTRING (0, 140), MSG$
                FOR I = 0 TO 255
                    IF F(I) > 0.3 THEN
                        PSET (X(I), Y(I)), 15
                    END IF
                NEXT

                _DISPLAY
            NEXT
            PSET (CINT(RND * 639), 397 + CINT(RND * 9)), 0
        NEXT
        MSG$ = RIGHT$(MSG$, LEN(MSG$) - 1) + LEFT$(MSG$, 1)
    NEXT
    WS = CINT(RND * 200) - 100
LOOP
