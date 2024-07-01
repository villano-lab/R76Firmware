typedef struct {
  float     vgagain__multiplicative_factor_[4];
  float     adcoffset__v_[4];
  float     lockpointadjust__mv_[4];
  float     squidbias__ua_[4];
  float     qetbias__ua_[4];
  INT       polarity[4];
  char      polaritycomment[50];
  INT       pgagain__1_2_4__or_8_[4];
  BOOL      adcsignalsource[4];
  char      adcsignalsourcecomment[50];
  BOOL      testsignalconnect[4];
  BOOL      squidsource[4];
  char      squidsourcecomment[50];
  INT       daccontrolphononab;
  INT       daccontrolphononcd;
} PHONON;

