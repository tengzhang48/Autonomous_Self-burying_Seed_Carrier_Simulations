# Autonomous_Self-burying_Seed_Carrier_Simulations
The files are to reproduce simulations in the paper "Autonomous Self-burying Seed Carriers for Aerial Seeding" by Luo et al. The simulations are carried out with ABAQUS, whose files are in the folder **ABAQUS**. A few MATLAB codes, in the folder **MATLAB**, are also included to generate material properties used in the ABAQUS simulations.

**ABAQUS**  
The files are arranged following the order of the figures presented in the paper.  
1. Drilling simulations (Fig. 3b-c)  
   - “wood-l44w24-f20-r04-d01-vm33-1tail-s2s-drilling-fri2008-c4-tie-corner-0810-2022.inp” for single-tailed design seed carrier with anchor.  
   - “wood-l44w24-f20-r04-d01-vm33-1tail-s2s-drilling-fri2008-c4-tie-0808-2022.inp” for single-tailed design seed carrier without anchor.  
   - “wood-l44w24-f20-r04-d01-vm33-3tail-s2s-drilling-fri2008-c4-tie-corner-0804-2022.inp” for three-tailed design seed carrier with anchor.  
   - “wood-l44w24-f20-r04-d01-vm33-3tail-s2s-drilling-fri2008-c4-tie-0807-2022.inp” for three-tailed design seed carrier without anchor.  
2. Extension force simulations (Fig. 3f and Supplementary Figure 22)  
   -	“wood-l22w24-vm33-f20-g135-Psi7050-exp180-rot-fi045-force-0801-2022.inp” for 3.5 coils.  
   -	“wood-l44w24-vm33-f20-g135-Psi7050-exp180-rot-fi045-force-0801-2022.inp” for 7 coils.  
   -	“wood-l64w24-vm33-f20-g135-Psi7050-exp180-rot-fi045-force-0801-2022.inp” for 10.5 coils.  
3. Drilling simulations on a surface that is hard and smooth (Extended Data Figure 9)  
   -	“wood-l44w24-f20-r04-d01-vm33-1tail-ge-drilling-fri045-tie-0812-2022.inp” for single-tailed design seed carrier.  
   -	“wood-l44w24-f20-r04-d01-vm33-3tail-ge-drilling-fri045-tie-t12-0812-2022.inp” for three-tailed design seed carrier.  
4. Simulation of the coil pitch and diameter during hydration (Supplementary Figure 20)  
   -	“wood-l48w24-f20-g135-Psi7050-exp180-rot-0729-2022.inp” for coil pitch and diameter simulation.  

**MATLAB**  
1. “wood_modulus_coe_abaqus_0726_2022.m” generates a temperature dependent anisotropic modulus to capture the softening effect of the wood during hydration. Here temperature is an intermediate variable related to hydration.   
2. “wood_contraction_coe_abaqus_0820_2022.m” generates temperature dependent anisotropic contraction ratios to capture the gradient contraction of the molded wood during de-hydration. Here temperature is an intermediate variable related to hydration.  
