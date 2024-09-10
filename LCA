####code 4

##################code designed to calculate the economic costs and environmental impacts##############
####to calculate the actual costs, it will work for each city.
####the code given below is for BAU scenarios. 
####for future structural scenarios, only the structure proportions (bc_bau and rc_bau) need to be adjusted.

####inputs
####Variable "bau" is the structure proportion for each city, please refers to the detailed calculation in Table S14 in the Supplementary Materials
####Variable "coff" is the seismic fortification coefficient, which can match the corresponidng vulnerability function (Table S9)
####Variable "inflow" is the total material inflows in 2100
####Variable "ppp"contain building areas, population, GDP under SSPs scenarios from 2021 to 2100,  in a csv format.
####Variable "dist0" is the average transportation distance of waste
####The data description used are provided in Table S4, Table S7, Table S11, Table S12, Table S13, Table S15 in the Supplementary Materials
####ALL data are available on request from J.S. (sunjian143687@163.com; jians@cqu.edu.cn).
######################################################################

####outputs
####it will output a lot of values for different cities 
####the outputs include:
####the economic cost in every process
####the environmental impacts
####the expected population exposure
####the results are provided in Table S3 in the Supplementary Materials, Fig. 4 and Fig. 5 in main text.

####package
{
  requir("tidyverse")
}


