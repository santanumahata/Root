ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      written by the UFO converter
ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

      SUBROUTINE COUP1()

      IMPLICIT NONE
      INCLUDE 'model_functions.inc'

      DOUBLE PRECISION PI, ZERO
      PARAMETER  (PI=3.141592653589793D0)
      PARAMETER  (ZERO=0D0)
      INCLUDE 'input.inc'
      INCLUDE 'coupl.inc'
      GC_24 = -(MDL_EE*MDL_COMPLEXI)
      GC_58 = (MDL_EE*MDL_COMPLEXI*MDL_SW)/MDL_CW
      GC_61 = -(MDL_CW*MDL_EE*MDL_COMPLEXI)/(2.000000D+00*MDL_SW)
     $ +(MDL_EE*MDL_COMPLEXI*MDL_SW)/(2.000000D+00*MDL_CW)
      GC_84 = (4.000000D+00*MDL_COMPLEXI*MDL_KAA)/MDL_VEV
      GC_85 = (-2.000000D+00*MDL_COMPLEXI*MDL_KAAT)/MDL_VEV
      GC_88 = (2.000000D+00*MDL_COMPLEXI*MDL_KZA)/MDL_VEV
      GC_89 = (2.000000D+00*MDL_COMPLEXI*MDL_KZAT)/MDL_VEV
      END