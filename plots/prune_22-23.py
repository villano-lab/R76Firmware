import pandas as pd

def rowtoskip(x):
    if x+1 % 34 in [22,23]: #trigger data + timestamp + 32 channels
        return False
    else:
        return True
    
data = pd.read_csv("data/test_custom_packet_l300keV_Na_extra_longrun.csv",usecols=["word label","value"],skiprows=rowtoskip)
data.to_csv("data/test_custom_packet_l300keV_Na_extra_longrun_22-23.csv",header=None, index=None, sep=', ', mode='w')