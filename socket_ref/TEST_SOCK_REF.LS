/PROG  TEST_SOCK_REF
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 933;
CREATE		= DATE 25-01-31  TIME 13:46:52;
MODIFIED	= DATE 25-01-31  TIME 13:54:14;
FILE_NAME	= TEST_SIN;
VERSION		= 0;
LINE_COUNT	= 20;
MEMORY_SIZE	= 1233;
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
/APPL
/MN
   1:  !CONFIG CLIENT TAG 6 ;
   2:  F[2]=(OFF) ;
   3:  F[3]=(OFF) ;
   4:  F[4]=(OFF) ;
   5:  RUN SOCK_REF_CLIENT ;
   6:  WAIT (F[2]=ON)    ;
   7:J PR[6] 100% FINE    ;
   8:J P[1] 100% FINE    ;
   9:  F[3]=(ON) ;
  10:  WAIT (F[3]=OFF)    ;
  11:J P[2] 100% FINE    ;
  12:  F[3]=(ON) ;
  13:  WAIT (F[3]=OFF)    ;
  14:J P[3] 100% FINE    ;
  15:  F[3]=(ON) ;
  16:  WAIT (F[3]=OFF)    ;
  17:  WAIT (F[4]=ON)    ;
  18:  F[2]=(OFF) ;
  19:  F[3]=(OFF) ;
  20:  F[4]=(OFF) ;
/POS
P[1]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   712.956  mm,	Y =     0.000  mm,	Z =   703.315  mm,
	W =     0.000 deg,	P =   -88.036 deg,	R =  -180.000 deg
};
P[2]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   794.868  mm,	Y =  -622.273  mm,	Z =   779.892  mm,
	W =     0.000 deg,	P =   -88.036 deg,	R =   180.000 deg
};
P[3]{
   GP1:
	UF : 8, UT : 1,		CONFIG : 'N D B, 0, 0, 0',
	X =   745.713  mm,	Y =  -326.209  mm,	Z =   354.014  mm,
	W =     0.000 deg,	P =   -88.036 deg,	R =   179.999 deg
};
/END
