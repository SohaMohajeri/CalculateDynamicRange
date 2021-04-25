# CalculateDynamicRange
MATLAB function to calculate Dynamic Range of 10-bit 4:2:0 YUV video sequences


The provided MATLAB script calculates the Dynamic Range of 10-bit 4:2:0 YUV video sequences. It can be easily modified to calculate the same for higher or lower bit-depth sequences and/or other color sub-sampling.

Function call: 
              CalculateDynamicRange(sequence_name, R, C)
              where sequence_name is the name of your video sequence, R is your video height and C is the video width.
              
Example usage: For calculating DR of a video sequence named "Video1.yuv" of 3840x2160 resolution, the function needs to be called as:

              CalculateDynamicRange('Video1.yuv', 2160, 3840)
              
              Output: MAT file with the following name: sequence_name.yuv.mat
                      The Dynamic Range value is stored in 'DR' variable.
        
## Citation

If you find this file useful and use it your work, please provide a link to this Github page in your publication.

## Related Literature Work
 You might be also interested in our work on 4K, HDR Gaming content here: https://github.com/NabajeetBarman/GamingHDRVideoSET

## Contact
Nabajeet Barman, Kingston University, London, UK (n.barman@kingston.ac.uk, n.barman@ieee.org)
