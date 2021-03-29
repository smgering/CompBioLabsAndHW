# Title: "Lab 08"
# Author: "Sarah Gering"
# Date: "3/28/2021"

## LOGISTIC GROWTH BACKGROUND

#### This document contains the functions about the logistic growth model that measures the populations abundances over time given an intrinsic growth rate, starting population, carrying capacity, and generations. You can find the final metadata and results file [here](https://github.com/smgering/CompBioLabsAndHW/tree/main/Labs/Lab08)

## LOGISTIC GROWTH EQUATION

#### The logistic growth equation is the following:
  
#### _n[t] <- n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )_

#### Where n[t] is the abundance of the population at time t, n[t – 1] is the abundance of the population in the previous time step, r is the intrinsic growth rate of the population, and K is the environmental carrying capacity for the population.

## **LOGISTIC MODEL FUNCTION**

**Function Definition**

***Logistic_Growth** <- function( r, K, t, n) {
  abundance <- rep(n, t)
  for (i in 2:t) {
    abundance[i] <- ((abundance[i-1] + ((r * abundance[i-1]) * ((K - abundance[i-1]) / K )))) 
  }
  return(abundance)
}*

**Demonstration of Usage** 

***Logistic_Growth**( 0.8, 10000, 12, 2500 )* 

## LOGISTIC MODEL OF THE PLOT

![Logistic Plot Model](https://github.com/smgering/CompBioLabsAndHW/blob/main/Labs/Lab08/Lab08_Logistic_Plot.jpeg)
