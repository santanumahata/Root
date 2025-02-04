ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      DOUBLE COMPLEX FUNCTION COND(CONDITION,TRUECASE,FALSECASE)
      IMPLICIT NONE
      DOUBLE COMPLEX CONDITION,TRUECASE,FALSECASE
      IF(CONDITION.EQ.(0.0D0,0.0D0)) THEN
        COND=TRUECASE
      ELSE
        COND=FALSECASE
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION CONDIF(CONDITION,TRUECASE,FALSECASE)
      IMPLICIT NONE
      LOGICAL CONDITION
      DOUBLE COMPLEX TRUECASE,FALSECASE
      IF(CONDITION) THEN
        CONDIF=TRUECASE
      ELSE
        CONDIF=FALSECASE
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION RECMS(CONDITION,EXPR)
      IMPLICIT NONE
      LOGICAL CONDITION
      DOUBLE COMPLEX EXPR
      IF(CONDITION)THEN
        RECMS=EXPR
      ELSE
        RECMS=DCMPLX(DBLE(EXPR))
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION REGLOG(ARG)
      IMPLICIT NONE
      DOUBLE COMPLEX TWOPII
      PARAMETER (TWOPII=2.0D0*3.1415926535897932D0*(0.0D0,1.0D0))
      DOUBLE COMPLEX ARG
      IF(ARG.EQ.(0.0D0,0.0D0)) THEN
        REGLOG=(0.0D0,0.0D0)
      ELSE
        REGLOG=LOG(ARG)
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION REGLOGP(ARG)
      IMPLICIT NONE
      DOUBLE COMPLEX TWOPII
      PARAMETER (TWOPII=2.0D0*3.1415926535897932D0*(0.0D0,1.0D0))
      DOUBLE COMPLEX ARG
      IF(ARG.EQ.(0.0D0,0.0D0))THEN
        REGLOGP=(0.0D0,0.0D0)
      ELSE
        IF(DBLE(ARG).LT.0.0D0.AND.DIMAG(ARG).LT.0.0D0)THEN
          REGLOGP=LOG(ARG) + TWOPII
        ELSE
          REGLOGP=LOG(ARG)
        ENDIF
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION REGLOGM(ARG)
      IMPLICIT NONE
      DOUBLE COMPLEX TWOPII
      PARAMETER (TWOPII=2.0D0*3.1415926535897932D0*(0.0D0,1.0D0))
      DOUBLE COMPLEX ARG
      IF(ARG.EQ.(0.0D0,0.0D0))THEN
        REGLOGM=(0.0D0,0.0D0)
      ELSE
        IF(DBLE(ARG).LT.0.0D0.AND.DIMAG(ARG).GT.0.0D0)THEN
          REGLOGM=LOG(ARG) - TWOPII
        ELSE
          REGLOGM=LOG(ARG)
        ENDIF
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION REGSQRT(ARG_IN)
      IMPLICIT NONE
      DOUBLE COMPLEX ARG_IN
      DOUBLE COMPLEX ARG
      ARG=ARG_IN
      IF(DABS(DIMAG(ARG)).EQ.0.0D0)THEN
        ARG=DCMPLX(DBLE(ARG),0.0D0)
      ENDIF
      IF(DABS(DBLE(ARG)).EQ.0.0D0)THEN
        ARG=DCMPLX(0.0D0,DIMAG(ARG))
      ENDIF
      REGSQRT=SQRT(ARG)
      END

      DOUBLE COMPLEX FUNCTION GRREGLOG(LOGSW,EXPR1_IN,EXPR2_IN)
      IMPLICIT NONE
      DOUBLE COMPLEX TWOPII
      PARAMETER (TWOPII=2.0D0*3.1415926535897932D0*(0.0D0,1.0D0))
      DOUBLE COMPLEX EXPR1_IN,EXPR2_IN
      DOUBLE COMPLEX EXPR1,EXPR2
      DOUBLE PRECISION LOGSW
      DOUBLE PRECISION IMAGEXPR
      LOGICAL FIRSTSHEET
      EXPR1=EXPR1_IN
      EXPR2=EXPR2_IN
      IF(DABS(DIMAG(EXPR1)).EQ.0.0D0)THEN
        EXPR1=DCMPLX(DBLE(EXPR1),0.0D0)
      ENDIF
      IF(DABS(DBLE(EXPR1)).EQ.0.0D0)THEN
        EXPR1=DCMPLX(0.0D0,DIMAG(EXPR1))
      ENDIF
      IF(DABS(DIMAG(EXPR2)).EQ.0.0D0)THEN
        EXPR2=DCMPLX(DBLE(EXPR2),0.0D0)
      ENDIF
      IF(DABS(DBLE(EXPR2)).EQ.0.0D0)THEN
        EXPR2=DCMPLX(0.0D0,DIMAG(EXPR2))
      ENDIF
      IF(EXPR1.EQ.(0.0D0,0.0D0))THEN
        GRREGLOG=(0.0D0,0.0D0)
      ELSE
        IMAGEXPR=DIMAG(EXPR1)*DIMAG(EXPR2)
        FIRSTSHEET=IMAGEXPR.GE.0.0D0
        FIRSTSHEET=FIRSTSHEET.OR.DBLE(EXPR1).GE.0.0D0
        FIRSTSHEET=FIRSTSHEET.OR.DBLE(EXPR2).GE.0.0D0
        IF(FIRSTSHEET)THEN
          GRREGLOG=LOG(EXPR1)
        ELSE
          IF(DIMAG(EXPR1).GT.0.0D0)THEN
            GRREGLOG=LOG(EXPR1) - LOGSW*TWOPII
          ELSE
            GRREGLOG=LOG(EXPR1) + LOGSW*TWOPII
          ENDIF
        ENDIF
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION ARG(COMNUM)
      IMPLICIT NONE
      DOUBLE COMPLEX COMNUM
      DOUBLE COMPLEX IIM
      IIM = (0.0D0,1.0D0)
      IF(COMNUM.EQ.(0.0D0,0.0D0)) THEN
        ARG=(0.0D0,0.0D0)
      ELSE
        ARG=LOG(COMNUM/ABS(COMNUM))/IIM
      ENDIF
      END

      DOUBLE COMPLEX FUNCTION COT(Z)
      IMPLICIT NONE
      DOUBLE COMPLEX Z

      COT = 1.000000D+00/TAN(DBLE(DBLE(Z)))

      RETURN
      END

