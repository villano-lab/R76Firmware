* We are able to see some correlation between the alleged rate and the filesize output by MIDAS -- see `library/C/lib/rates.txt`.<br>
* We have verified that MIDAS' `triggerfe2_mod.exe` and `towerfe3.exe` appear to have correlating triggers. They do not print at the same time, and `towerfe3.exe` prints many instances of "Hi, I got 4 triggers on the readbuffer."<br>
However, after it has done this, the values in "Hi, I got x triggers on the readbuffer" appear to match the values in `triggerfe2_mod.exe`'s "Got x triggers in buffer at time ... for tower 1". We checked these by running them in the command line without the `-D` option.<br>
* `towerfe3.exe` and `towerfe3_NaI.exe` produce very different file sizes (~6 MB vs ~1.5 MB) -- is it possible that the calls being made to the NaI array regarding the custom packet are too slow and result in data loss?<br>
<br>
# triggerfe2_mod.exe output<br>
<br>
Got 128 triggers in buffer at time 1704740740 for tower 1  <br>
Got 87 triggers in buffer at time 1704740742 for tower 1  <br>
Got 77 triggers in buffer at time 1704740744 for tower 1  <br>
Got 79 triggers in buffer at time 1704740745 for tower 1  <br>
Got 79 triggers in buffer at time 1704740746 for tower 1  <br>
Got 81 triggers in buffer at time 1704740748 for tower 1  <br>
Got 76 triggers in buffer at time 1704740749 for tower 1  <br>
Got 66 triggers in buffer at time 1704740750 for tower 1  <br>
Got 75 triggers in buffer at time 1704740752 for tower 1  <br>
Got 70 triggers in buffer at time 1704740753 for tower 1  <br>
Got 61 triggers in buffer at time 1704740754 for tower 1  <br>
Got 64 triggers in buffer at time 1704740755 for tower 1  <br>
Got 50 triggers in buffer at time 1704740756 for tower 1  <br>
Got 52 triggers in buffer at time 1704740757 for tower 1  <br>
Got 46 triggers in buffer at time 1704740758 for tower 1  <br>
Got 59 triggers in buffer at time 1704740759 for tower 1  <br>
Got 55 triggers in buffer at time 1704740760 for tower 1  <br>
Got 57 triggers in buffer at time 1704740761 for tower 1  <br>
Got 59 triggers in buffer at time 1704740762 for tower 1  <br>
Got 57 triggers in buffer at time 1704740763 for tower 1  <br>
Got 47 triggers in buffer at time 1704740765 for tower 1  <br>
Got 37 triggers in buffer at time 1704740765 for tower 1  <br>
Got 40 triggers in buffer at time 1704740766 for tower 1  <br>
Got 44 triggers in buffer at time 1704740767 for tower 1  <br>
Got 52 triggers in buffer at time 1704740768 for tower 1  <br>
Got 49 triggers in buffer at time 1704740769 for tower 1  <br>
Got 49 triggers in buffer at time 1704740769 for tower 1  <br>
Got 57 triggers in buffer at time 1704740770 for tower 1  <br>
Got 57 triggers in buffer at time 1704740771 for tower 1  <br>
Got 54 triggers in buffer at time 1704740772 for tower 1  <br>
Got 60 triggers in buffer at time 1704740773 for tower 1  <br>
Got 55 triggers in buffer at time 1704740775 for tower 1  <br>
Got 42 triggers in buffer at time 1704740775 for tower 1  <br>
Got 44 triggers in buffer at time 1704740776 for tower 1  <br>
Got 50 triggers in buffer at time 1704740777 for tower 1  <br>
Got 42 triggers in buffer at time 1704740778 for tower 1  <br>
Got 44 triggers in buffer at time 1704740779 for tower 1  <br>
Got 40 triggers in buffer at time 1704740780 for tower 1  <br>
Got 41 triggers in buffer at time 1704740781 for tower 1  <br>
Got 47 triggers in buffer at time 1704740781 for tower 1  <br>
Got 42 triggers in buffer at time 1704740782 for tower 1  <br>
Got 46 triggers in buffer at time 1704740783 for tower 1  <br>
Got 50 triggers in buffer at time 1704740784 for tower 1  <br>
Got 52 triggers in buffer at time 1704740785 for tower 1  <br>
Got 49 triggers in buffer at time 1704740786 for tower 1  <br>
Got 49 triggers in buffer at time 1704740787 for tower 1  <br>
Got 47 triggers in buffer at time 1704740788 for tower 1  <br>
Got 48 triggers in buffer at time 1704740788 for tower 1  <br>
Got 42 triggers in buffer at time 1704740789 for tower 1  <br>
Got 41 triggers in buffer at time 1704740790 for tower 1  <br>
Got 42 triggers in buffer at time 1704740791 for tower 1  <br>
Got 39 triggers in buffer at time 1704740792 for tower 1  <br>
Got 36 triggers in buffer at time 1704740792 for tower 1  <br>
Got 32 triggers in buffer at time 1704740793 for tower 1  <br>
Got 26 triggers in buffer at time 1704740794 for tower 1  <br>
Got 34 triggers in buffer at time 1704740794 for tower 1  <br>
Got 42 triggers in buffer at time 1704740795 for tower 1  <br>
Got 25 triggers in buffer at time 1704740796 for tower 1  <br>
Got 27 triggers in buffer at time 1704740796 for tower 1  <br>
Got 27 triggers in buffer at time 1704740797 for tower 1  <br>
Got 30 triggers in buffer at time 1704740797 for tower 1  <br>
Got 35 triggers in buffer at time 1704740798 for tower 1  <br>
Got 40 triggers in buffer at time 1704740799 for tower 1  <br>
Got 38 triggers in buffer at time 1704740799 for tower 1 <br>
Got 35 triggers in buffer at time 1704740800 for tower 1 <br>
Got 33 triggers in buffer at time 1704740801 for tower 1 <br>
Got 37 triggers in buffer at time 1704740801 for tower 1 <br>
Got 37 triggers in buffer at time 1704740802 for tower 1 <br>
Got 28 triggers in buffer at time 1704740803 for tower 1 <br>
Got 32 triggers in buffer at time 1704740803 for tower 1 <br>
Got 33 triggers in buffer at time 1704740804 for tower 1 <br>
Got 47 triggers in buffer at time 1704740805 for tower 1 <br>
Got 40 triggers in buffer at time 1704740806 for tower 1 <br>
Got 24 triggers in buffer at time 1704740806 for tower 1 <br>
Got 34 triggers in buffer at time 1704740807 for tower 1 <br>
Got 35 triggers in buffer at time 1704740808 for tower 1 <br>
Got 31 triggers in buffer at time 1704740808 for tower 1 <br>
Got 29 triggers in buffer at time 1704740809 for tower 1 <br>
Got 30 triggers in buffer at time 1704740809 for tower 1 <br>
Got 33 triggers in buffer at time 1704740810 for tower 1 <br>
Got 33 triggers in buffer at time 1704740811 for tower 1 <br>
Got 27 triggers in buffer at time 1704740811 for tower 1 <br>
Got 39 triggers in buffer at time 1704740812 for tower 1 <br>
Got 34 triggers in buffer at time 1704740813 for tower 1 <br>
Got 32 triggers in buffer at time 1704740813 for tower 1 <br>
Got 33 triggers in buffer at time 1704740814 for tower 1 <br>
Got 42 triggers in buffer at time 1704740815 for tower 1 <br>
Got 46 triggers in buffer at time 1704740815 for tower 1 <br>
Got 39 triggers in buffer at time 1704740816 for tower 1 <br>
Got 55 triggers in buffer at time 1704740817 for tower 1 <br>
Got 58 triggers in buffer at time 1704740818 for tower 1 <br>
Got 60 triggers in buffer at time 1704740819 for tower 1 <br>
Got 58 triggers in buffer at time 1704740820 for tower 1 <br>
Got 52 triggers in buffer at time 1704740821 for tower 1 <br>
Got 44 triggers in buffer at time 1704740822 for tower 1 <br>
Got 44 triggers in buffer at time 1704740823 for tower 1 <br>
Got 43 triggers in buffer at time 1704740824 for tower 1 <br>
Got 51 triggers in buffer at time 1704740825 for tower 1 <br>
Got 36 triggers in buffer at time 1704740826 for tower 1 <br>
Got 28 triggers in buffer at time 1704740826 for tower 1 <br>
Got 46 triggers in buffer at time 1704740827 for tower 1 <br>
Got 41 triggers in buffer at time 1704740828 for tower 1 <br>
Got 39 triggers in buffer at time 1704740829 for tower 1 <br>
Got 34 triggers in buffer at time 1704740830 for tower 1 <br>
Got 33 triggers in buffer at time 1704740830 for tower 1 <br>
Got 28 triggers in buffer at time 1704740831 for tower 1 <br>
Got 37 triggers in buffer at time 1704740832 for tower 1 <br>
Got 38 triggers in buffer at time 1704740832 for tower 1 <br>
Got 28 triggers in buffer at time 1704740833 for tower 1 <br>
Got 30 triggers in buffer at time 1704740834 for tower 1 <br>
Got 39 triggers in buffer at time 1704740834 for tower 1 <br>
Got 42 triggers in buffer at time 1704740835 for tower 1 <br>
Got 52 triggers in buffer at time 1704740836 for tower 1 <br>
Got 53 triggers in buffer at time 1704740837 for tower 1 <br>
Got 51 triggers in buffer at time 1704740838 for tower 1 <br>
Got 52 triggers in buffer at time 1704740839 for tower 1 <br>
Got 57 triggers in buffer at time 1704740840 for tower 1 <br>
Got 46 triggers in buffer at time 1704740841 for tower 1 <br>
Got 47 triggers in buffer at time 1704740841 for tower 1 <br>
Got 57 triggers in buffer at time 1704740842 for tower 1 <br>
Got 65 triggers in buffer at time 1704740843 for tower 1 <br>
Got 51 triggers in buffer at time 1704740844 for tower 1 <br>
Got 46 triggers in buffer at time 1704740845 for tower 1 <br>
Got 37 triggers in buffer at time 1704740846 for tower 1 <br>
Got 41 triggers in buffer at time 1704740847 for tower 1 <br>
Got 44 triggers in buffer at time 1704740848 for tower 1 <br>
Got 54 triggers in buffer at time 1704740849 for tower 1 <br>
Got 50 triggers in buffer at time 1704740850 for tower 1 <br>
Got 42 triggers in buffer at time 1704740850 for tower 1 <br>
Got 29 triggers in buffer at time 1704740851 for tower 1 <br>
Got 30 triggers in buffer at time 1704740852 for tower 1 <br>
Got 32 triggers in buffer at time 1704740852 for tower 1 <br>
Got 31 triggers in buffer at time 1704740853 for tower 1 <br>
Got 32 triggers in buffer at time 1704740854 for tower 1 <br>
Got 28 triggers in buffer at time 1704740854 for tower 1 <br>
Got 33 triggers in buffer at time 1704740855 for tower 1 <br>
Got 38 triggers in buffer at time 1704740856 for tower 1 <br>
Got 42 triggers in buffer at time 1704740856 for tower 1 <br>
Got 43 triggers in buffer at time 1704740857 for tower 1 <br>
Got 33 triggers in buffer at time 1704740858 for tower 1 <br>
Got 42 triggers in buffer at time 1704740859 for tower 1 <br>
Got 37 triggers in buffer at time 1704740859 for tower 1 <br>
Got 38 triggers in buffer at time 1704740860 for tower 1 <br>
Got 43 triggers in buffer at time 1704740861 for tower 1 <br>
Got 48 triggers in buffer at time 1704740862 for tower 1 <br>
Got 37 triggers in buffer at time 1704740863 for tower 1 <br>
Got 35 triggers in buffer at time 1704740863 for tower 1 <br>
Got 30 triggers in buffer at time 1704740864 for tower 1 <br>
Got 36 triggers in buffer at time 1704740864 for tower 1 <br>
Got 38 triggers in buffer at time 1704740865 for tower 1 <br>
Got 37 triggers in buffer at time 1704740866 for tower 1 <br>
Got 43 triggers in buffer at time 1704740867 for tower 1 <br>
Got 38 triggers in buffer at time 1704740867 for tower 1 <br>
Got 33 triggers in buffer at time 1704740868 for tower 1 <br>
Got 37 triggers in buffer at time 1704740869 for tower 1 <br>
 <br>
