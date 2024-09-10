#### code 1
#### Code designed to convert the building volumes to stocks.

#### inputs
#### Material intensity refers to Table S7 in supplementary material.
#### mod: geographic information of 1 km raster boundary
#### df: building volumes
#### ms: material intensity

#### outputs
#### it will create files for each city
#### the outputs include:
#### proportions of material stocks by structures, land attributes, floors, and seismic designs


#### packages
{
  require(tidyverse)
  require(terra)
}
eq_dr <- function(mod, df) {
  mod %>% 
    left_join(df) -> df1
  df1 %>% 
    split(.$land) -> df2
  ms %>% 
    dplyr::filter(land==51) %>% 
    dplyr::filter(stt=="bw") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_ur_bw
  ms %>% 
    dplyr::filter(land==51) %>% 
    dplyr::filter(stt=="bc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_ur_bc
  ms %>% 
    dplyr::filter(land==51) %>% 
    dplyr::filter(stt=="rc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_ur_rc
  ms %>% 
    dplyr::filter(land==52) %>% 
    dplyr::filter(stt=="bw") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_rr_bw
  ms %>% 
    dplyr::filter(land==52) %>% 
    dplyr::filter(stt=="bc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_rr_bc
  ms %>% 
    dplyr::filter(land==52) %>% 
    dplyr::filter(stt=="rc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_rr_rc
  ms %>% 
    dplyr::filter(land==53) %>% 
    dplyr::filter(stt=="bw") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_ii_bw
  ms %>% 
    dplyr::filter(land==53) %>% 
    dplyr::filter(stt=="bc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_ii_bc
  ms %>% 
    dplyr::filter(land==53) %>% 
    dplyr::filter(stt=="rc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_ii_rc
  ms %>% 
    dplyr::filter(land==999) %>% 
    dplyr::filter(stt=="bw") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_tt_bw
  ms %>% 
    dplyr::filter(land==999) %>% 
    dplyr::filter(stt=="bc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_tt_bc
  ms %>% 
    dplyr::filter(land==999) %>% 
    dplyr::filter(stt=="rc") %>% 
    dplyr::select(-stt, -land) %>% 
    pull() -> M_tt_rc
  df2$`51` -> urban
  df2$`52` -> rural
  df2$`53` -> indus
  df2$`999` -> town
  urban %>% 
    mutate(
      re_bw_H=bw_H*M_ur_bw,
      re_bw_M=bw_M*M_ur_bw,
      re_bw_L=bw_L*M_ur_bw,
      re_bw_P=bw_P*M_ur_bw,
      re_bc_a_H=bc_a_H*M_ur_bc,
      re_bc_a_M=bc_a_M*M_ur_bc,
      re_bc_a_L=bc_a_L*M_ur_bc,
      re_bc_a_P=bc_a_P*M_ur_bc,
      re_bc_b_H=bc_b_H*M_ur_bc,
      re_bc_b_M=bc_b_M*M_ur_bc,
      re_bc_b_L=bc_b_L*M_ur_bc,
      re_bc_b_P=bc_b_P*M_ur_bc,
      re_rc_a_H=rc_a_H*M_ur_rc,
      re_rc_a_M=rc_a_M*M_ur_rc,
      re_rc_a_L=rc_a_L*M_ur_rc,
      re_rc_a_P=rc_a_P*M_ur_rc,
      re_rc_b_H=rc_b_H*M_ur_rc,
      re_rc_b_M=rc_b_M*M_ur_rc,
      re_rc_b_L=rc_b_L*M_ur_rc,
      re_rc_b_P=rc_b_P*M_ur_rc,
      re_rc_c_H=rc_c_H*M_ur_rc,
      re_rc_c_M=rc_c_M*M_ur_rc,
      re_rc_c_L=rc_c_L*M_ur_rc,
      re_rc_c_P=rc_c_P*M_ur_rc,
      bw_H=re_bw_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_M=re_bw_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_L=re_bw_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_P=re_bw_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_H=re_bc_a_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_M=re_bc_a_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_L=re_bc_a_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_P=re_bc_a_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_H=re_bc_b_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_M=re_bc_b_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_L=re_bc_b_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_P=re_bc_b_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_H=re_rc_a_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_M=re_rc_a_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_L=re_rc_a_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_P=re_rc_a_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_H=re_rc_b_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_M=re_rc_b_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_L=re_rc_b_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_P=re_rc_b_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_H=re_rc_c_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_M=re_rc_c_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_L=re_rc_c_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_P=re_rc_c_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      test=bw_H+bw_M+bw_L+bw_P+bc_a_H+bc_a_M+bc_a_L+bc_a_P+bc_b_H+bc_b_M+bc_b_L+bc_b_P+rc_a_H+rc_a_M+rc_a_L+rc_a_P+rc_b_H+rc_b_M+rc_b_L+rc_b_P+rc_c_H+rc_c_M+rc_c_L+rc_c_P
    ) %>% 
    dplyr::select(-c(27:50)) -> urban2
  indus %>% 
    mutate(
      re_bw_H=bw_H*M_ii_bw,
      re_bw_M=bw_M*M_ii_bw,
      re_bw_L=bw_L*M_ii_bw,
      re_bw_P=bw_P*M_ii_bw,
      re_bc_a_H=bc_a_H*M_ii_bc,
      re_bc_a_M=bc_a_M*M_ii_bc,
      re_bc_a_L=bc_a_L*M_ii_bc,
      re_bc_a_P=bc_a_P*M_ii_bc,
      re_bc_b_H=bc_b_H*M_ii_bc,
      re_bc_b_M=bc_b_M*M_ii_bc,
      re_bc_b_L=bc_b_L*M_ii_bc,
      re_bc_b_P=bc_b_P*M_ii_bc,
      re_rc_a_H=rc_a_H*M_ii_rc,
      re_rc_a_M=rc_a_M*M_ii_rc,
      re_rc_a_L=rc_a_L*M_ii_rc,
      re_rc_a_P=rc_a_P*M_ii_rc,
      re_rc_b_H=rc_b_H*M_ii_rc,
      re_rc_b_M=rc_b_M*M_ii_rc,
      re_rc_b_L=rc_b_L*M_ii_rc,
      re_rc_b_P=rc_b_P*M_ii_rc,
      re_rc_c_H=rc_c_H*M_ii_rc,
      re_rc_c_M=rc_c_M*M_ii_rc,
      re_rc_c_L=rc_c_L*M_ii_rc,
      re_rc_c_P=rc_c_P*M_ii_rc,
      bw_H=re_bw_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_M=re_bw_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_L=re_bw_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_P=re_bw_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_H=re_bc_a_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_M=re_bc_a_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_L=re_bc_a_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_P=re_bc_a_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_H=re_bc_b_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_M=re_bc_b_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_L=re_bc_b_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_P=re_bc_b_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_H=re_rc_a_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_M=re_rc_a_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_L=re_rc_a_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_P=re_rc_a_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_H=re_rc_b_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_M=re_rc_b_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_L=re_rc_b_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_P=re_rc_b_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_H=re_rc_c_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_M=re_rc_c_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_L=re_rc_c_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_P=re_rc_c_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      test=bw_H+bw_M+bw_L+bw_P+bc_a_H+bc_a_M+bc_a_L+bc_a_P+bc_b_H+bc_b_M+bc_b_L+bc_b_P+rc_a_H+rc_a_M+rc_a_L+rc_a_P+rc_b_H+rc_b_M+rc_b_L+rc_b_P+rc_c_H+rc_c_M+rc_c_L+rc_c_P
    ) %>% 
    dplyr::select(-c(27:50)) -> indus2
  town %>% 
    mutate(
      re_bw_H=bw_H*M_tt_bw,
      re_bw_M=bw_M*M_tt_bw,
      re_bw_L=bw_L*M_tt_bw,
      re_bw_P=bw_P*M_tt_bw,
      re_bc_a_H=bc_a_H*M_tt_bc,
      re_bc_a_M=bc_a_M*M_tt_bc,
      re_bc_a_L=bc_a_L*M_tt_bc,
      re_bc_a_P=bc_a_P*M_tt_bc,
      re_bc_b_H=bc_b_H*M_tt_bc,
      re_bc_b_M=bc_b_M*M_tt_bc,
      re_bc_b_L=bc_b_L*M_tt_bc,
      re_bc_b_P=bc_b_P*M_tt_bc,
      re_rc_a_H=rc_a_H*M_tt_rc,
      re_rc_a_M=rc_a_M*M_tt_rc,
      re_rc_a_L=rc_a_L*M_tt_rc,
      re_rc_a_P=rc_a_P*M_tt_rc,
      re_rc_b_H=rc_b_H*M_tt_rc,
      re_rc_b_M=rc_b_M*M_tt_rc,
      re_rc_b_L=rc_b_L*M_tt_rc,
      re_rc_b_P=rc_b_P*M_tt_rc,
      re_rc_c_H=rc_c_H*M_tt_rc,
      re_rc_c_M=rc_c_M*M_tt_rc,
      re_rc_c_L=rc_c_L*M_tt_rc,
      re_rc_c_P=rc_c_P*M_tt_rc,
      bw_H=re_bw_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_M=re_bw_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_L=re_bw_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bw_P=re_bw_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_H=re_bc_a_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_M=re_bc_a_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_L=re_bc_a_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_a_P=re_bc_a_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_H=re_bc_b_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_M=re_bc_b_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_L=re_bc_b_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      bc_b_P=re_bc_b_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_H=re_rc_a_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_M=re_rc_a_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_L=re_rc_a_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_a_P=re_rc_a_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_H=re_rc_b_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_M=re_rc_b_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_L=re_rc_b_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_b_P=re_rc_b_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_H=re_rc_c_H/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_M=re_rc_c_M/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_L=re_rc_c_L/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      rc_c_P=re_rc_c_P/(re_bw_H+re_bw_M+re_bw_L+re_bw_P+re_bc_a_H+re_bc_a_M+re_bc_a_L+re_bc_a_P+re_bc_b_H+re_bc_b_M+re_bc_b_L+re_bc_b_P+re_rc_a_H+re_rc_a_M+re_rc_a_L+re_rc_a_P+re_rc_b_H+re_rc_b_M+re_rc_b_L+re_rc_b_P+re_rc_c_H+re_rc_c_M+re_rc_c_L+re_rc_c_P),
      test=bw_H+bw_M+bw_L+bw_P+bc_a_H+bc_a_M+bc_a_L+bc_a_P+bc_b_H+bc_b_M+bc_b_L+bc_b_P+rc_a_H+rc_a_M+rc_a_L+rc_a_P+rc_b_H+rc_b_M+rc_b_L+rc_b_P+rc_c_H+rc_c_M+rc_c_L+rc_c_P
    ) %>% 
    dplyr::select(-c(27:50)) -> town2
  urban2 %>% 
    bind_rows(indus2) %>% 
    bind_rows(town2)
}
