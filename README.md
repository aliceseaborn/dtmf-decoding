# DTMF Decoding

The challenge of this project, was to implement a Dual Tone Multiple Frequency (DTMF) Digit Detection model to decode digits from several audio recordings. Each recording is more degraded than the last, with added background noise. However, the background noise does not affect the frequencies used by DTMF. Consequently, analysis of the frequency domains of the audio recordings will show the DTMF signals apart from the noise. Previous approaches manually segmented the input signals, therefore effectively eliminating the noise and timing challenges imposed by the problem statement. This solution, on the other hand, employs a moving window DTMF detection system which replies upon an ecosystem of functions to quickly identify DTMF signals and decode their data.

This project was completed as a requirement for ECE 460, Digital Signal Processing, for the completion of an Electrical & Computer Engineering degree.


*alice seaborn.*
