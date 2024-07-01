typedef struct {
  INT       ledpulsewidth__us_;
  INT       ledreprate__us_;
  INT       ledadccontrol;
  float     led1current__ma_;
  BOOL      enableled1;
  BOOL      enableled2;
  BOOL      connectledvoltagestophononadcs;
  BOOL      singlestepfreeruntoggle;
  BOOL      enablezapcharging;
  BOOL      enable15vpower;
  float     led2current__ma_;
} LED;