# towerfe3.exe output<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 4 triggers on the readbuffer<br>
Hi, I got 128 triggers on the readbuffer<br>
Hi, I got 87 triggers on the readbuffer<br>
Hi, I got 77 triggers on the readbuffer<br>
Hi, I got 79 triggers on the readbuffer<br>
Hi, I got 79 triggers on the readbuffer<br>
Hi, I got 81 triggers on the readbuffer<br>
Hi, I got 76 triggers on the readbuffer<br>
Hi, I got 66 triggers on the readbuffer<br>
Hi, I got 75 triggers on the readbuffer<br>
Hi, I got 70 triggers on the readbuffer<br>
Hi, I got 61 triggers on the readbuffer<br>
Hi, I got 64 triggers on the readbuffer<br>
Hi, I got 50 triggers on the readbuffer<br>
Hi, I got 52 triggers on the readbuffer<br>
Hi, I got 46 triggers on the readbuffer<br>
Hi, I got 59 triggers on the readbuffer<br>
Hi, I got 55 triggers on the readbuffer<br>
Hi, I got 56 triggers on the readbuffer<br>
Hi, I got 59 triggers on the readbuffer<br>
Hi, I got 57 triggers on the readbuffer<br>
Hi, I got 47 triggers on the readbuffer<br>
Hi, I got 37 triggers on the readbuffer<br>
Hi, I got 40 triggers on the readbuffer<br>
Hi, I got 44 triggers on the readbuffer<br>
Hi, I got 52 triggers on the readbuffer<br>
Hi, I got 49 triggers on the readbuffer<br>
Hi, I got 49 triggers on the readbuffer<br>
Hi, I got 57 triggers on the readbuffer<br>
Hi, I got 57 triggers on the readbuffer<br>
Hi, I got 54 triggers on the readbuffer<br>
Hi, I got 60 triggers on the readbuffer<br>
Hi, I got 55 triggers on the readbuffer<br>
Hi, I got 42 triggers on the readbuffer<br>
Hi, I got 44 triggers on the readbuffer<br>
Hi, I got 50 triggers on the readbuffer<br>
Hi, I got 42 triggers on the readbuffer<br>
Hi, I got 44 triggers on the readbuffer<br>
Hi, I got 40 triggers on the readbuffer<br>
Hi, I got 41 triggers on the readbuffer<br>
Hi, I got 47 triggers on the readbuffer<br>
Hi, I got 42 triggers on the readbuffer<br>
Hi, I got 46 triggers on the readbuffer<br>
Hi, I got 50 triggers on the readbuffer<br>
Hi, I got 52 triggers on the readbuffer<br>
Hi, I got 49 triggers on the readbuffer<br>
Hi, I got 49 triggers on the readbuffer<br>
Hi, I got 47 triggers on the readbuffer<br>
Hi, I got 48 triggers on the readbuffer<br>
Hi, I got 42 triggers on the readbuffer<br>
Hi, I got 41 triggers on the readbuffer<br>
Hi, I got 42 triggers on the readbuffer<br>
Hi, I got 38 triggers on the readbuffer<br>
Hi, I got 36 triggers on the readbuffer<br>
Hi, I got 32 triggers on the readbuffer<br>
Hi, I got 26 triggers on the readbuffer<br>
Hi, I got 34 triggers on the readbuffer<br>
Hi, I got 42 triggers on the readbuffer<br>
Hi, I got 25 triggers on the readbuffer<br>
Hi, I got 27 triggers on the readbuffer<br>
Hi, I got 27 triggers on the readbuffer<br>
Hi, I got 30 triggers on the readbuffer<br>
Hi, I got 35 triggers on the readbuffer<br>
Hi, I got 40 triggers on the readbuffer<br>