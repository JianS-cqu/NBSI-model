####code 2

#### code designed to calculate the probability of building damages
#### PGA needs to be converted to spectral displacement (variable "s") according to Materials and Methods 5.

#### inputs
#### uses PGAs in a tiff format (Fig. S13 in Supplementary materials)
#### Corresponding coefficient codes have been given, and are also provided in Table S9

#### outputs
#### the outputs include:
#### a series of tiff files of damage probabilities.

#### function:
#### "dm_state_structure_design", for example "dm_slight_bw_H",
#### means the exposure rate under the slight damage state living in brick-wood buildings with high-code design.
#### "xf_dm_structure_design", for example "xf_dm_bw_H",
#### means the total damage probability of brick-wood buildings with High-code design.



#### packages

{
  require(tidyverse)
  require(terra)
}
dm_slight_bw_H <- function(s){
  x1 <- (log(s/0.55))/0.8
  x2 <- (log(s/1.51))/0.81
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bw_H <- function(s){
  x2 <- (log(s/1.51))/0.81
  x3 <- (log(s/5.04))/0.85
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bw_H <- function(s){
  x3 <- (log(s/5.04))/0.85
  x4 <- (log(s/12.6))/0.97
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bw_H <- function(s){
  x4 <- (log(s/12.6))/0.97
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bw_H <- function(s){
  x1 <- (log(s/0.55))/0.8
  x2 <- (log(s/1.51))/0.81
  x3 <- (log(s/5.04))/0.85
  x4 <- (log(s/12.6))/0.97
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bw_M <- function(s){
  x1 <- (log(s/0.5))/0.84
  x2 <- (log(s/1.25))/0.86
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bw_M <- function(s){
  x2 <- (log(s/1.25))/0.86
  x3 <- (log(s/3.86))/0.89
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bw_M <- function(s){
  x3 <- (log(s/3.86))/0.89
  x4 <- (log(s/9.45))/1.04
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bw_M <- function(s){
  x4 <- (log(s/9.45))/1.04
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bw_M <- function(s){
  x1 <- (log(s/0.5))/0.84
  x2 <- (log(s/1.25))/0.86
  x3 <- (log(s/3.86))/0.89
  x4 <- (log(s/9.45))/1.04
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bw_L <- function(s){
  x1 <- (log(s/0.45))/0.93
  x2 <- (log(s/1.25))/0.97
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bw_L <- function(s){
  x2 <- (log(s/1.25))/0.97
  x3 <- (log(s/3.86))/1.03
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bw_L <- function(s){
  x3 <- (log(s/3.86))/1.03
  x4 <- (log(s/9.45))/0.99
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bw_L <- function(s){
  x4 <- (log(s/9.45))/0.99
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bw_L <- function(s){
  x1 <- (log(s/0.45))/0.93
  x2 <- (log(s/1.25))/0.97
  x3 <- (log(s/3.86))/1.03
  x4 <- (log(s/9.45))/0.99
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bw_P <- function(s){
  x1 <- (log(s/0.4))/1.01
  x2 <- (log(s/1))/1.05
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bw_P <- function(s){
  x2 <- (log(s/1))/1.05
  x3 <- (log(s/3.09))/1.07
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bw_P <- function(s){
  x3 <- (log(s/3.09))/1.07
  x4 <- (log(s/7.56))/1.05
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bw_P <- function(s){
  x4 <- (log(s/7.56))/1.05
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bw_P <- function(s){
  x1 <- (log(s/0.4))/1.01
  x2 <- (log(s/1))/1.05
  x3 <- (log(s/3.09))/1.07
  x4 <- (log(s/7.56))/1.05
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_a_H <- function(s){
  x1 <- (log(s/0.45))/0.925
  x2 <- (log(s/0.89))/0.98
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_a_H <- function(s){
  x2 <- (log(s/0.89))/0.98
  x3 <- (log(s/2.235))/1.035
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_a_H <- function(s){
  x3 <- (log(s/2.235))/1.035
  x4 <- (log(s/5.205))/1.03
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_a_H <- function(s){
  x4 <- (log(s/5.205))/1.03
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_a_H <- function(s){
  x1 <- (log(s/0.45))/0.925
  x2 <- (log(s/0.89))/0.98
  x3 <- (log(s/2.235))/1.035
  x4 <- (log(s/5.205))/1.03
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_a_M <- function(s){
  x1 <- (log(s/0.41))/1
  x2 <- (log(s/0.81))/1.05
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_a_M <- function(s){
  x2 <- (log(s/0.81))/1.05
  x3 <- (log(s/2.03))/1.09
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_a_M <- function(s){
  x3 <- (log(s/2.03))/1.09
  x4 <- (log(s/4.73))/1.08
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_a_M <- function(s){
  x4 <- (log(s/4.73))/1.08
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_a_M <- function(s){
  x1 <- (log(s/0.41))/1
  x2 <- (log(s/0.81))/1.05
  x3 <- (log(s/2.03))/1.09
  x4 <- (log(s/4.73))/1.08
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_a_L <- function(s){
  x1 <- (log(s/0.37))/1.075
  x2 <- (log(s/0.73))/1.12
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_a_L <- function(s){
  x2 <- (log(s/0.73))/1.12
  x3 <- (log(s/1.825))/1.145
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_a_L <- function(s){
  x3 <- (log(s/1.825))/1.145
  x4 <- (log(s/4.255))/1.13
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_a_L <- function(s){
  x4 <- (log(s/4.255))/1.13
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_a_L <- function(s){
  x1 <- (log(s/0.37))/1.075
  x2 <- (log(s/0.73))/1.12
  x3 <- (log(s/1.825))/1.145
  x4 <- (log(s/4.255))/1.13
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_a_P <- function(s){
  x1 <- (log(s/0.32))/1.15
  x2 <- (log(s/0.65))/1.19
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_a_P <- function(s){
  x2 <- (log(s/0.65))/1.19
  x3 <- (log(s/1.62))/1.2
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_a_P <- function(s){
  x3 <- (log(s/1.62))/1.2
  x4 <- (log(s/3.78))/1.18
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_a_P <- function(s){
  x4 <- (log(s/3.78))/1.18
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_a_P <- function(s){
  x1 <- (log(s/0.32))/1.15
  x2 <- (log(s/0.65))/1.19
  x3 <- (log(s/1.62))/1.2
  x4 <- (log(s/3.78))/1.18
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_b_H <- function(s){
  x1 <- (log(s/0.7))/0.865
  x2 <- (log(s/1.385))/0.895
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_b_H <- function(s){
  x2 <- (log(s/1.385))/0.895
  x3 <- (log(s/3.465))/0.855
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_b_H <- function(s){
  x3 <- (log(s/3.465))/0.855
  x4 <- (log(s/8.085))/0.925
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_b_H <- function(s){
  x4 <- (log(s/8.085))/0.925
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_b_H <- function(s){
  x1 <- (log(s/0.7))/0.865
  x2 <- (log(s/1.385))/0.895
  x3 <- (log(s/3.465))/0.855
  x4 <- (log(s/8.085))/0.925
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_b_M <- function(s){
  x1 <- (log(s/0.63))/0.91
  x2 <- (log(s/1.26))/0.92
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_b_M <- function(s){
  x2 <- (log(s/1.26))/0.92
  x3 <- (log(s/3.15))/0.87
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_b_M <- function(s){
  x3 <- (log(s/3.15))/0.87
  x4 <- (log(s/7.35))/0.91
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_b_M <- function(s){
  x4 <- (log(s/7.35))/0.91
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_b_M <- function(s){
  x1 <- (log(s/0.63))/0.91
  x2 <- (log(s/1.26))/0.92
  x3 <- (log(s/3.15))/0.87
  x4 <- (log(s/7.35))/0.91
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_b_L <- function(s){
  x1 <- (log(s/0.56))/0.955
  x2 <- (log(s/1.135))/0.945
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_b_L <- function(s){
  x2 <- (log(s/1.135))/0.945
  x3 <- (log(s/2.835))/0.885
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_b_L <- function(s){
  x3 <- (log(s/2.835))/0.885
  x4 <- (log(s/6.615))/0.895
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_b_L <- function(s){
  x4 <- (log(s/6.615))/0.895
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_b_L <- function(s){
  x1 <- (log(s/0.56))/0.955
  x2 <- (log(s/1.135))/0.945
  x3 <- (log(s/2.835))/0.885
  x4 <- (log(s/6.615))/0.895
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_bc_b_P <- function(s){
  x1 <- (log(s/0.5))/1
  x2 <- (log(s/1.01))/0.97
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_bc_b_P <- function(s){
  x2 <- (log(s/1.01))/0.97
  x3 <- (log(s/2.52))/0.9
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_bc_b_P <- function(s){
  x3 <- (log(s/2.52))/0.9
  x4 <- (log(s/5.88))/0.88
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_bc_b_P <- function(s){
  x4 <- (log(s/5.88))/0.88
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_bc_b_P <- function(s){
  x1 <- (log(s/0.5))/1
  x2 <- (log(s/1.01))/0.97
  x3 <- (log(s/2.52))/0.9
  x4 <- (log(s/5.88))/0.88
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_c_H <- function(s){
  x1 <- (log(s/1.43))/0.7
  x2 <- (log(s/2.85))/0.73
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_c_H <- function(s){
  x2 <- (log(s/2.85))/0.73
  x3 <- (log(s/7.13))/0.85
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_c_H <- function(s){
  x3 <- (log(s/7.13))/0.85
  x4 <- (log(s/16.63))/0.965
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_c_H <- function(s){
  x4 <- (log(s/16.63))/0.965
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_c_H <- function(s){
  x1 <- (log(s/1.43))/0.7
  x2 <- (log(s/2.85))/0.73
  x3 <- (log(s/7.13))/0.85
  x4 <- (log(s/16.63))/0.965
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_c_M <- function(s){
  x1 <- (log(s/1.3))/0.71
  x2 <- (log(s/2.59))/0.74
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_c_M <- function(s){
  x2 <- (log(s/2.59))/0.74
  x3 <- (log(s/6.48))/0.9
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_c_M <- function(s){
  x3 <- (log(s/6.48))/0.9
  x4 <- (log(s/15.12))/0.96
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_c_M <- function(s){
  x4 <- (log(s/15.12))/0.96
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_c_M <- function(s){
  x1 <- (log(s/1.3))/0.71
  x2 <- (log(s/2.59))/0.74
  x3 <- (log(s/6.48))/0.9
  x4 <- (log(s/15.12))/0.96
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_c_L <- function(s){
  x1 <- (log(s/1.17))/0.72
  x2 <- (log(s/2.33))/0.75
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_c_L <- function(s){
  x2 <- (log(s/2.33))/0.75
  x3 <- (log(s/5.83))/0.95
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_c_L <- function(s){
  x3 <- (log(s/5.83))/0.95
  x4 <- (log(s/13.61))/0.955
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_c_L <- function(s){
  x4 <- (log(s/13.61))/0.955
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_c_L <- function(s){
  x1 <- (log(s/1.17))/0.72
  x2 <- (log(s/2.33))/0.75
  x3 <- (log(s/5.83))/0.95
  x4 <- (log(s/13.61))/0.955
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_c_P <- function(s){
  x1 <- (log(s/1.04))/0.73
  x2 <- (log(s/2.07))/0.76
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_c_P <- function(s){
  x2 <- (log(s/2.07))/0.76
  x3 <- (log(s/5.18))/1
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_c_P <- function(s){
  x3 <- (log(s/5.18))/1
  x4 <- (log(s/12.1))/0.95
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_c_P <- function(s){
  x4 <- (log(s/12.1))/0.95
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_c_P <- function(s){
  x1 <- (log(s/1.04))/0.73
  x2 <- (log(s/2.07))/0.76
  x3 <- (log(s/5.18))/1
  x4 <- (log(s/12.1))/0.95
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_a_H <- function(s){
  x1 <- (log(s/0.6))/1.04
  x2 <- (log(s/1.19))/1.03
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_a_H <- function(s){
  x2 <- (log(s/1.19))/1.03
  x3 <- (log(s/2.97))/1.04
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_a_H <- function(s){
  x3 <- (log(s/2.97))/1.04
  x4 <- (log(s/6.93))/0.905
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_a_H <- function(s){
  x4 <- (log(s/6.93))/0.905
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_a_H <- function(s){
  x1 <- (log(s/0.6))/1.04
  x2 <- (log(s/1.19))/1.03
  x3 <- (log(s/2.97))/1.04
  x4 <- (log(s/6.93))/0.905
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_a_L <- function(s){
  x1 <- (log(s/0.58))/1.14
  x2 <- (log(s/0.97))/1.11
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_a_L <- function(s){
  x2 <- (log(s/0.97))/1.11
  x3 <- (log(s/2.43))/1.12
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_a_L <- function(s){
  x3 <- (log(s/2.43))/1.12
  x4 <- (log(s/5.67))/0.915
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_a_L <- function(s){
  x4 <- (log(s/5.67))/0.915
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_a_L <- function(s){
  x1 <- (log(s/0.58))/1.14
  x2 <- (log(s/0.97))/1.11
  x3 <- (log(s/2.43))/1.12
  x4 <- (log(s/5.67))/0.915
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_a_M <- function(s){
  x1 <- (log(s/0.54))/1.09
  x2 <- (log(s/1.08))/1.07
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_a_M <- function(s){
  x2 <- (log(s/1.08))/1.07
  x3 <- (log(s/2.7))/1.08
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_a_M <- function(s){
  x3 <- (log(s/2.7))/1.08
  x4 <- (log(s/6.3))/0.91
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_a_M <- function(s){
  x4 <- (log(s/6.3))/0.91
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_a_M <- function(s){
  x1 <- (log(s/0.54))/1.09
  x2 <- (log(s/1.08))/1.07
  x3 <- (log(s/2.7))/1.08
  x4 <- (log(s/6.3))/0.91
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_a_P <- function(s){
  x1 <- (log(s/0.43))/1.19
  x2 <- (log(s/0.86))/1.15
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_a_P <- function(s){
  x2 <- (log(s/0.86))/1.15
  x3 <- (log(s/2.16))/1.16
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_a_P <- function(s){
  x3 <- (log(s/2.16))/1.16
  x4 <- (log(s/5.04))/0.92
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_a_P <- function(s){
  x4 <- (log(s/5.04))/0.92
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_a_P <- function(s){
  x1 <- (log(s/0.43))/1.19
  x2 <- (log(s/0.86))/1.15
  x3 <- (log(s/2.16))/1.16
  x4 <- (log(s/5.04))/0.92
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_b_H <- function(s){
  x1 <- (log(s/0.98))/0.825
  x2 <- (log(s/1.98))/0.815
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_b_H <- function(s){
  x2 <- (log(s/1.98))/0.815
  x3 <- (log(s/4.95))/0.735
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_b_H <- function(s){
  x3 <- (log(s/4.95))/0.735
  x4 <- (log(s/11.55))/0.99
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_b_H <- function(s){
  x4 <- (log(s/11.55))/0.99
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_b_H <- function(s){
  x1 <- (log(s/0.98))/0.825
  x2 <- (log(s/1.98))/0.815
  x3 <- (log(s/4.95))/0.735
  x4 <- (log(s/11.55))/0.99
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_b_L <- function(s){
  x1 <- (log(s/0.81))/0.875
  x2 <- (log(s/1.62))/0.845
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_b_L <- function(s){
  x2 <- (log(s/1.62))/0.845
  x3 <- (log(s/4.05))/0.845
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_b_L <- function(s){
  x3 <- (log(s/4.05))/0.845
  x4 <- (log(s/9.45))/0.97
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_b_L <- function(s){
  x4 <- (log(s/9.45))/0.97
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_b_L <- function(s){
  x1 <- (log(s/0.81))/0.875
  x2 <- (log(s/1.62))/0.845
  x3 <- (log(s/4.05))/0.845
  x4 <- (log(s/9.45))/0.97
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_b_M <- function(s){
  x1 <- (log(s/0.9))/0.85
  x2 <- (log(s/1.8))/0.83
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_b_M <- function(s){
  x2 <- (log(s/1.8))/0.83
  x3 <- (log(s/4.5))/0.79
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_b_M <- function(s){
  x3 <- (log(s/4.5))/0.79
  x4 <- (log(s/10.5))/0.98
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_b_M <- function(s){
  x4 <- (log(s/10.5))/0.98
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_b_M <- function(s){
  x1 <- (log(s/0.9))/0.85
  x2 <- (log(s/1.8))/0.83
  x3 <- (log(s/4.5))/0.79
  x4 <- (log(s/10.5))/0.98
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
dm_slight_rc_b_P <- function(s){
  x1 <- (log(s/0.72))/0.9
  x2 <- (log(s/1.44))/0.86
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  slight <- y1-y2
  return(slight)
}
dm_moderate_rc_b_P <- function(s){
  x2 <- (log(s/1.44))/0.86
  x3 <- (log(s/3.6))/0.9
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  moderate <- y2-y3
  return(moderate)
}
dm_extensive_rc_b_P <- function(s){
  x3 <- (log(s/3.6))/0.9
  x4 <- (log(s/8.4))/0.96
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  extensive <- y3-y4
  return(extensive)
}
dm_complete_rc_b_P <- function(s){
  x4 <- (log(s/8.4))/0.96
  y4 <- pnorm(x4, mean=0,sd=1)
  complete <- y4
  return(complete)
}
xf_dm_rc_b_P <- function(s){
  x1 <- (log(s/0.72))/0.9
  x2 <- (log(s/1.44))/0.86
  x3 <- (log(s/3.6))/0.9
  x4 <- (log(s/8.4))/0.96
  y1 <- pnorm(x1, mean=0,sd=1)
  y2 <- pnorm(x2, mean=0,sd=1)
  y3 <- pnorm(x3, mean=0,sd=1)
  y4 <- pnorm(x4, mean=0,sd=1)
  slight <- y1-y2
  moderate <- y2-y3
  extensive <- y3-y4
  complete <- y4
  slight2 <- slight*0.2          
  moderate2 <- moderate*0.4       
  extensive2 <- extensive*0.7       
  complete2 <- complete*1       
  damage <- slight2+moderate2+extensive2+complete2
  return(damage)
}
