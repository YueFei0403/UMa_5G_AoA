This work studies and compares the performance of minimum mean square error (MMSE) and Matrix-Pencil Method (MPM) for uplink channel estimation in multicell multiple-input multiple-output orthogonal frequency division multiplexing (MIMO-OFDM) wideband systems with local base station cooperations.

The study's significance is twofold. Firstly, it constructs a system model for a realistic multi-path propagation wireless network using designated MATLAB toolbox, conforming to the industrial standard set by the Third Generation Partnership Project (3GPP) Technical Specification. Secondly, three state-of-the-art angle of arrival estimation methods are applied, namely, Matrix-Pencil-Method (MPM), discrete Fourier transform-based (DFT) method, and the minimum mean squared error (MMSE) method. We propose that with multiple antennas employed at the receiver end, Matrix-Pencil Method outperforms the traditional techniques with single data snapshot.

To produce the experimental results shown in the report (on ComputeCanada), 
```bash
module load matlab
matlab -nodisplay -r "UMa_UL_MultiDU_SingleUser_NumPilots_parallel.m"
```