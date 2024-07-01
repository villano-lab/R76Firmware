# MIDAS Instructions

Get data to write to files: http://localhost:8082/Logger, "Write data" n --> y  
Force stop the current run if the ODB web interface gets stuck: `odbedit` to launch the editor, then `stop`.  
DAQ will always run with the environment as it was when the start script was run -- changes made after starting the script will not affect any commands run via the ODB.
For testing you can edit [/Equipment/Triggerfe2/Settings](http://localhost:8082/Equipment/Triggerfe2/Settings) and change the number of start-of-run randoms. This was previously set at 1000.
