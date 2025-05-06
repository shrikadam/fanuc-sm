/PROG  TEST_SIN_DPM
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 696;
CREATE		= DATE 25-01-13  TIME 14:16:06;
MODIFIED	= DATE 25-01-31  TIME 11:48:14;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 11;
MEMORY_SIZE	= 1032;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
LOCAL_REGISTERS	= 0,0,0;
/MN
   1:  !DEFINE WEAVE FREQ = 0.001 ;
   2:  !AMPL = 50 IN REG [21] ;
   3:  !AND REG [22] RESP ;
   4:  F[5]=(OFF) ;
   5:  RUN SIN_DPM ;
   6:J P[1] 100% FINE    ;
   7:  F[5]=(ON) ;
   8:  Track DPM[1] ;
   9:L P[2] 50mm/sec FINE    ;
  10:  Track End ;
  11:  F[5]=(OFF) ;
/POS
P[1]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   478.483  mm,	Y =  -205.959  mm,	Z =   456.882  mm,
	W =  -136.443 deg,	P =   -87.019 deg,	R =   -41.540 deg
};
P[2]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   478.483  mm,	Y =   299.001  mm,	Z =   456.882  mm,
	W =  -136.443 deg,	P =   -87.019 deg,	R =   -41.540 deg
};
/END
