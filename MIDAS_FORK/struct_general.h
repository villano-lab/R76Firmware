typedef struct {
  BOOL      usecalibrationregisters;
  INT       chargewaveformlength;
  INT       phononwaveformlength;
  INT       masterslavefree;
  char      masterslavefreecomment[50];
  BOOL      lvdsbusdir;
  BOOL      byteswapenable;
  BOOL      chargeadcreset;
  INT       vxofreqlockref;
  BOOL      enableadcwritestosdram;
  BOOL      enableadcavgby64;
  BOOL      enablewritingddsphasedata;
  BOOL      triggersource;
  char      triggersourcecomment[50];
  BOOL      fetheatenable;
  BOOL      qetbiasrangeselect;
  INT       chargeprepulsesamples;
  INT       phononprepulsesamples;
} GENERAL;

