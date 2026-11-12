clear all
set more off

use data.dta, clear

*Short-term Orientations
egen short_term = rowmean(I1 I2 I3 I4 I5 I6 I7)

*Trust
egen ability = rowmean(A1 A2 A3 A4)
egen benevolence = rowmean(B1 B2 B3 B4)
egen integrity = rowmean(In1 In2 In3 In4)
egen trust = rowmean(A1 A2 A3 A4 B1 B2 B3 B4 In1 In2 In3 In4)

*Investment decisions
egen behavioral_intention = rowmean(BI1 BI2 BI3)
egen actual_use = rowmean(AS1 AS2 AS3)

egen invest = rowmean(BI1 BI2 BI3 AS1 AS2 AS3)

*centering
center short_term trust
center ability benevolence integrity


*interaction
gen i_ability = c_ability * c_short_term
gen i_benevolence = c_benevolence * c_short_term
gen i_integrity = c_integrity * c_short_term
gen interaction = c_short_term * c_trust