#### function
eq_bau <- function(sss, acode) {
  bau %>% 
    dplyr::filter(ccode==acode) -> city1
  city1$bc_bau -> bc_bau
  city1$rc_bau -> rc_bau
  
  city1[,-1] -> lzz2
  inflow %>% 
    dplyr::filter(ssp==sss) %>% 
    dplyr::filter(ccode==acode) %>% 
    dplyr::filter(year>2020) %>% 
    dplyr::select(year, inflow2) -> inflow3
  sum(inflow3$inflow2) -> inf_cum    
  
  inf_cum*bc_bau -> bc_area   
  inf_cum*rc_bau -> rc_area   
  
  data.frame(
    c("Steel", 	"Aluminum", 	"Copper", 	"Wood", 	"Cement", 	"Brick", 	"Gravel",	"Sand", 	"Asphalt", 	"Glass",	"Plastic", 	"Rubber" )
    ,c(19.44194, 2.038688, 0.3598541, 6.979588, 245.7721, 710.0071, 722.791, 594.0324, 2, 7.796778, 3.750144, 0.4611474) %>% 
      as_tibble(),
    c(61.50005, 2.038688, 0.3598541, 6.86129, 416.606, 356.0946, 1160.548, 619.2338, 2.571167,10.77373, 3.780587, 0.4648909) %>%  
      as_tibble(),
    c(3800, 21200, 81000, 6400, 500, 200, 110, 60, 3500, 1680, 6000, 14850) %>% 
      as_tibble(),
    c(1030, 22700, 5530, 25.1, 706, 246, 3.41, 2.46, 276, 787, 5110, 2870) %>% 
      as_tibble()) %>% 
    set_names("mat","cof_bc", "cof_rc","price","co2") %>% 
    as_tibble() -> temp
  
  temp %>% 
    mutate(inflow_bc=bc_area*cof_bc/1000,   
           inflow_rc=rc_area*cof_rc/1000,
           price_mat_bc=inflow_bc*price,
           price_mat_rc=inflow_rc*price,
           co2_eq_bc=inflow_bc*co2,
           co2_eq_rc=inflow_rc*co2,
           price_co2_bc=co2_eq_bc*0.447,
           price_co2_rc=co2_eq_rc*0.447) -> temp1
  
  bc_area*507.9605226 -> i_bud_pr_bc      
  rc_area*1523.881568 -> i_bud_pr_rc      
  tibble(i_bud_pr_bc, i_bud_pr_rc) -> lzz3
  
  
  ###############################output###########################
  dist0 %>% 
    dplyr::filter(ccode==acode) -> dist1
  dist1$dist -> ddd1
  
  ppp %>% 
    dplyr::filter(ssp==sss) %>% 
    dplyr::filter(ccode==acode) %>% 
    dplyr::filter(year==2100) -> ppp1
  
  ppp1$area -> area_all
  area_all*bc_bau -> area_bc
  area_all*rc_bau -> area_rc
  
  ppp1$pop -> pop_all
  pop_all*bc_bau -> pop_bc
  pop_all*rc_bau -> pop_rc
  
  coff %>% 
    dplyr::filter(ccode==acode) -> cof2
  cof2$pga -> pga
  cof2$sde_bc -> sde_bc
  cof2$sde_rc -> sde_rc
  
  
  cof2$mm1_bc -> mm1_bc
  cof2$mm2_bc -> mm2_bc
  cof2$mm3_bc -> mm3_bc
  cof2$mm4_bc -> mm4_bc
  cof2$beta1_bc -> beta1_bc
  cof2$beta2_bc -> beta2_bc
  cof2$beta3_bc -> beta3_bc
  cof2$beta4_bc -> beta4_bc
  
  cof2$mm1_rc -> mm1_rc
  cof2$mm2_rc -> mm2_rc
  cof2$mm3_rc -> mm3_rc
  cof2$mm4_rc -> mm4_rc
  cof2$beta1_rc -> beta1_rc
  cof2$beta2_rc -> beta2_rc
  cof2$beta3_rc -> beta3_rc
  cof2$beta4_rc -> beta4_rc
  
  pga/0.0254/sde_bc -> pwy
  ax1 <- (log(pwy/mm1_bc))/beta1_bc
  ax2 <- (log(pwy/mm2_bc))/beta2_bc
  ax3 <- (log(pwy/mm3_bc))/beta3_bc
  ax4 <- (log(pwy/mm4_bc))/beta4_bc
  ay1 <- pnorm(ax1, mean=0,sd=1)
  ay2 <- pnorm(ax2, mean=0,sd=1)
  ay3 <- pnorm(ax3, mean=0,sd=1)
  ay4 <- pnorm(ax4, mean=0,sd=1)
  
  slight_bc <- ay1-ay2
  moderate_bc <- ay2-ay3
  extensive_bc <- ay3-ay4
  complete_bc <- ay4
  
  
  pga/0.0254/sde_rc -> pwy
  bx1 <- (log(pwy/mm1_rc))/beta1_rc
  bx2 <- (log(pwy/mm2_rc))/beta2_rc
  bx3 <- (log(pwy/mm3_rc))/beta3_rc
  bx4 <- (log(pwy/mm4_rc))/beta4_rc
  by1 <- pnorm(bx1, mean=0,sd=1)
  by2 <- pnorm(bx2, mean=0,sd=1)
  by3 <- pnorm(bx3, mean=0,sd=1)
  by4 <- pnorm(bx4, mean=0,sd=1)
  
  slight_rc <- by1-by2
  moderate_rc <- by2-by3
  extensive_rc <- by3-by4
  complete_rc <- by4
  
  
  
  slight_bc+moderate_bc+extensive_bc+complete_bc -> pop_exp_ratio_bc
  slight_rc+moderate_rc+extensive_rc+complete_rc -> pop_exp_ratio_rc
  
  pop_exp_bc <- pop_exp_ratio_bc*pop_bc
  pop_exp_rc <- pop_exp_ratio_rc*pop_rc
  (pop_exp_bc+pop_exp_rc)/pop_all -> pop_exp_ratio
  pop_exp_ratio %>% as_tibble() %>% set_names("o_pop_exp_ratio") -> lzz4
  
  
  data.frame(c(0.00001, 0.0001, 0.001, 0.01) %>% 
               as_tibble(),
             c(0.00005, 0.001, 0.005, 0.05) %>% 
               as_tibble(),
             c(slight_bc, moderate_bc,extensive_bc,complete_bc) %>% 
               as_tibble(),
             c(slight_rc, moderate_rc,extensive_rc,complete_rc) %>% 
               as_tibble()
  ) %>% 
    as_tibble() %>% 
    set_names("cof_die","cof_injure","exp_ratio_bc", "exp_ratio_rc") %>% 
    mutate(die_bc=cof_die*exp_ratio_bc*pop_bc,
           die_rc=cof_die*exp_ratio_rc*pop_rc,
           injure_bc=cof_injure*exp_ratio_bc*pop_bc,
           injure_rc=cof_injure*exp_ratio_rc*pop_rc,
           pop_die=die_bc+die_rc,
           pop_injure=injure_bc+injure_rc
    ) %>% 
    dplyr::select(pop_die, pop_injure) %>% 
    colSums() -> pop_temp
  
  as.numeric(pop_temp[1]) -> pop_die
  as.numeric(pop_temp[2]) -> pop_injure
  
  o_pop_die_pr <- pop_die*5000000
  o_pop_injure_pr <- pop_injure*5000000/3
  
  tibble(o_pop_die_pr, o_pop_injure_pr) -> lzz5
  
  ##for stocks
  slight2_bc <- slight_bc*0.2          
  moderate2_bc <- moderate_bc*0.4      
  extensive2_bc <- extensive_bc*0.7     
  complete2_bc <- complete_bc*1     
  slight2_rc <- slight_rc*0.2        
  moderate2_rc <- moderate_rc*0.4       
  extensive2_rc <- extensive_rc*0.7       
  complete2_rc <- complete_rc*1       
  
  damage_ratio_bc <- slight2_bc+moderate2_bc+extensive2_bc+complete2_bc
  damage_ratio_rc <- slight2_rc+moderate2_rc+extensive2_rc+complete2_rc
  
  ##the cost for disposal
  temp1 %>% 
    mutate(stock_bc=cof_bc*area_bc/1000,
           stock_rc=cof_rc*area_rc/1000) -> temp2
  
  data.frame(temp2, c(957.7707006,1663.333333,1663.333333,14890,3175.957447,4261.428571,3175.957447,3175.957447,4386.470588,4386.470588,6773.636364,4970) %>% 
               as_tibble()) %>% 
    rename(dispose_price=value) %>% 
    as_tibble() %>% 
    mutate(damage_stock_bc=stock_bc*damage_ratio_bc,
           damage_stock_rc=stock_rc*damage_ratio_rc,
           out_dps_bc=damage_stock_bc*dispose_price,
           out_dps_rc=damage_stock_rc*dispose_price,
           co2_eq_out_bc=damage_stock_bc*ddd1*0.249412648234898,
           co2_eq_out_rc=damage_stock_rc*ddd1*0.249412648234898, 
           co2_price_out_bc=co2_eq_out_bc*0.447,  
           co2_price_out_rc=co2_eq_out_rc*0.447  
    ) -> temp3
  
  
  inflow3 %>% 
    mutate(year2=year-2020) %>% 
    mutate(cdf=pnorm(year2, mean = 45, sd = 9)) %>% 
    mutate(inflow3=inflow2*cdf) -> xxf0
  
  sum(xxf0$inflow3) -> xxf1
  xxf0 %>% 
    mutate(input3=inflow3/xxf1) %>% 
    mutate(cum_left_bc=input3*area_bc*damage_ratio_bc,
           cum_left_rc=input3*area_rc*damage_ratio_rc
    ) %>% 
    mutate(year3=2100-year) %>% 
    mutate(year3=if_else(year3>=45, 45, year3)) %>% 
    mutate(price_bc_left=cum_left_bc*791.6282226*(1-(year3/45)),
           price_rc_left=cum_left_rc*2374.884668*(1-(year3/45))
    ) -> xxf2
  
  sum(xxf2$price_bc_left)+sum(xxf2$price_rc_left) -> o_zj_pr_all
  o_zj_pr_all %>% as_tibble() %>% set_names("o_zj_pr_all") -> lzz6

  
  temp3 %>% dplyr::select(-c(1:5), -dispose_price) %>% 
    colSums() %>% 
    as.data.frame() %>% 
    rownames_to_column(var="nmss") %>% 
    as_tibble() %>% 
    set_names("nmss", "value") %>% 
    spread(nmss, value) %>% 
    rename(
      i_co2_eq_bc=co2_eq_bc,
      i_co2_eq_rc=co2_eq_rc,
      
      
      o_co2_eq_bc=co2_eq_out_bc,
      o_co2_eq_rc=co2_eq_out_rc,
      
      o_co2_pr_bc=co2_price_out_bc,
      o_co2_pr_rc=co2_price_out_rc,
      
      o_damage_stock_bc=damage_stock_bc,
      o_damage_stock_rc=damage_stock_rc,
      
      i_inflow_bc=inflow_bc,
      i_inflow_rc=inflow_rc,
      
      o_dps_pr_bc=out_dps_bc,
      o_dps_pr_rc=out_dps_rc,
      
      i_co2_pr_bc=price_co2_bc,
      i_co2_pr_rc=price_co2_rc,
      
      i_mat_pr_bc=price_mat_bc,
      i_mat_pr_rc=price_mat_rc,
      
      stock_bc_2100=stock_bc,
      stock_rc_2100=stock_rc
      
    ) -> lzz1
  
  tibble(lzz2, lzz1, lzz3, lzz4, lzz5, lzz6) %>% 
    mutate(o_pop_die=pop_die,
           ssp=sss,
           ccode=acode,
           pop_all=pop_all,
           o_pop_injure=pop_injure
    ) %>% 
    dplyr::select(ssp, ccode, bc_bau, rc_bau,pop_all, i_inflow_bc, i_inflow_rc, i_co2_eq_bc, i_co2_eq_rc, 
                  i_mat_pr_bc, i_mat_pr_rc, i_bud_pr_bc, i_bud_pr_rc, i_co2_pr_bc, i_co2_pr_rc,
                  stock_bc_2100, stock_rc_2100,o_damage_stock_bc,o_damage_stock_rc,
                  o_co2_eq_bc, o_co2_eq_rc, o_pop_exp_ratio, o_pop_die, o_pop_injure,
                  o_pop_die_pr, o_pop_injure_pr, o_dps_pr_bc, o_dps_pr_rc,
                  o_zj_pr_all, o_co2_pr_bc,o_co2_pr_rc
    )
}

