* ============                             ===================
* ============ Elasticities                  ===================
* ============                             ===================
*PP 11) INTRODUCE ELASTICITIES (kl, kle, klem PER SECTOR)
parameter ELAS(*, *),ELAS0(*, *),elasM(*);

$gdxin 'TestElas'
$load ELAS0=ELAS
$gdxin

set EU27(cnt) /
AT
BE
BG
CZ
CY
DK
EE
FI
FR
DE
GR
HU
IE
IT
LV
LT
LU
MT
NL
PL
PT
RO
SK
SI
ES
SE
*NO
*GB
*CH
/;



parameter urate(cnt) unemployment rate in base year (2010) /
AT        =        0.041
BE        =        0.07
BG        =        0.092
CY        =        0.051
CZ        =        0.064
DE        =        0.0697
DK        =        0.063
EE        =        0.149
ES        =        0.178
FI        =        0.066
FR        =        0.077
GR        =        0.127
HU        =        0.1
IE        =        0.12
IT        =        0.084
LT        =        0.161
LU        =        0.038
LV        =        0.174
MT        =        0.056
NL        =        0.039
PL        =        0.081
PT        =        0.105
RO        =        0.0696
SE        =        0.086
SI        =        0.065
SK        =        0.125
GB        =        0.058
CH        =        0.0166
NO        =        0.027
/;

*Jan26
parameter GtK(cnt) capital ratio /
AT  =   3.1916
BE  =   2.6416
BG  =   2.9044
CY  =   2.368
CZ  =   2.7617
DE  =   2.8882
DK  =   2.3744
EE  =   2.4348
ES  =   3.4651
FI  =   3.084
FR  =   3.0404
GR  =   4.1286
HU  =   2.1679
IE  =   2.2131
IT  =   3.2455
LT  =   1.8726
LU  =   2.157
LV  =   1.9523
MT  =   1.9541
NL  =   2.5839
PL  =   1.8515
PT  =   2.9044
RO  =   1.9073
SE  =   3.338
SI  =   2.0458
SK  =   1.4642
GB  =   2.2131
CH  =   2.6416
NO  =   2.3744
/;


* from file Scenario_emissions/BAU by TNO
parameter eint0(cnt)  energy intensity from PRIMES in 2060 /
AT        =        0.4569
BE        =        0.5937
BG        =        0.4785
CY        =        0.4871
CZ        =        0.5113
DK        =        0.5520
EE        =        0.5326
FI        =        0.5268
FR        =        0.3969
DE        =        0.5112
GR        =        0.5403
HU        =        0.4094
IE        =        0.3984
IT        =        0.5521
LV        =        0.6555
LT        =        0.6149
LU        =        0.3845
MT        =        0.5906
PL        =        0.5150
PT        =        0.5413
RO        =        0.4848
SK        =        0.8096
SI        =        0.4950
ES        =        0.5301
SE        =        0.4046
NL        =        0.4986
GB        =        0.4046
CH        =        0.4046
NO        =        0.4046
/;

* from file Scenario_emissions/BAU by TNO Extra 20% decrease
parameter eint1(cnt)  energy intensity from PRIMES in 2060 /
AT        =        0.4569
BE        =        0.5937
BG        =        0.4785
CY        =        0.4871
CZ        =        0.5113
DK        =        0.5520
EE        =        0.5326
FI        =        0.5268
FR        =        0.3969
DE        =        0.5112
GR        =        0.5403
HU        =        0.4094
IE        =        0.3984
IT        =        0.5521
LV        =        0.6555
LT        =        0.6149
LU        =        0.3845
MT        =        0.5906
PL        =        0.5150
PT        =        0.5413
RO        =        0.4848
SK        =        0.8096
SI        =        0.4950
ES        =        0.5301
SE        =        0.4046
NL        =        0.4986
GB        =        0.4046
CH        =        0.4046
NO        =        0.4046
/;

*eint0(cnt)$(ExEff eq 1)=0*eint0(cnt)+1*eint1(cnt);


$ontext
* from file Scenario_emissions/BAU by TNO
parameter cint0(cnt)  carbon intensity in 2050 /
AT        =        0.55
BE        =        0.57
BG        =        0.43
CY        =        0.72
CZ        =        0.49
DE        =        0.60
DK        =        0.55
EE        =        0.39
ES        =        0.59
FI        =        0.46
FR        =        0.57
GR        =        0.48
HU        =        0.50
IE        =        0.31
IT        =        0.60
LT        =        0.49
LU        =        0.48
LV        =        0.29
MT        =        0.16
NL        =        0.55
PL        =        0.40
PT        =        0.61
RO        =        0.48
SE        =        0.25
SI        =        0.49
SK        =        0.50
GB        =        0.45
CH        =        0.57
NO        =        0.57
/;
* ##### REMOVE THIS!!! ######
*cint0(cnt)=0.8;
*############################
$offtext


*PP9b) HERE I PUT THE GROWTH OF THE DEMAND FROM THE REST OF THE WORLD.
* I ASSUME THAT IN GRADUAL DEVELOPMENT THE INDEX IS 1
* the data comes from Scenario_input_communication_fileGD_TNO.xlsx - sheet GDP_ROW
PARAMETER ROWd;
* for Gradual Development and Reference
ROWd=1;
* update only if the switch ROWgr is = 1
* for Techno-Friendly (denominator is the base value used for GD and Ref
ROWd$(P_S eq 3 and ROWgr eq 1)=((2.56+4.5)/(2.56+3.31))**(5/(2050-2011));
* for Societal Commitment
ROWd$(P_S eq 4 and ROWgr eq 1)=((2.56+4.5)/(2.56+3.31))**(5/(2050-2011));
* for Directed Transition
ROWd$(P_S eq 5 and ROWgr eq 1)=((2.57+3.31)/(2.56+3.31))**(5/(2050-2011));

*PP 10) HERE WE IDENTIFY THE RESOURCES (1) ENERGY (2) TRANSPORT (3) COMMODITIES
* FOR THE OUTPUT PRINTS (?)

*Identify the transport commodities and sectors, and the energy commodities
Parameter PID0(com0), SID0(sec0);
PID0(com0) = 0;
SID0(sec0) = 0;
* PRODUCT IDENTIFIER, SECTOR IDENTIFIER, FACTOR IDENTIFIER, TRANSPORT IDENTIFIER
PID0('c-bio') = 1;
PID0('c-powf') = 2;
PID0('c-powr') = 2;
PID0('c-coal') = 1;
PID0('c-crude-oil') = 1;
PID0('c-gase') = 1;
PID0('c-oil-gsl') = 1;
PID0('c-oil-jet') = 1;
PID0('c-oil-ker') = 1;
PID0('c-oil-dsl') = 1;
PID0('c-oil-hdi') = 1;
PID0('c-oil-ldsf') = 1;
PID0('c-c_trai') = 3;
PID0('c-c_tlnd') = 3;
PID0('c-c_tpip') = 3;
PID0('c-c_twas') = 3;
PID0('c-c_twai') = 3;
PID0('c-c_tair') = 3;

SID0('c_trai') = 3;
SID0('c_tlnd') = 3;
SID0('c_tpip') = 3;
SID0('c_twas') = 3;
SID0('c_twai') = 3;
SID0('c_tair') = 3;

Parameter FID0(com0), TID0(sec0);
FID0(com0) = 0;
TID0(sec0) = 0;


FID0('c-ng') = 1;
FID0('c-bio') = 1;
FID0('c-powf') = 2;
FID0('c-powr') = 2;
FID0('c-oil-gsl') = 1;
FID0('c-oil-jet') = 1;
FID0('c-oil-ker') = 1;
FID0('c-oil-dsl') = 1;
FID0('c-c_trai') = 3;
FID0('c-c_tlnd') = 3;
FID0('c-c_tpip') = 3;
FID0('c-c_twas') = 3;
FID0('c-c_twai') = 3;
FID0('c-c_tair') = 3;

TID0('c_trai') = 3;
TID0('c_tlnd') = 3;
TID0('c_twas') = 3;
TID0('c_twai') = 3;
TID0('c_tair') = 3;

* ####### write sam in percentages for selected goods. #############
set leap /l3*l10/;

Parameter CID0(com0);
CID0(com0)=0;
CID0('c-POWF')=1;
CID0('c-POWR')=1;
CID0('c-POWT')=1;
CID0('c-CRUDE-OIL')=1;
CID0('c-OIL-GSL')=1;
CID0('c-OIL-DSL')=1;
CID0('c-OIL-KER')=1;
CID0('c-OIL-LDSF')=1;
CID0('c-OIL-HDI')=1;
CID0('c-BIO')=1;
CID0('c-COAL')=1;
CID0('c-NG')=1;
*CID0('c-H2')=1;

* from GTAP
parameter elasM0(com0) armington elasticities between imports and domestic /
C-AAGR        3
C-FISH        3
C-IMIN        0.9
C-IRES        3.5
C-FB          3.5
C-FURS        3.5
C-RECO        3.5
C-MOTO        3.5
C-NG          17.2
C-BIO         1.4
C-POWF        2.8
C-POWR        2.8
C-POWT        2.8
C-LTH         1.4
C-COTH        1.9
C-CCON        1.9
C-CWSR        1.9
C-HOTL        1.9
C-COFF        1.9
C-FIN         1.9
C-RESER       1.9
C-EDU         1.9
C-C_TRAI      1.9
C-C_TLND      1.9
C-C_TPIP      1.9
C-CHEA        1.9
C-Waste       1.9
C-COAL        3
C-CRUDE-OIL   5.2
C-GASE        17.2
C-OIL-GSL     5.2
C-OIL-JET     5.2
C-OIL-KER     5.2
C-OIL-DSL     5.2
C-OIL-HDI     5.2
C-OIL-LDSF    5.2
C-IMEA        3.75
C-MACH        3.75
C-TRUC        3.75
C-FURN        3.75
C-C_TWAS      1.9
C-C_TWAI      1.9
C-C_TAIR      1.9
C-COIL        5.2
/;


* ========== Redefinition of the SAM, trade and trade margin matrices ==========

set sec /
iAGR    Agriculture
iIND    Industry
iALU    Aluminium
iSER    Services Provision
iHOT    Hotels and Restaurants
iTRA    Transport Services
iELC    Electricity Production
iTRD    Electricity Transmission Services
iCOA    Coal Extraction
iCOI    Crude Oil Extraction
iNG     Natural Gas Extraction
*New sectors
iH2S    H2 SMR Production
iH2E    H2 Electrolysis Production
iH2C    H2 SMR+CCS Production
/;

set secout /
iAGRI
iINDU
iCOAL
iCOIL
iTRDI
iNGAS
iSERV
iHOTL
iTRAN
iELCE
iH2
/;

set com /
pAGR   Products of Agriculture
pBIO   Biofuels
pIND   Products of Industry
pALU   Products of Aluminum
pSER   Services
pHOT   Hotels and Restaurants services
pTRA   Transport
pELE   Electricity
pTRD   Electricity Transmission
pOIL   Crude Oil
pNG    Natural Gas
pCOA   Coal
pFUL   Fuels
* new commodities
pH2    Hydrogen
/;

set comout /
pAGRI
pINDU
pALUM
pSERV
pHOTL
pTRAN
pELEC
pTRDI
pOIL
pNG
pCOA
pFUL
pH2
/;


set GWsec(sec) sectors hit by effects of global warming /
iAGR
iIND
iTRA
iCOA
iCOI
iNG
/;

parameter ENC(comout);
ENC(comout)=0;
ENC('pOIL')=1;
ENC('pNG')=1;
ENC('pCOA')=1;
ENC('pFUL')=1;


parameter worldcom(com);
worldcom(com)=0;
worldcom("pOIL")=1;
worldcom("pNG")=1;
worldcom("pCOA")=1;

* mapping original sectors and selected aggregations
set maps(sec0,sec)/
AAGR.iAGR
FISH.iAGR
COAL.iCOA
COIL.iCOI
IMIN.iIND
IRES.iIND
IALA.iALU
POWF.iELC
POWR.iELC
POWT.iTRD
NG.iNG
LTH.iIND
COTH.iSER
CCON.iIND
CWSR.iSER
COFF.iSER
C_TRAI.iTRA
C_TLND.iTRA
C_TPIP.iTRA
C_TWAS.iTRA
C_TWAI.iTRA
C_TAIR.iTRA
CHEA.iSER
Waste.iSER
BIO.iAGR
IFB.iIND
IFURS.iIND
IRECO.iSER
IMACH.iIND
ITRUC.iIND
IFURN.iIND
CHOTL.iHOT
CFIN.iSER
CRESER.iSER
CEDU.iSER
/;


* mapping original commodities and selected aggregations
set mapc(com0,com)/
c-AAGR.pAGR
c-FISH.pAGR
c-IMIN.pIND
c-IRES.pIND
c-NG.pNG
c-BIO.pBIO
c-POWF.pELE
c-POWR.pELE
c-POWT.pTRD
c-LTH.pIND
c-COTH.pSER
c-CCON.pIND
c-CWSR.pSER
c-COFF.pSER
c-C_TRAI.pTRA
c-C_TLND.pTRA
c-C_TPIP.pTRA
c-CHEA.pSER
c-Waste.pSER
c-COAL.pCOA
c-CRUDE-OIL.pOIL
c-GASE.pNG
c-OIL-GSL.pFUL
c-OIL-JET.pFUL
c-OIL-KER.pFUL
c-OIL-DSL.pFUL
c-OIL-HDI.pFUL
c-OIL-LDSF.pFUL
c-IMEA.pALU
c-C_TWAS.pTRA
c-C_TWAI.pTRA
c-C_TAIR.pTRA
c-COIL.pOIL
C-FB.pIND
C-FURS.pIND
C-RECO.pSER
C-MOTO.pFUL
C-MACH.pIND
C-TRUC.pIND
C-FURN.pIND
C-HOTL.pHOT
C-FIN.pSER
C-RESER.pSER
C-EDU.pSER
/;

set maps2(sec,secout) /
iAGR        .        iAGRI
iIND        .        iINDU
iSER        .        iSERV
iHOT        .        iHOTL
iTRA        .        iTRAN
iELC        .        iELCE
iTRD        .        iTRDI
iCOA        .        iCOAL
iCOI        .        iCOIL
iNG         .        iNGAS
iH2S        .        iH2
iH2E        .        iH2
iH2C        .        iH2
/;

set mapc2(com,comout) /
pAGR        .        pAGRI
pIND        .        pINDU
pALU        .        pALUM
pSER        .        pSERV
pHOT        .        pHOTL
pTRA        .        pTRAN
pELE        .        pELEC
pTRD        .        pTRDI
pOIL        .        pOIL
pNG         .        pNG
pCOA        .        pCOA
pFUL        .        pFUL
pH2         .        pH2
/;

* resource sectors
set ressecs(sec) /
iCOI
iCOA
iNG
/;

* industrial sectors
set indsecs(sec) /
iIND
/;

* services sectors
set servsecs(sec) /
iSER
iHOT
/;

* transport sectors
set trasecs(sec) /
iTRA
/;

set ensecs(sec) /
iELC
iCOA
iCOI
iNG
iH2S
iH2E
iH2C
/;

* power sectors
set powsecs(sec)
/
iELC
/;

* industrial commodities
set indcoms(com)
/
pIND
pALU
/;

* industrial commodities
set sercoms(com)
/
pSER
pHOT
/;


* fossil fuels
set fosfuels(com) /
pOIL
pNG
pCOA
pFUL
/;


* energy commodities
set energy(com) /
pNG
pCOA
pFUL
pELE
pH2
pOIL
/;



set materials(com) /
pAGR
pALU
pIND
pSER
pHOT
pTRA
pTRD
/;


* fossil fuels identifier
parameter FF(com);
FF(com)=0;
FF(fosfuels)=1;


Parameter PID(com);
PID(com) = 0;

*PID('gpof') = 2;
PID('pELE') = 2;
PID('pTRD') = 4;
PID('pCOA') = 1;
PID('pNG')  = 1;
PID('pOIL') = 1;
PID('pFUL') = 1;
PID('pTRA') = 3;
PID('pH2')  = 1;


* assign the new sector with zero activity in the benchmark
XDDZ(cnt,"iH2S","pH2") = 0 ;
XDDZ(cnt,"iH2C","pH2") = 0 ;
XDDZ(cnt,"iH2E","pH2") = 0 ;



Parameter SID(sec);
Parameter FID(com);
FID(com) = 0;
FID('pNG') = 1;
FID('pELE') = 2;
FID('pFUL') = 1;
FID('pTRD') = 2;
FID('pOIL') = 1;
FID('pCOA') = 1;
FID('pTRA') = 3;
FID('pH2')=1;

SID(sec) = 0;
* SECTORS THAT UNDERGO TRANSITION (UNDER TAG "T")
SID('iTRA') = 3;
SID('iAGR') = 3;
SID('iIND') = 3;
SID('iALU') = 3;
*SID('iELCF') = 3;
SID('iELC') = 3;
SID('iTRD') = 3;
SID('iSER') = 3;
SID('iHOT') = 3;
SID('iCOI') = 3;
SID('iNG') = 3;

*SID('i-H2') = 3;

Parameter TID(sec),CID(com);

TID(sec) = 0;
CID(com)=0;

TID('iTRA') = 3;
* commodities that are in newshare at the beginning (time 2)
*CID('gPOR')=1;
CID('pELE')=1;
CID('pTRD')=1;
CID('pOIL')=1;
CID('pFUL')=1;
CID('pCOA')=1;
CID('pNG')=1;
CID('pH2')=1;


* New sectors structure
* H2 production pg 16   and pg 41
parameter InputCom(sec,com) New sectors input
/
iH2S.pSER   0.2
iH2S.pIND   0.58
iH2S.pNG    0.76
iH2C.pSER   0.2
iH2C.pIND   0.58
iH2C.pNG    0.76
iH2C.pELE    0.4
iH2E.pSER   0.1
iH2E.pELE   3.46
iH2E.pIND   0.02
/;

* ======================= UPGRADE ELASTICITIES =================================

*elasticities for new sectors
ELAS("iH2S","KL")=0.3;
ELAS("iH2S","KLE")=0.1;
ELAS("iH2S","KLEM")=0.1;
ELAS("iH2C","KL")=0.3;
ELAS("iH2C","KLE")=0.1;
ELAS("iH2C","KLEM")=0.1;
ELAS("iH2E","KL")=0.3;
ELAS("iH2E","KLE")=0.1;
ELAS("iH2E","KLEM")=0.1;

* rate of return for recoursive dynamic model
parameter ror(cnt) return on capital (non-temporal measure) /
AT        0.064750563
BE        0.089533446
BG        0.136334302
CY        0.106362307
CZ        0.060507687
DE        0.063182178
DK        0.057037486
EE        0.106545872
ES        0.091810948
FI        0.071815675
FR        0.077219314
GR        0.063228241
HU        0.049390369
IE        0.127667441
IT        0.077656774
LT        0.060549631
LU        0.062262071
LV        0.086238967
MT        0.089632201
NL        0.064158495
PL        0.073664362
PT        0.113106184
RO        0.253896301
SE        0.096012898
SI        0.233838599
SK        0.079693654
GB        0.052138654
CH        0.061020907
NO        0.063209706
/;


* Definition of CO2 final emissions
* ================ CPD - COUNTERFACTUAL POLICY DEFINITION =====================
$ontext
parameter finCO2(cnt) final percentage by country /
AT        0.18
BE        0.18
BG        0.18
CY        1
CZ        0.18
DE        0.18
DK        0.18
EE        0.18
ES        0.18
FI        0.18
FR        0.18
GR        0.18
HU        0.18
IE        0.18
IT        0.18
LT        0.18
LU        1
LV        1
MT        1
NL        0.18
PL        0.18
PT        0.18
RO        0.18
SE        0.18
SI        0.18
SK        0.18
GB        0.18
CH        0.18
NO        0.18
/;
$offtext
parameter finCO2(cnt);
finCO2(cnt)=carbonbudget;
*finCO2("CY")=1;
*finCO2("LU")=1;
*finCO2("LV")=1;
*finCO2("MT")=1;

* calibration values to obtain baseline GDP
* data before 2015
parameter GDPcal(cnt) gdp calibration;
GDPcal(cnt)=1;

* This works on GDv1 scenario
* data after 2015
parameter GDPcal2(cnt) gdp calibration;
GDPcal2(cnt)=1;


* calibratiom values to obtain baseline GDP
* this works on the case with only GDP growth witout any other shock
parameter GDPcalBase(cnt) gdp calibration;
GDPcalBase(cnt)=1;

parameter TotFacProd(cnt,sec) Sectoral related Total factor of productivity/
AT        .        iAGR        0.005040135540
AT        .        iIND        0.000793275805
AT        .        iALU        0.000879559927
AT        .        iSER        -0.004186605220
AT        .        iHOT        -0.004820296832
AT        .        iTRA        0.023043134238
AT        .        iELC        0.023043134238
AT        .        iTRD        0.031316223673
AT        .        iCOA        0.031316223673
AT        .        iCOI        0.031316223673
AT        .        iNG        0.004287161756
AT        .        iH2E        0.004066325329
AT        .        iH2S        0.005292938177
AT        .        iH2C        0.009737627019
BE        .        iAGR        0.016106118066
BE        .        iIND        0.008211122552
BE        .        iALU        -0.007673898670
BE        .        iSER        0.014173460342
BE        .        iHOT        -0.011106440401
BE        .        iTRA        -0.015546048207
BE        .        iELC        -0.002038093242
BE        .        iTRD        0.010084108344
BE        .        iCOA        0.010084108344
BE        .        iCOI        0.010084108344
BE        .        iNG        0.001954260294
BE        .        iH2E        0.001888451142
BE        .        iH2S        0.012885983761
BE        .        iH2C        0.002272188984
BG        .        iAGR        0.004313668264
BG        .        iIND        0.007501276491
BG        .        iALU        0.007501276491
BG        .        iSER        0.003089686422
BG        .        iHOT        0.003089686422
BG        .        iTRA        0.003089686422
BG        .        iELC        -0.000077137200
BG        .        iTRD        -0.007744683500
BG        .        iCOA        0.003635890512
BG        .        iCOI        -0.001546801423
BG        .        iNG        -0.002239428007
BG        .        iH2E        0.002973246066
BG        .        iH2S        0.005955282405
BG        .        iH2C        0.003803360975
CY        .        iAGR        0.000651838860
CY        .        iIND        -0.000654187264
CY        .        iALU        0.002426113996
CY        .        iSER        0.007139970590
CY        .        iHOT        0.007139970590
CY        .        iTRA        0.007139970590
CY        .        iELC        -0.000372809875
CY        .        iTRD        0.004127857380
CY        .        iCOA        0.001541106967
CY        .        iCOI        -0.000772176574
CY        .        iNG        -0.000868336406
CY        .        iH2E        -0.000196516637
CY        .        iH2S        -0.000196516637
CY        .        iH2C        0.000951596237
CZ        .        iAGR        0.000951596237
CZ        .        iIND        0.000951596237
CZ        .        iALU        0.013079299724
CZ        .        iSER        0.003200487953
CZ        .        iHOT        0.001832964759
CZ        .        iTRA        0.003787588074
CZ        .        iELC        0.003754282388
CZ        .        iTRD        0.003114164156
CZ        .        iCOA        0.000829212142
CZ        .        iCOI        -0.003972008497
CZ        .        iNG        -0.024434871717
CZ        .        iH2E        -0.008556225179
CZ        .        iH2S        -0.003521329345
CZ        .        iH2C        0.016904315641
DE        .        iAGR        0.016904315641
DE        .        iIND        0.016904315641
DE        .        iALU        -0.000372809875
DE        .        iSER        0.004127857380
DE        .        iHOT        0.001541106967
DE        .        iTRA        -0.000772176574
DE        .        iELC        -0.000868336406
DE        .        iTRD        -0.000196516637
DE        .        iCOA        -0.000196516637
DE        .        iCOI        0.000951596237
DE        .        iNG        0.000951596237
DE        .        iH2E        0.000951596237
DE        .        iH2S        0.013079299724
DE        .        iH2C        0.003200487953
DK        .        iAGR        0.001832964759
DK        .        iIND        0.003787588074
DK        .        iALU        0.003754282388
DK        .        iSER        0.003114164156
DK        .        iHOT        0.000829212142
DK        .        iTRA        -0.003972008497
DK        .        iELC        -0.024434871717
DK        .        iTRD        -0.008556225179
DK        .        iCOA        -0.003521329345
DK        .        iCOI        0.016904315641
DK        .        iNG        0.016904315641
DK        .        iH2E        0.016904315641
DK        .        iH2S        0.008525431616
DK        .        iH2C        0.008942372366
EE        .        iAGR        0.002638973175
EE        .        iIND        0.002524506351
EE        .        iALU        -0.012580896436
EE        .        iSER        0.001063671010
EE        .        iHOT        0.001063671010
EE        .        iTRA        -0.006955446989
EE        .        iELC        -0.006955446989
EE        .        iTRD        -0.006955446989
EE        .        iCOA        0.001199128791
EE        .        iCOI        0.012498498680
EE        .        iNG        0.006960360201
EE        .        iH2E        0.013114466491
EE        .        iH2S        0.046151234334
EE        .        iH2C        0.019571071821
ES        .        iAGR        -0.038349345362
ES        .        iIND        -0.002413432932
ES        .        iALU        -0.010365842679
ES        .        iSER        -0.007338032649
ES        .        iHOT        -0.015621103725
ES        .        iTRA        -0.003924146973
ES        .        iELC        -0.003924146973
ES        .        iTRD        -0.003924146973
ES        .        iCOA        0.014077425378
ES        .        iCOI        0.007634252354
ES        .        iNG        0.007713943430
ES        .        iH2E        -0.005828853269
ES        .        iH2S        0.012170132198
ES        .        iH2C        -0.003579815451
FI        .        iAGR        -0.003579815451
FI        .        iIND        -0.004303873337
FI        .        iALU        -0.004303873337
FI        .        iSER        -0.004303873337
FI        .        iHOT        0.000834259906
FI        .        iTRA        0.012472224594
FI        .        iELC        -0.003331465719
FI        .        iTRD        0.006165731566
FI        .        iCOA        0.007268324951
FI        .        iCOI        0.014404314497
FI        .        iNG        -0.004082616624
FI        .        iH2E        -0.021816636136
FI        .        iH2S        0.009646539118
FI        .        iH2C        -0.024409726346
FR        .        iAGR        -0.000424242996
FR        .        iIND        0.008877917715
FR        .        iALU        0.008877917715
FR        .        iSER        0.008877917715
FR        .        iHOT        0.011465175119
FR        .        iTRA        0.002054877574
FR        .        iELC        0.001552763849
FR        .        iTRD        -0.002327360152
FR        .        iCOA        0.002544145808
FR        .        iCOI        -0.010269407396
FR        .        iNG        -0.010269407396
FR        .        iH2E        0.026991351678
FR        .        iH2S        0.026991351678
FR        .        iH2C        0.026991351678
GR        .        iAGR        0.004044719244
GR        .        iIND        0.003607502372
GR        .        iALU        0.017523126292
GR        .        iSER        0.009749333124
GR        .        iHOT        0.004892651712
GR        .        iTRA        0.005261658464
GR        .        iELC        0.003400884353
GR        .        iTRD        0.024848705178
GR        .        iCOA        -0.009872036044
GR        .        iCOI        0.003619408862
GR        .        iNG        -0.010578682151
GR        .        iH2E        -0.008147605088
GR        .        iH2S        -0.008147605088
GR        .        iH2C        -0.008147605088
HU        .        iAGR        -0.000466210463
HU        .        iIND        0.005407096129
HU        .        iALU        0.006711254254
HU        .        iSER        0.001648960068
HU        .        iHOT        0.002514076943
HU        .        iTRA        0.001469085422
HU        .        iELC        0.001469085422
HU        .        iTRD        0.002304584566
HU        .        iCOA        0.002304584566
HU        .        iCOI        0.002304584566
HU        .        iNG        0.002007184605
HU        .        iH2E        0.003203030443
HU        .        iH2S        0.001337751906
HU        .        iH2C        0.003395025565
IE        .        iAGR        -0.002392135258
IE        .        iIND        0.002560801290
IE        .        iALU        0.004388039007
IE        .        iSER        -0.012289108753
IE        .        iHOT        -0.032496506523
IE        .        iTRA        -0.006505751914
IE        .        iELC        -0.000919373497
IE        .        iTRD        0.007392139916
IE        .        iCOA        0.007392139916
IE        .        iCOI        0.007392139916
IE        .        iNG        -0.000372809875
IE        .        iH2E        0.004127857380
IE        .        iH2S        0.001541106967
IE        .        iH2C        -0.000772176574
IT        .        iAGR        -0.000868336406
IT        .        iIND        -0.000196516637
IT        .        iALU        -0.000196516637
IT        .        iSER        0.000951596237
IT        .        iHOT        0.000951596237
IT        .        iTRA        0.000951596237
IT        .        iELC        0.013079299724
IT        .        iTRD        0.003200487953
IT        .        iCOA        0.001832964759
IT        .        iCOI        0.003787588074
IT        .        iNG        0.003754282388
IT        .        iH2E        0.003114164156
IT        .        iH2S        0.000829212142
IT        .        iH2C        -0.003972008497
LT        .        iAGR        -0.024434871717
LT        .        iIND        -0.008556225179
LT        .        iALU        -0.003521329345
LT        .        iSER        0.016904315641
LT        .        iHOT        0.016904315641
LT        .        iTRA        0.016904315641
LT        .        iELC        -0.000221515776
LT        .        iTRD        0.006069375452
LT        .        iCOA        0.003328264758
LT        .        iCOI        -0.002377528758
LT        .        iNG        0.003261241084
LT        .        iH2E        0.008818931265
LT        .        iH2S        0.008818931265
LT        .        iH2C        -0.012108298605
LU        .        iAGR        -0.012108298605
LU        .        iIND        -0.012108298605
LU        .        iALU        0.009807347498
LU        .        iSER        -0.004440482874
LU        .        iHOT        0.001370868270
LU        .        iTRA        0.006418877392
LU        .        iELC        -0.003933706469
LU        .        iTRD        -0.004023128904
LU        .        iCOA        0.001736436539
LU        .        iCOI        0.002643366508
LU        .        iNG        -0.006563732270
LU        .        iH2E        -0.006570392245
LU        .        iH2S        -0.027839084155
LU        .        iH2C        0.004531306893
LV        .        iAGR        0.004531306893
LV        .        iIND        0.004531306893
LV        .        iALU        0.001316274533
LV        .        iSER        0.002828319922
LV        .        iHOT        0.002439864935
LV        .        iTRA        -0.000831252190
LV        .        iELC        0.001388563563
LV        .        iTRD        0.005835296240
LV        .        iCOA        0.005835296240
LV        .        iCOI        0.010892279177
LV        .        iNG        0.010892279177
LV        .        iH2E        0.010892279177
LV        .        iH2S        -0.000365872613
LV        .        iH2C        -0.001128793263
MT        .        iAGR        0.001854461485
MT        .        iIND        -0.001930360197
MT        .        iALU        0.012320053300
MT        .        iSER        0.001881977747
MT        .        iHOT        0.002726798327
MT        .        iTRA        0.004075278560
MT        .        iELC        0.002865667538
MT        .        iTRD        -0.006087964440
MT        .        iCOA        -0.005097510835
MT        .        iCOI        0.000656908002
MT        .        iNG        0.000656908002
MT        .        iH2E        0.000656908002
MT        .        iH2S        0.000863311414
MT        .        iH2C        -0.005729962825
NL        .        iAGR        -0.001024041691
NL        .        iIND        -0.000355282312
NL        .        iALU        0.000039951484
NL        .        iSER        0.004020539609
NL        .        iHOT        0.004020539609
NL        .        iTRA        0.001916547021
NL        .        iELC        0.001916547021
NL        .        iTRD        0.001916547021
NL        .        iCOA        -0.014047303362
NL        .        iCOI        0.003305243734
NL        .        iNG        0.003133049850
NL        .        iH2E        0.001312029334
NL        .        iH2S        0.001488814983
NL        .        iH2C        -0.005957719361
PL        .        iAGR        0.001205579640
PL        .        iIND        -0.003566378117
PL        .        iALU        0.002953903804
PL        .        iSER        0.004475486148
PL        .        iHOT        0.001621704984
PL        .        iTRA        0.000011589056
PL        .        iELC        0.000011589056
PL        .        iTRD        0.000011589056
PL        .        iCOA        -0.001478202281
PL        .        iCOI        0.002905613426
PL        .        iNG        0.001308553357
PL        .        iH2E        -0.001321745069
PL        .        iH2S        -0.001196589688
PL        .        iH2C        -0.000687950650
PT        .        iAGR        -0.000687950650
PT        .        iIND        0.001354969892
PT        .        iALU        0.001354969892
PT        .        iSER        0.001354969892
PT        .        iHOT        0.019211664173
PT        .        iTRA        0.002475044146
PT        .        iELC        0.000602298222
PT        .        iTRD        0.001230694842
PT        .        iCOA        -0.003806126220
PT        .        iCOI        0.000141509537
PT        .        iNG        0.004359385385
PT        .        iH2E        -0.007442506144
PT        .        iH2S        -0.034385476289
PT        .        iH2C        -0.006118163971
RO        .        iAGR        -0.000137106511
RO        .        iIND        0.025559385032
RO        .        iALU        0.025559385032
RO        .        iSER        0.025559385032
RO        .        iHOT        -0.000372809875
RO        .        iTRA        0.004127857380
RO        .        iELC        0.001541106967
RO        .        iTRD        -0.000772176574
RO        .        iCOA        -0.000868336406
RO        .        iCOI        -0.000196516637
RO        .        iNG        -0.000196516637
RO        .        iH2E        0.000951596237
RO        .        iH2S        0.000951596237
RO        .        iH2C        0.000951596237
SE        .        iAGR        0.013079299724
SE        .        iIND        0.003200487953
SE        .        iALU        0.001832964759
SE        .        iSER        0.003787588074
SE        .        iHOT        0.003754282388
SE        .        iTRA        0.003114164156
SE        .        iELC        0.000829212142
SE        .        iTRD        -0.003972008497
SE        .        iCOA        -0.024434871717
SE        .        iCOI        -0.008556225179
SE        .        iNG        -0.003521329345
SE        .        iH2E        0.016904315641
SE        .        iH2S        0.016904315641
SE        .        iH2C        0.016904315641
SI        .        iAGR        -0.000372809875
SI        .        iIND        0.004127857380
SI        .        iALU        0.001541106967
SI        .        iSER        -0.000772176574
SI        .        iHOT        -0.000868336406
SI        .        iTRA        -0.000196516637
SI        .        iELC        -0.000196516637
SI        .        iTRD        0.000951596237
SI        .        iCOA        0.000951596237
SI        .        iCOI        0.000951596237
SI        .        iNG        0.013079299724
SI        .        iH2E        0.003200487953
SI        .        iH2S        0.001832964759
SI        .        iH2C        0.003787588074
SK        .        iAGR        0.003754282388
SK        .        iIND        0.003114164156
SK        .        iALU        0.000829212142
SK        .        iSER        -0.003972008497
SK        .        iHOT        -0.024434871717
SK        .        iTRA        -0.008556225179
SK        .        iELC        -0.003521329345
SK        .        iTRD        0.016904315641
SK        .        iCOA        0.016904315641
SK        .        iCOI        0.016904315641
SK        .        iNG        -0.000372809875
SK        .        iH2E        0.004127857380
SK        .        iH2S        0.001541106967
SK        .        iH2C        -0.000772176574
GB        .        iAGR        -0.000868336406
GB        .        iIND        -0.000196516637
GB        .        iALU        -0.000196516637
GB        .        iSER        0.000951596237
GB        .        iHOT        0.000951596237
GB        .        iTRA        0.000951596237
GB        .        iELC        0.013079299724
GB        .        iTRD        0.003200487953
GB        .        iCOA        0.001832964759
GB        .        iCOI        0.003787588074
GB        .        iNG        0.003754282388
GB        .        iH2E        0.003114164156
GB        .        iH2S        0.000829212142
GB        .        iH2C        -0.003972008497
CH        .        iAGR        -0.024434871717
CH        .        iIND        -0.008556225179
CH        .        iALU        -0.003521329345
CH        .        iSER        0.016904315641
CH        .        iHOT        0.016904315641
CH        .        iTRA        0.016904315641
CH        .        iELC        0.002809443754
CH        .        iTRD        0.004700311202
CH        .        iCOA        0.004954262979
CH        .        iCOI        0.002917447915
CH        .        iNG        0.000503257697
CH        .        iH2E        -0.006753416332
CH        .        iH2S        -0.006753416332
CH        .        iH2C        0.007927273443
NO        .        iAGR        0.007927273443
NO        .        iIND        0.007927273443
NO        .        iALU        0.004954262979
NO        .        iSER        0.004896770618
NO        .        iHOT        0.004000659751
NO        .        iTRA        0.004954262979
NO        .        iELC        0.004954262979
NO        .        iTRD        0.004954262979
NO        .        iCOA        0.002990432911
NO        .        iCOI        0.005373171582
NO        .        iNG        -0.019075743945
NO        .        iH2E        -0.012515969342
NO        .        iH2S        -0.001812141084
NO        .        iH2C        -0.002551058032
/;

parameter CFac(cnt) sharing of Total Factor Productivity loss per sector /
AT        -0.0103598771640909
BE        -0.0162224112133587
BG        -0.0172313490173215
CY        0.000101815202306846
CZ        -0.0146672631188052
DE        -0.0201202202601296
DK        -0.0122373156932342
EE        -0.0171509601247557
ES        -0.00800653362975483
FI        -0.00500631396216646
FR        -0.0156192519684724
GR        -0.0236922332976359
HU        -0.0203085627634297
IE        0.00200144885096595
IT        -0.00605397232085474
LT        -0.0211550751863434
LU        -0.00124046474549672
LV        -0.0172499604837515
MT        -0.010052950168899
NL        -0.0120235840926234
PL        -0.0114277461565109
PT        -0.0126502839428826
RO        -0.0417693805207371
SE        -0.0151933090354807
SI        -0.014175252133356
SK        -0.013070582583334
GB        -0.00407737837513232
CH        -0.0159941448260804
NO        -0.00196210747991356
/;


set nonpoll(sec) nonpolluting sectors /
iH2C
/;

* ================ AIR POLLUTANTS - SECTOR MAPPING (EDGAR) ====================
* ---- In plain words ----------------------------------------------------------------------
* Here we say which industries of the model cause the pollution that does not come from
* burning fuel: farming, industrial processes, solvents, mining and gas leaks, waste and
* road dust. These choices depend on how the model groups its industries, so they are
* kept in this file and not in the main model file.
* -------------------------------------------------------------------------------------------
* See README_AirPollutants.md. The EDGAR source codes (apsrc) are defined in
* AirPollutants2007.gms, which REMES_Base.gms includes before this file.
* activity-related EDGAR sources mapped to sectors; a source mapped to several sectors
* is split by benchmark output XDZ. Every source in apact must appear here.
*   EDGAR activity source -> model sector(s); several sectors share the source by output
set mapAPs(apsrc,sec) activity-related EDGAR sources mapped to REMES sectors /
*   road dust resuspended by traffic -> transport
'1.A.3.b_RES'.iTRA
*   fugitive emissions from solid fuels (coal mining, coke ovens) -> coal extraction
'1.B.1'.iCOA
*   fugitive emissions from oil and gas -> crude oil and natural gas extraction
'1.B.2'.(iCOI,iNG)
*   industrial processes: minerals (2.A), chemicals (2.B), solvents (2.D), other product use (2.G),
*   pulp and paper, food and beverages (2.H) -> industry
('2.A.1','2.A.2','2.A.3','2.A.4','2.B','2.D','2.G','2.H').iIND
*   metal production (2.C) -> industry and aluminium
'2.C'.(iIND,iALU)
*   agriculture: manure (3.A.2), residue burning (3.C.1), liming (3.C.2), managed soils/fertilisers (3.C.4), rice (3.C.7)
('3.A.2','3.C.1','3.C.2','3.C.4','3.C.7').iAGR
*   waste: disposal, biological treatment, incineration, waste water (4.A-4.D) -> services
('4.A','4.B','4.C','4.D').iSER
*   end of the list
/;

* ---- In plain words ----------------------------------------------------------------------
* Here we name the industry that takes the pollution of a source when none of its
* industries exists in a country (e.g. coke ovens in a country without coal mining).
* -------------------------------------------------------------------------------------------
* sector receiving the activity emissions of a source whose mapped sectors have no output
*   one sector only (singleton): rest of industry
singleton set APfbsec(sec) fallback sector for activity-related emissions / iIND /;

* ---- In plain words ----------------------------------------------------------------------
* Here the new hydrogen industries, which do not exist in the starting year, are told to
* use the pollution per unit of fuel of the natural gas industry, as they do for CO2.
* -------------------------------------------------------------------------------------------
* sectors without benchmark fuel use that take the combustion emission factors APr of
* another sector (hydrogen from SMR and electrolysis: natural gas sector, as CO2r)
set mapAPr(sec,sec) sector (first) taking the combustion factors of sector (second) /
*   hydrogen from steam methane reforming <- natural gas sector
iH2S.iNG
*   hydrogen from electrolysis <- natural gas sector
iH2E.iNG
*   end of the list
/;

* ---- In plain words ----------------------------------------------------------------------
* Here we name the commodity of the model that stands for biofuels (wood, pellets, liquid
* biofuels). When the biofuel switch APbio is on, the pollution from burning biofuels is
* charged to this commodity.
* -------------------------------------------------------------------------------------------
* bio fuel commodity carrying the bio part of the EDGAR combustion emissions (APbio = 1
* in REMES_Base.gms); it gets combustion factors APr and permit lines like a fossil fuel
*   the granular C-BIO of the SAM maps to it through mapc (checked by an abort in REMES_Base.gms)
set APbiocom(com) bio fuel commodities with air pollutant emission factors / pBIO /;



* ================ CPD - COUNTERFACTUAL POLICY DEFINITION =====================
* growth of land use
parameter LandGrowth(cnt) 5 year land growth rate /
AT        0.138111229
BE        0.266441895
BG        0.336005748
CH        0.245966987
CY        0.53514481
CZ        0.313588857
DE        0.262087695
DK        0.337924053
EE        0.574071693
FI        0.280064776
FR        0.321284907
GR        0.370655046
HU        0.504724073
IE        0.471565163
IT        0.236370753
LV        0.293095751
LT        0.567068177
LU        0.143335207
MT        0.655050653
NL        0.487332752
PL        0.541141177
PT        0.234034764
RO        0.28126186
SK        0.294977163
SI        0.108682411
ES        0.270714647
SE        0.208998247
GB        0.45782146
NO        0.107295791
/;

* PRC0 data comes from the file Scenario_emissions from TNO using Kaya identity.
parameter PRC0(cnt) 5yr compound productivity /
AT                 0.0539
BE                 0.0415
BG                 0.1098
CY                 0.0532
CZ                 0.0744
DE                 0.0618
DK                 0.0617
EE                 0.1031
ES                 0.0607
FI                 0.0457
FR                 0.0520
GR                 0.0506
HU                 0.0828
IE                 0.0547
IT                 0.0350
LT                 0.1282
LU                 0.0337
LV                 0.1324
MT                 0.0782
NL                 0.0498
PL                 0.1158
PT                 0.0630
RO                 0.1080
SE                 0.0653
SI                 0.0621
SK                 0.1128
GB                 0.0521
CH                 0.0350
NO                 0.0635
/;


parameter PRC1(cnt) 5yr compound productivity counterfactual /
AT                 0.0539
BE                 0.0415
BG                 0.1098
CY                 0.0532
CZ                 0.0744
DE                 0.0618
DK                 0.0617
EE                 0.1031
ES                 0.0607
FI                 0.0457
FR                 0.0520
GR                 0.0506
HU                 0.0828
IE                 0.0547
IT                 0.0350
LT                 0.1282
LU                 0.0337
LV                 0.1324
MT                 0.0782
NL                 0.0498
PL                 0.1158
PT                 0.0630
RO                 0.1080
SE                 0.0653
SI                 0.0621
SK                 0.1128
GB                 0.0521
CH                 0.0350
NO                 0.0635
/;

parameter PRC2(cnt) 5yr compound productivity counterfactual /
AT        0.124030379
BE        0.111005386
BG        0.182928235
CY        0.123343821
CZ        0.145618268
DE        0.13235938
DK        0.132278715
EE        0.175777311
ES        0.131184043
FI        0.115440992
FR        0.122050115
GR        0.120526516
HU        0.154444103
IE        0.124867571
IT        0.104082756
LT        0.202188116
LU        0.102735183
LV        0.206635695
MT        0.149646384
NL        0.119713656
PL        0.189205011
PT        0.133656995
RO        0.180936351
SE        0.136007663
SI        0.132674202
SK        0.186010378
GB        0.122112657
CH        0.104082756
NO        0.141626523
/;


* from file emis_assumptions.xlsx
parameter cint0(cnt,sec)  carbon intensity change per year until 2025 /
AT        .        iAGR        0.970275294
BE        .        iAGR        0.983348248
BG        .        iAGR        0.941278696
CY        .        iAGR        0.972125273
CZ        .        iAGR        0.963242891
DE        .        iAGR        0.974985292
DK        .        iAGR        0.952937157
EE        .        iAGR        0.96391429
ES        .        iAGR        0.974635216
FI        .        iAGR        0.975100262
FR        .        iAGR        0.973061228
GR        .        iAGR        0.97195345
HU        .        iAGR        0.96487356
IE        .        iAGR        0.928945047
IT        .        iAGR        0.97259731
LT        .        iAGR        0.963464412
LU        .        iAGR        0.960870741
LV        .        iAGR        0.980271733
MT        .        iAGR        0.898118811
NL        .        iAGR        0.971676787
PL        .        iAGR        0.965045469
PT        .        iAGR        0.973139618
RO        .        iAGR        1
SE        .        iAGR        0.957718396
SI        .        iAGR        0.967050067
SK        .        iAGR        0.969682125
GB        .        iAGR        0.955543894
CH        .        iAGR        0.970275294
NO        .        iAGR        0.952937157
AT        .        iIND        0.970275294
BE        .        iIND        0.983348248
BG        .        iIND        0.941278696
CY        .        iIND        0.972125273
CZ        .        iIND        0.963242891
DE        .        iIND        0.974985292
DK        .        iIND        0.952937157
EE        .        iIND        0.96391429
ES        .        iIND        0.974635216
FI        .        iIND        0.975100262
FR        .        iIND        0.973061228
GR        .        iIND        0.97195345
HU        .        iIND        0.96487356
IE        .        iIND        0.928945047
IT        .        iIND        0.97259731
LT        .        iIND        0.963464412
LU        .        iIND        0.960870741
LV        .        iIND        0.980271733
MT        .        iIND        0.898118811
NL        .        iIND        0.971676787
PL        .        iIND        0.965045469
PT        .        iIND        0.973139618
RO        .        iIND        1
SE        .        iIND        0.957718396
SI        .        iIND        0.967050067
SK        .        iIND        0.969682125
GB        .        iIND        0.955543894
CH        .        iIND        0.970275294
NO        .        iIND        0.952937157
AT        .        iALU        0.970275294
BE        .        iALU        0.983348248
BG        .        iALU        0.941278696
CY        .        iALU        0.972125273
CZ        .        iALU        0.963242891
DE        .        iALU        0.974985292
DK        .        iALU        0.952937157
EE        .        iALU        0.96391429
ES        .        iALU        0.974635216
FI        .        iALU        0.975100262
FR        .        iALU        0.973061228
GR        .        iALU        0.97195345
HU        .        iALU        0.96487356
IE        .        iALU        0.928945047
IT        .        iALU        0.97259731
LT        .        iALU        0.963464412
LU        .        iALU        0.960870741
LV        .        iALU        0.980271733
MT        .        iALU        0.898118811
NL        .        iALU        0.971676787
PL        .        iALU        0.965045469
PT        .        iALU        0.973139618
RO        .        iALU        1
SE        .        iALU        0.957718396
SI        .        iALU        0.967050067
SK        .        iALU        0.969682125
GB        .        iALU        0.955543894
CH        .        iALU        0.970275294
NO        .        iALU        0.952937157
AT        .        iSER        0.970275294
BE        .        iSER        0.983348248
BG        .        iSER        0.941278696
CY        .        iSER        0.972125273
CZ        .        iSER        0.963242891
DE        .        iSER        0.974985292
DK        .        iSER        0.952937157
EE        .        iSER        0.96391429
ES        .        iSER        0.974635216
FI        .        iSER        0.975100262
FR        .        iSER        0.973061228
GR        .        iSER        0.97195345
HU        .        iSER        0.96487356
IE        .        iSER        0.928945047
IT        .        iSER        0.97259731
LT        .        iSER        0.963464412
LU        .        iSER        0.960870741
LV        .        iSER        0.980271733
MT        .        iSER        0.898118811
NL        .        iSER        0.971676787
PL        .        iSER        0.965045469
PT        .        iSER        0.973139618
RO        .        iSER        1
SE        .        iSER        0.957718396
SI        .        iSER        0.967050067
SK        .        iSER        0.969682125
GB        .        iSER        0.955543894
CH        .        iSER        0.970275294
NO        .        iSER        0.952937157
AT        .        iHOT        0.970275294
BE        .        iHOT        0.983348248
BG        .        iHOT        0.941278696
CY        .        iHOT        0.972125273
CZ        .        iHOT        0.963242891
DE        .        iHOT        0.974985292
DK        .        iHOT        0.952937157
EE        .        iHOT        0.96391429
ES        .        iHOT        0.974635216
FI        .        iHOT        0.975100262
FR        .        iHOT        0.973061228
GR        .        iHOT        0.97195345
HU        .        iHOT        0.96487356
IE        .        iHOT        0.928945047
IT        .        iHOT        0.97259731
LT        .        iHOT        0.963464412
LU        .        iHOT        0.960870741
LV        .        iHOT        0.980271733
MT        .        iHOT        0.898118811
NL        .        iHOT        0.971676787
PL        .        iHOT        0.965045469
PT        .        iHOT        0.973139618
RO        .        iHOT        1
SE        .        iHOT        0.957718396
SI        .        iHOT        0.967050067
SK        .        iHOT        0.969682125
GB        .        iHOT        0.955543894
CH        .        iHOT        0.970275294
NO        .        iHOT        0.952937157
AT        .        iTRA        0.970275294
BE        .        iTRA        0.983348248
BG        .        iTRA        0.941278696
CY        .        iTRA        0.972125273
CZ        .        iTRA        0.963242891
DE        .        iTRA        0.974985292
DK        .        iTRA        0.952937157
EE        .        iTRA        0.96391429
ES        .        iTRA        0.974635216
FI        .        iTRA        0.975100262
FR        .        iTRA        0.973061228
GR        .        iTRA        0.97195345
HU        .        iTRA        0.96487356
IE        .        iTRA        0.928945047
IT        .        iTRA        0.97259731
LT        .        iTRA        0.963464412
LU        .        iTRA        0.960870741
LV        .        iTRA        0.980271733
MT        .        iTRA        0.898118811
NL        .        iTRA        0.971676787
PL        .        iTRA        0.965045469
PT        .        iTRA        0.973139618
RO        .        iTRA        1
SE        .        iTRA        0.957718396
SI        .        iTRA        0.967050067
SK        .        iTRA        0.969682125
GB        .        iTRA        0.955543894
CH        .        iTRA        0.970275294
NO        .        iTRA        0.952937157
AT        .        iELC        0.970275294
BE        .        iELC        0.983348248
BG        .        iELC        0.941278696
CY        .        iELC        0.972125273
CZ        .        iELC        0.963242891
DE        .        iELC        0.974985292
DK        .        iELC        0.952937157
EE        .        iELC        0.96391429
ES        .        iELC        0.974635216
FI        .        iELC        0.975100262
FR        .        iELC        0.973061228
GR        .        iELC        0.97195345
HU        .        iELC        0.96487356
IE        .        iELC        0.928945047
IT        .        iELC        0.97259731
LT        .        iELC        0.963464412
LU        .        iELC        0.960870741
LV        .        iELC        0.980271733
MT        .        iELC        0.898118811
NL        .        iELC        0.971676787
PL        .        iELC        0.965045469
PT        .        iELC        0.973139618
RO        .        iELC        1
SE        .        iELC        0.957718396
SI        .        iELC        0.967050067
SK        .        iELC        0.969682125
GB        .        iELC        0.955543894
CH        .        iELC        0.970275294
NO        .        iELC        0.952937157
AT        .        iTRD        0.970275294
BE        .        iTRD        0.983348248
BG        .        iTRD        0.941278696
CY        .        iTRD        0.972125273
CZ        .        iTRD        0.963242891
DE        .        iTRD        0.974985292
DK        .        iTRD        0.952937157
EE        .        iTRD        0.96391429
ES        .        iTRD        0.974635216
FI        .        iTRD        0.975100262
FR        .        iTRD        0.973061228
GR        .        iTRD        0.97195345
HU        .        iTRD        0.96487356
IE        .        iTRD        0.928945047
IT        .        iTRD        0.97259731
LT        .        iTRD        0.963464412
LU        .        iTRD        0.960870741
LV        .        iTRD        0.980271733
MT        .        iTRD        0.898118811
NL        .        iTRD        0.971676787
PL        .        iTRD        0.965045469
PT        .        iTRD        0.973139618
RO        .        iTRD        1
SE        .        iTRD        0.957718396
SI        .        iTRD        0.967050067
SK        .        iTRD        0.969682125
GB        .        iTRD        0.955543894
CH        .        iTRD        0.970275294
NO        .        iTRD        0.952937157
AT        .        iCOA        0.970275294
BE        .        iCOA        0.983348248
BG        .        iCOA        0.941278696
CY        .        iCOA        0.972125273
CZ        .        iCOA        0.963242891
DE        .        iCOA        0.974985292
DK        .        iCOA        0.952937157
EE        .        iCOA        0.96391429
ES        .        iCOA        0.974635216
FI        .        iCOA        0.975100262
FR        .        iCOA        0.973061228
GR        .        iCOA        0.97195345
HU        .        iCOA        0.96487356
IE        .        iCOA        0.928945047
IT        .        iCOA        0.97259731
LT        .        iCOA        0.963464412
LU        .        iCOA        0.960870741
LV        .        iCOA        0.980271733
MT        .        iCOA        0.898118811
NL        .        iCOA        0.971676787
PL        .        iCOA        0.965045469
PT        .        iCOA        0.973139618
RO        .        iCOA        1
SE        .        iCOA        0.957718396
SI        .        iCOA        0.967050067
SK        .        iCOA        0.969682125
GB        .        iCOA        0.955543894
CH        .        iCOA        0.970275294
NO        .        iCOA        0.952937157
AT        .        iCOI        0.970275294
BE        .        iCOI        0.983348248
BG        .        iCOI        0.941278696
CY        .        iCOI        0.972125273
CZ        .        iCOI        0.963242891
DE        .        iCOI        0.974985292
DK        .        iCOI        0.952937157
EE        .        iCOI        0.96391429
ES        .        iCOI        0.974635216
FI        .        iCOI        0.975100262
FR        .        iCOI        0.973061228
GR        .        iCOI        0.97195345
HU        .        iCOI        0.96487356
IE        .        iCOI        0.928945047
IT        .        iCOI        0.97259731
LT        .        iCOI        0.963464412
LU        .        iCOI        0.960870741
LV        .        iCOI        0.980271733
MT        .        iCOI        0.898118811
NL        .        iCOI        0.971676787
PL        .        iCOI        0.965045469
PT        .        iCOI        0.973139618
RO        .        iCOI        1
SE        .        iCOI        0.957718396
SI        .        iCOI        0.967050067
SK        .        iCOI        0.969682125
GB        .        iCOI        0.955543894
CH        .        iCOI        0.970275294
NO        .        iCOI        0.952937157
AT        .        iNG        0.970275294
BE        .        iNG        0.983348248
BG        .        iNG        0.941278696
CY        .        iNG        0.972125273
CZ        .        iNG        0.963242891
DE        .        iNG        0.974985292
DK        .        iNG        0.952937157
EE        .        iNG        0.96391429
ES        .        iNG        0.974635216
FI        .        iNG        0.975100262
FR        .        iNG        0.973061228
GR        .        iNG        0.97195345
HU        .        iNG        0.96487356
IE        .        iNG        0.928945047
IT        .        iNG        0.97259731
LT        .        iNG        0.963464412
LU        .        iNG        0.960870741
LV        .        iNG        0.980271733
MT        .        iNG        0.898118811
NL        .        iNG        0.971676787
PL        .        iNG        0.965045469
PT        .        iNG        0.973139618
RO        .        iNG        1
SE        .        iNG        0.957718396
SI        .        iNG        0.967050067
SK        .        iNG        0.969682125
GB        .        iNG        0.955543894
CH        .        iNG        0.970275294
NO        .        iNG        0.952937157
AT        .        iH2S        0.970275294
BE        .        iH2S        0.983348248
BG        .        iH2S        0.941278696
CY        .        iH2S        0.972125273
CZ        .        iH2S        0.963242891
DE        .        iH2S        0.974985292
DK        .        iH2S        0.952937157
EE        .        iH2S        0.96391429
ES        .        iH2S        0.974635216
FI        .        iH2S        0.975100262
FR        .        iH2S        0.973061228
GR        .        iH2S        0.97195345
HU        .        iH2S        0.96487356
IE        .        iH2S        0.928945047
IT        .        iH2S        0.97259731
LT        .        iH2S        0.963464412
LU        .        iH2S        0.960870741
LV        .        iH2S        0.980271733
MT        .        iH2S        0.898118811
NL        .        iH2S        0.971676787
PL        .        iH2S        0.965045469
PT        .        iH2S        0.973139618
RO        .        iH2S        1
SE        .        iH2S        0.957718396
SI        .        iH2S        0.967050067
SK        .        iH2S        0.969682125
GB        .        iH2S        0.955543894
CH        .        iH2S        0.970275294
NO        .        iH2S        0.952937157
AT        .        iH2E        0.970275294
BE        .        iH2E        0.983348248
BG        .        iH2E        0.941278696
CY        .        iH2E        0.972125273
CZ        .        iH2E        0.963242891
DE        .        iH2E        0.974985292
DK        .        iH2E        0.952937157
EE        .        iH2E        0.96391429
ES        .        iH2E        0.974635216
FI        .        iH2E        0.975100262
FR        .        iH2E        0.973061228
GR        .        iH2E        0.97195345
HU        .        iH2E        0.96487356
IE        .        iH2E        0.928945047
IT        .        iH2E        0.97259731
LT        .        iH2E        0.963464412
LU        .        iH2E        0.960870741
LV        .        iH2E        0.980271733
MT        .        iH2E        0.898118811
NL        .        iH2E        0.971676787
PL        .        iH2E        0.965045469
PT        .        iH2E        0.973139618
RO        .        iH2E        1
SE        .        iH2E        0.957718396
SI        .        iH2E        0.967050067
SK        .        iH2E        0.969682125
GB        .        iH2E        0.955543894
CH        .        iH2E        0.970275294
NO        .        iH2E        0.952937157
AT        .        iH2C        0.970275294
BE        .        iH2C        0.983348248
BG        .        iH2C        0.941278696
CY        .        iH2C        0.972125273
CZ        .        iH2C        0.963242891
DE        .        iH2C        0.974985292
DK        .        iH2C        0.952937157
EE        .        iH2C        0.96391429
ES        .        iH2C        0.974635216
FI        .        iH2C        0.975100262
FR        .        iH2C        0.973061228
GR        .        iH2C        0.97195345
HU        .        iH2C        0.96487356
IE        .        iH2C        0.928945047
IT        .        iH2C        0.97259731
LT        .        iH2C        0.963464412
LU        .        iH2C        0.960870741
LV        .        iH2C        0.980271733
MT        .        iH2C        0.898118811
NL        .        iH2C        0.971676787
PL        .        iH2C        0.965045469
PT        .        iH2C        0.973139618
RO        .        iH2C        1
SE        .        iH2C        0.957718396
SI        .        iH2C        0.967050067
SK        .        iH2C        0.969682125
GB        .        iH2C        0.955543894
CH        .        iH2C        0.970275294
NO        .        iH2C        0.952937157
/;

*cint0(cnt,sec)=0.97;

* from file emis_assumptions.xlsx
parameter cint1(cnt,sec)  carbon intensity change per year after 2021 /
AT        .        iAGR        0.979427459
BE        .        iAGR        0.979427459
BG        .        iAGR        0.979427459
CY        .        iAGR        0.979427459
CZ        .        iAGR        0.979427459
DE        .        iAGR        0.979427459
DK        .        iAGR        0.979427459
EE        .        iAGR        0.979427459
ES        .        iAGR        0.979427459
FI        .        iAGR        0.979427459
FR        .        iAGR        0.979427459
GR        .        iAGR        0.979427459
HU        .        iAGR        0.979427459
IE        .        iAGR        0.979427459
IT        .        iAGR        0.979427459
LT        .        iAGR        0.979427459
LU        .        iAGR        0.979427459
LV        .        iAGR        0.979427459
MT        .        iAGR        0.979427459
NL        .        iAGR        0.979427459
PL        .        iAGR        0.979427459
PT        .        iAGR        0.979427459
RO        .        iAGR        0.979427459
SE        .        iAGR        0.979427459
SI        .        iAGR        0.979427459
SK        .        iAGR        0.979427459
GB        .        iAGR        0.979427459
CH        .        iAGR        0.979427459
NO        .        iAGR        0.979427459
AT        .        iIND        0.979427459
BE        .        iIND        0.979427459
BG        .        iIND        0.979427459
CY        .        iIND        0.979427459
CZ        .        iIND        0.979427459
DE        .        iIND        0.979427459
DK        .        iIND        0.979427459
EE        .        iIND        0.979427459
ES        .        iIND        0.979427459
FI        .        iIND        0.979427459
FR        .        iIND        0.979427459
GR        .        iIND        0.979427459
HU        .        iIND        0.979427459
IE        .        iIND        0.979427459
IT        .        iIND        0.979427459
LT        .        iIND        0.979427459
LU        .        iIND        0.979427459
LV        .        iIND        0.979427459
MT        .        iIND        0.979427459
NL        .        iIND        0.979427459
PL        .        iIND        0.979427459
PT        .        iIND        0.979427459
RO        .        iIND        0.979427459
SE        .        iIND        0.979427459
SI        .        iIND        0.979427459
SK        .        iIND        0.979427459
GB        .        iIND        0.979427459
CH        .        iIND        0.979427459
NO        .        iIND        0.979427459
AT        .        iALU        0.979427459
BE        .        iALU        0.979427459
BG        .        iALU        0.979427459
CY        .        iALU        0.979427459
CZ        .        iALU        0.979427459
DE        .        iALU        0.979427459
DK        .        iALU        0.979427459
EE        .        iALU        0.979427459
ES        .        iALU        0.979427459
FI        .        iALU        0.979427459
FR        .        iALU        0.979427459
GR        .        iALU        0.979427459
HU        .        iALU        0.979427459
IE        .        iALU        0.979427459
IT        .        iALU        0.979427459
LT        .        iALU        0.979427459
LU        .        iALU        0.979427459
LV        .        iALU        0.979427459
MT        .        iALU        0.979427459
NL        .        iALU        0.979427459
PL        .        iALU        0.979427459
PT        .        iALU        0.979427459
RO        .        iALU        0.979427459
SE        .        iALU        0.979427459
SI        .        iALU        0.979427459
SK        .        iALU        0.979427459
GB        .        iALU        0.979427459
CH        .        iALU        0.979427459
NO        .        iALU        0.979427459
AT        .        iSER        0.991751577
BE        .        iSER        0.991751577
BG        .        iSER        0.991751577
CY        .        iSER        0.991751577
CZ        .        iSER        0.991751577
DE        .        iSER        0.991751577
DK        .        iSER        0.991751577
EE        .        iSER        0.991751577
ES        .        iSER        0.991751577
FI        .        iSER        0.991751577
FR        .        iSER        0.991751577
GR        .        iSER        0.991751577
HU        .        iSER        0.991751577
IE        .        iSER        0.991751577
IT        .        iSER        0.991751577
LT        .        iSER        0.991751577
LU        .        iSER        0.991751577
LV        .        iSER        0.991751577
MT        .        iSER        0.991751577
NL        .        iSER        0.991751577
PL        .        iSER        0.991751577
PT        .        iSER        0.991751577
RO        .        iSER        0.991751577
SE        .        iSER        0.991751577
SI        .        iSER        0.991751577
SK        .        iSER        0.991751577
GB        .        iSER        0.991751577
CH        .        iSER        0.991751577
NO        .        iSER        0.991751577
AT        .        iHOT        0.991751577
BE        .        iHOT        0.991751577
BG        .        iHOT        0.991751577
CY        .        iHOT        0.991751577
CZ        .        iHOT        0.991751577
DE        .        iHOT        0.991751577
DK        .        iHOT        0.991751577
EE        .        iHOT        0.991751577
ES        .        iHOT        0.991751577
FI        .        iHOT        0.991751577
FR        .        iHOT        0.991751577
GR        .        iHOT        0.991751577
HU        .        iHOT        0.991751577
IE        .        iHOT        0.991751577
IT        .        iHOT        0.991751577
LT        .        iHOT        0.991751577
LU        .        iHOT        0.991751577
LV        .        iHOT        0.991751577
MT        .        iHOT        0.991751577
NL        .        iHOT        0.991751577
PL        .        iHOT        0.991751577
PT        .        iHOT        0.991751577
RO        .        iHOT        0.991751577
SE        .        iHOT        0.991751577
SI        .        iHOT        0.991751577
SK        .        iHOT        0.991751577
GB        .        iHOT        0.991751577
CH        .        iHOT        0.991751577
NO        .        iHOT        0.991751577
AT        .        iTRA        0.998567035
BE        .        iTRA        0.998567035
BG        .        iTRA        0.998567035
CY        .        iTRA        0.998567035
CZ        .        iTRA        0.998567035
DE        .        iTRA        0.998567035
DK        .        iTRA        0.998567035
EE        .        iTRA        0.998567035
ES        .        iTRA        0.998567035
FI        .        iTRA        0.998567035
FR        .        iTRA        0.998567035
GR        .        iTRA        0.998567035
HU        .        iTRA        0.998567035
IE        .        iTRA        0.998567035
IT        .        iTRA        0.998567035
LT        .        iTRA        0.998567035
LU        .        iTRA        0.998567035
LV        .        iTRA        0.998567035
MT        .        iTRA        0.998567035
NL        .        iTRA        0.998567035
PL        .        iTRA        0.998567035
PT        .        iTRA        0.998567035
RO        .        iTRA        0.998567035
SE        .        iTRA        0.998567035
SI        .        iTRA        0.998567035
SK        .        iTRA        0.998567035
GB        .        iTRA        0.998567035
CH        .        iTRA        0.998567035
NO        .        iTRA        0.998567035
AT        .        iELC        0.975588683
BE        .        iELC        0.975588683
BG        .        iELC        0.975588683
CY        .        iELC        0.975588683
CZ        .        iELC        0.975588683
DE        .        iELC        0.975588683
DK        .        iELC        0.975588683
EE        .        iELC        0.975588683
ES        .        iELC        0.975588683
FI        .        iELC        0.975588683
FR        .        iELC        0.975588683
GR        .        iELC        0.975588683
HU        .        iELC        0.975588683
IE        .        iELC        0.975588683
IT        .        iELC        0.975588683
LT        .        iELC        0.975588683
LU        .        iELC        0.975588683
LV        .        iELC        0.975588683
MT        .        iELC        0.975588683
NL        .        iELC        0.975588683
PL        .        iELC        0.975588683
PT        .        iELC        0.975588683
RO        .        iELC        0.975588683
SE        .        iELC        0.975588683
SI        .        iELC        0.975588683
SK        .        iELC        0.975588683
GB        .        iELC        0.975588683
CH        .        iELC        0.975588683
NO        .        iELC        0.975588683
AT        .        iTRD        0.991751577
BE        .        iTRD        0.991751577
BG        .        iTRD        0.991751577
CY        .        iTRD        0.991751577
CZ        .        iTRD        0.991751577
DE        .        iTRD        0.991751577
DK        .        iTRD        0.991751577
EE        .        iTRD        0.991751577
ES        .        iTRD        0.991751577
FI        .        iTRD        0.991751577
FR        .        iTRD        0.991751577
GR        .        iTRD        0.991751577
HU        .        iTRD        0.991751577
IE        .        iTRD        0.991751577
IT        .        iTRD        0.991751577
LT        .        iTRD        0.991751577
LU        .        iTRD        0.991751577
LV        .        iTRD        0.991751577
MT        .        iTRD        0.991751577
NL        .        iTRD        0.991751577
PL        .        iTRD        0.991751577
PT        .        iTRD        0.991751577
RO        .        iTRD        0.991751577
SE        .        iTRD        0.991751577
SI        .        iTRD        0.991751577
SK        .        iTRD        0.991751577
GB        .        iTRD        0.991751577
CH        .        iTRD        0.991751577
NO        .        iTRD        0.991751577
AT        .        iCOA        0.975588683
BE        .        iCOA        0.975588683
BG        .        iCOA        0.975588683
CY        .        iCOA        0.975588683
CZ        .        iCOA        0.975588683
DE        .        iCOA        0.975588683
DK        .        iCOA        0.975588683
EE        .        iCOA        0.975588683
ES        .        iCOA        0.975588683
FI        .        iCOA        0.975588683
FR        .        iCOA        0.975588683
GR        .        iCOA        0.975588683
HU        .        iCOA        0.975588683
IE        .        iCOA        0.975588683
IT        .        iCOA        0.975588683
LT        .        iCOA        0.975588683
LU        .        iCOA        0.975588683
LV        .        iCOA        0.975588683
MT        .        iCOA        0.975588683
NL        .        iCOA        0.975588683
PL        .        iCOA        0.975588683
PT        .        iCOA        0.975588683
RO        .        iCOA        0.975588683
SE        .        iCOA        0.975588683
SI        .        iCOA        0.975588683
SK        .        iCOA        0.975588683
GB        .        iCOA        0.975588683
CH        .        iCOA        0.975588683
NO        .        iCOA        0.975588683
AT        .        iCOI        0.975588683
BE        .        iCOI        0.975588683
BG        .        iCOI        0.975588683
CY        .        iCOI        0.975588683
CZ        .        iCOI        0.975588683
DE        .        iCOI        0.975588683
DK        .        iCOI        0.975588683
EE        .        iCOI        0.975588683
ES        .        iCOI        0.975588683
FI        .        iCOI        0.975588683
FR        .        iCOI        0.975588683
GR        .        iCOI        0.975588683
HU        .        iCOI        0.975588683
IE        .        iCOI        0.975588683
IT        .        iCOI        0.975588683
LT        .        iCOI        0.975588683
LU        .        iCOI        0.975588683
LV        .        iCOI        0.975588683
MT        .        iCOI        0.975588683
NL        .        iCOI        0.975588683
PL        .        iCOI        0.975588683
PT        .        iCOI        0.975588683
RO        .        iCOI        0.975588683
SE        .        iCOI        0.975588683
SI        .        iCOI        0.975588683
SK        .        iCOI        0.975588683
GB        .        iCOI        0.975588683
CH        .        iCOI        0.975588683
NO        .        iCOI        0.975588683
AT        .        iNG        0.975588683
BE        .        iNG        0.975588683
BG        .        iNG        0.975588683
CY        .        iNG        0.975588683
CZ        .        iNG        0.975588683
DE        .        iNG        0.975588683
DK        .        iNG        0.975588683
EE        .        iNG        0.975588683
ES        .        iNG        0.975588683
FI        .        iNG        0.975588683
FR        .        iNG        0.975588683
GR        .        iNG        0.975588683
HU        .        iNG        0.975588683
IE        .        iNG        0.975588683
IT        .        iNG        0.975588683
LT        .        iNG        0.975588683
LU        .        iNG        0.975588683
LV        .        iNG        0.975588683
MT        .        iNG        0.975588683
NL        .        iNG        0.975588683
PL        .        iNG        0.975588683
PT        .        iNG        0.975588683
RO        .        iNG        0.975588683
SE        .        iNG        0.975588683
SI        .        iNG        0.975588683
SK        .        iNG        0.975588683
GB        .        iNG        0.975588683
CH        .        iNG        0.975588683
NO        .        iNG        0.975588683
AT        .        iH2S        0.975588683
BE        .        iH2S        0.975588683
BG        .        iH2S        0.975588683
CY        .        iH2S        0.975588683
CZ        .        iH2S        0.975588683
DE        .        iH2S        0.975588683
DK        .        iH2S        0.975588683
EE        .        iH2S        0.975588683
ES        .        iH2S        0.975588683
FI        .        iH2S        0.975588683
FR        .        iH2S        0.975588683
GR        .        iH2S        0.975588683
HU        .        iH2S        0.975588683
IE        .        iH2S        0.975588683
IT        .        iH2S        0.975588683
LT        .        iH2S        0.975588683
LU        .        iH2S        0.975588683
LV        .        iH2S        0.975588683
MT        .        iH2S        0.975588683
NL        .        iH2S        0.975588683
PL        .        iH2S        0.975588683
PT        .        iH2S        0.975588683
RO        .        iH2S        0.975588683
SE        .        iH2S        0.975588683
SI        .        iH2S        0.975588683
SK        .        iH2S        0.975588683
GB        .        iH2S        0.975588683
CH        .        iH2S        0.975588683
NO        .        iH2S        0.975588683
AT        .        iH2E        0.975588683
BE        .        iH2E        0.975588683
BG        .        iH2E        0.975588683
CY        .        iH2E        0.975588683
CZ        .        iH2E        0.975588683
DE        .        iH2E        0.975588683
DK        .        iH2E        0.975588683
EE        .        iH2E        0.975588683
ES        .        iH2E        0.975588683
FI        .        iH2E        0.975588683
FR        .        iH2E        0.975588683
GR        .        iH2E        0.975588683
HU        .        iH2E        0.975588683
IE        .        iH2E        0.975588683
IT        .        iH2E        0.975588683
LT        .        iH2E        0.975588683
LU        .        iH2E        0.975588683
LV        .        iH2E        0.975588683
MT        .        iH2E        0.975588683
NL        .        iH2E        0.975588683
PL        .        iH2E        0.975588683
PT        .        iH2E        0.975588683
RO        .        iH2E        0.975588683
SE        .        iH2E        0.975588683
SI        .        iH2E        0.975588683
SK        .        iH2E        0.975588683
GB        .        iH2E        0.975588683
CH        .        iH2E        0.975588683
NO        .        iH2E        0.975588683
AT        .        iH2C        0.975588683
BE        .        iH2C        0.975588683
BG        .        iH2C        0.975588683
CY        .        iH2C        0.975588683
CZ        .        iH2C        0.975588683
DE        .        iH2C        0.975588683
DK        .        iH2C        0.975588683
EE        .        iH2C        0.975588683
ES        .        iH2C        0.975588683
FI        .        iH2C        0.975588683
FR        .        iH2C        0.975588683
GR        .        iH2C        0.975588683
HU        .        iH2C        0.975588683
IE        .        iH2C        0.975588683
IT        .        iH2C        0.975588683
LT        .        iH2C        0.975588683
LU        .        iH2C        0.975588683
LV        .        iH2C        0.975588683
MT        .        iH2C        0.975588683
NL        .        iH2C        0.975588683
PL        .        iH2C        0.975588683
PT        .        iH2C        0.975588683
RO        .        iH2C        0.975588683
SE        .        iH2C        0.975588683
SI        .        iH2C        0.975588683
SK        .        iH2C        0.975588683
GB        .        iH2C        0.975588683
CH        .        iH2C        0.975588683
NO        .        iH2C        0.975588683

/;

*cint1(cnt,sec)=1;


* ================ CPD - COUNTERFACTUAL POLICY DEFINITION =====================
Set step /1*12/;

* Counterfactual point 5 Tariffs

parameter tft(step) tariff on imports per period /
1  0
2  0
3  0
4  0.1
5  0.5
6  1.5
7  2
8  2.5
9  3
10 4
11 4
12 4
/;


Parameter CO2Fuel(cnt,com) /
AT        .        pOIL      4.045
AT        .        pNG       26.471
AT        .        pCOA      20.857
AT        .        pFUL      29.912
BE        .        pOIL      6.938
BE        .        pNG       38.324
BE        .        pCOA      21.839
BE        .        pFUL      55.274
BG        .        pOIL      2.402
BG        .        pNG       5.257
BG        .        pCOA      31.375
BG        .        pFUL      18.015
CY        .        pOIL      0
CY        .        pNG       2.259
CY        .        pCOA      0.076
CY        .        pFUL      0.82
CZ        .        pOIL      3.163
CZ        .        pNG       14.843
CZ        .        pCOA      87.19
CZ        .        pFUL      21.449
DE        .        pOIL      44.548
DE        .        pNG       224.158
DE        .        pCOA      287.123
DE        .        pFUL      369.811
DK        .        pOIL      2.362
DK        .        pNG       8.589
DK        .        pCOA      12.17
DK        .        pFUL      16.944
EE        .        pOIL      0.024
EE        .        pNG       4.001
EE        .        pCOA      5.316
EE        .        pFUL      13.988
ES        .        pOIL      16.336
ES        .        pNG       62.625
ES        .        pCOA      91.101
ES        .        pFUL      153.387
FI        .        pOIL      1.687
FI        .        pNG       18.656
FI        .        pCOA      7.023
FI        .        pFUL      26.572
FR        .        pOIL      29.053
FR        .        pNG       84.35
FR        .        pCOA      51.275
FR        .        pFUL      215.919
GR        .        pOIL      3.164
GR        .        pNG       11.132
GR        .        pCOA      40.594
GR        .        pFUL      28.43
HU        .        pOIL      2.254
HU        .        pNG       14.862
HU        .        pCOA      18.889
HU        .        pFUL      19.596
IE        .        pOIL      1.587
IE        .        pNG       6.687
IE        .        pCOA      19.108
IE        .        pFUL      17.153
IT        .        pOIL      30.758
IT        .        pNG       107.287
IT        .        pCOA      112.647
IT        .        pFUL      166.409
LT        .        pOIL      0.292
LT        .        pNG       2.28
LT        .        pCOA      0.764
LT        .        pFUL      12.459
LU        .        pOIL      0.002
LU        .        pNG       6.488
LU        .        pCOA      1.799
LU        .        pFUL      2.701
LV        .        pOIL      0.04
LV        .        pNG       1.181
LV        .        pCOA      0.446
LV        .        pFUL      7.394
MT        .        pOIL      0
MT        .        pNG       0.298
MT        .        pCOA      0.103
MT        .        pFUL      0.763
NL        .        pOIL      6.177
NL        .        pNG       58.523
NL        .        pCOA      80.766
NL        .        pFUL      53.448
PL        .        pOIL      14.651
PL        .        pNG       47.51
PL        .        pCOA      210.613
PL        .        pFUL      85.669
PT        .        pOIL      1.076
PT        .        pNG       9.009
PT        .        pCOA      10.72
PT        .        pFUL      40.819
RO        .        pOIL      7.003
RO        .        pNG       15.304
RO        .        pCOA      44.928
RO        .        pFUL      26.028
SE        .        pOIL      2.911
SE        .        pNG       15.775
SE        .        pCOA      6.03
SE        .        pFUL      27.281
SI        .        pOIL      0.003
SI        .        pNG       2.084
SI        .        pCOA      8.722
SI        .        pFUL      6.088
SK        .        pOIL      2.196
SK        .        pNG       13.699
SK        .        pCOA      16.332
SK        .        pFUL      8.496
GB        .        pOIL      24.954
GB        .        pNG       148.667
GB        .        pCOA      165.17
GB        .        pFUL      147.33
CH        .        pOIL      0.254
CH        .        pNG       5.172
CH        .        pCOA      3.092
CH        .        pFUL      13.315
NO        .        pOIL      1.81
NO        .        pNG       39.352
NO        .        pCOA      2.437
NO        .        pFUL      21.133
/;


parameter opent(cnt,sec,step);
opent(cnt,sec,step)=1;

$ifthen %CaseStudy%==1
opent(cnt,"iH2E",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2S",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2C",step)$(ord(step) le 5)=0.0001;
$elseif %CaseStudy%==2
opent(cnt,"iH2E",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2S",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2C",step)$(ord(step) le 5)=0.0001;
$elseif %CaseStudy%==3
opent(cnt,"iH2E",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2S",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2C",step)$(ord(step) le 5)=0.0001;
$elseif %CaseStudy%==4
opent(cnt,"iH2E",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2S",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2C",step)$(ord(step) le 5)=0.0001;
$elseif %CaseStudy%==5
opent(cnt,"iH2E",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2S",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2C",step)$(ord(step) le 5)=0.0001;
$elseif %CaseStudy%==6
opent(cnt,"iH2E",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2S",step)$(ord(step) le 5)=0.0001;
opent(cnt,"iH2C",step)$(ord(step) le 5)=0.0001;
$endif

$ifthen %CaseStudy%==0
parameter Circular(cnt);
Circular(cnt)=0.8;
$endif

$ifthen %CaseStudy%==1
parameter Circular(cnt);
Circular(cnt)=0.8
$endif

$ifthen %CaseStudy%==6
parameter Circular(cnt);
Circular(cnt)=0.8
$ontext

parameter Circular(cnt) material reduction /
AT        0.8
BE        0.8
BG        1
CY        1
CZ        1
DE        0.8
DK        0.8
EE        1
ES        1
FI        0.8
FR        0.8
GR        1
HU        1
IE        0.8
IT        1
LT        1
LU        0.8
LV        1
MT        1
NL        0.8
PL        1
PT        1
RO        1
SE        0.8
SI        1
SK        1
GB        1
CH        1
NO        0.8
/;
$offtext
$endif

$ifthen %CaseStudy%==2
parameter Circular(cnt);
*Circular(cnt)=0.8;
*$ontext
parameter Circular(cnt) material reduction /
AT        0.8
BE        0.8
BG        1
CY        1
CZ        1
DE        0.8
DK        0.8
EE        1
ES        1
FI        0.8
FR        0.8
GR        1
HU        1
IE        0.8
IT        1
LT        1
LU        0.8
LV        1
MT        1
NL        0.8
PL        1
PT        1
RO        1
SE        0.8
SI        1
SK        1
GB        1
CH        1
NO        0.8
/;
*$offtext
$endif

$ifthen %CaseStudy%==3
parameter Circular(cnt) material reduction /
AT        0.95
BE        0.95
BG        1
CY        1
CZ        1
DE        0.95
DK        0.95
EE        1
ES        1
FI        0.95
FR        0.95
GR        1
HU        1
IE        0.95
IT        1
LT        1
LU        0.95
LV        1
MT        1
NL        0.95
PL        1
PT        1
RO        1
SE        0.95
SI        1
SK        1
GB        1
CH        1
NO        0.95
/;
$endif

$ifthen %CaseStudy%==4
parameter Circular(cnt);
Circular(cnt)=0.67;
*Circular(cnt)=0.65;
$endif


$ifthen %CaseStudy%==5
parameter Circular(cnt);
Circular(cnt)=0.8;
$endif



$include "growth_table.gms"



$ifthen %CaseStudy%==1
parameter lpd(cnt) change in productivity due to climate change /
AT        -0.00152
BE        -0.00162
BG        -0.00166
CY        -0.01625
CZ        -0.00023
DE        -0.00051
DK        0.00064
EE        0.00264
ES        -0.01433
FI        0.00244
FR        -0.00455
GR        -0.01399
HU        -0.00263
IE        0.00035
IT        -0.00998
LT        0.00222
LU        -0.00027
LV        0.00175
MT        -0.01432
NL        -0.00098
PL        0.00014
PT        -0.00801
RO        0.00035
SE        0.00148
SI        -0.00110
SK        -0.00141
GB        -0.00061
CH        -0.00152
NO        0.00148
/;
$endif

$ifthen %CaseStudy%==2
parameter lpd(cnt) change in productivity due to climate change /
AT        -0.00072
BE        -0.00079
BG        -0.00064
CY        -0.01227
CZ        0.00008
DE        -0.00014
DK        0.00065
EE        0.00213
ES        -0.01009
FI        0.00163
FR        -0.00286
GR        -0.00863
HU        -0.00166
IE        0.00042
IT        -0.00665
LT        0.00198
LU        0.00015
LV        0.00147
MT        -0.01077
NL        -0.00058
PL        0.00044
PT        -0.00587
RO        0.00069
SE        0.00095
SI        -0.00045
SK        -0.00065
GB        -0.00039
CH        -0.00072
NO        0.00095
/;
$endif

$ifthen %CaseStudy%==3
parameter lpd(cnt) change in productivity due to climate change /
AT        -0.00052
BE        -0.00058
BG        -0.00036
CY        -0.01025
CZ        0.00016
DE        -0.00002
DK        0.00062
EE        0.00189
ES        -0.00821
FI        0.00141
FR        -0.00219
GR        -0.00718
HU        -0.00123
IE        0.00042
IT        -0.00549
LT        0.00179
LU        0.00023
LV        0.00132
MT        -0.00899
NL        -0.00040
PL        0.00047
PT        -0.00483
RO        0.00073
SE        0.00083
SI        -0.00024
SK        -0.00046
GB        -0.00027
CH        -0.00052
NO        0.00083
/;
$endif

$ifthen %CaseStudy%==4
parameter lpd(cnt) change in productivity due to climate change /
AT        -0.00052
BE        -0.00058
BG        -0.00036
CY        -0.01025
CZ        0.00016
DE        -0.00002
DK        0.00062
EE        0.00189
ES        -0.00821
FI        0.00141
FR        -0.00219
GR        -0.00718
HU        -0.00123
IE        0.00042
IT        -0.00549
LT        0.00179
LU        0.00023
LV        0.00132
MT        -0.00899
NL        -0.00040
PL        0.00047
PT        -0.00483
RO        0.00073
SE        0.00083
SI        -0.00024
SK        -0.00046
GB        -0.00027
CH        -0.00052
NO        0.00083
/;
$endif

$ifthen %CaseStudy%==5
parameter lpd(cnt) change in productivity due to climate change /
AT        -0.00052
BE        -0.00058
BG        -0.00036
CY        -0.01025
CZ        0.00016
DE        -0.00002
DK        0.00062
EE        0.00189
ES        -0.00821
FI        0.00141
FR        -0.00219
GR        -0.00718
HU        -0.00123
IE        0.00042
IT        -0.00549
LT        0.00179
LU        0.00023
LV        0.00132
MT        -0.00899
NL        -0.00040
PL        0.00047
PT        -0.00483
RO        0.00073
SE        0.00083
SI        -0.00024
SK        -0.00046
GB        -0.00027
CH        -0.00052
NO        0.00083
/;
$endif


$ifthen %CaseStudy%==6
* Climate Change Effects = Drop in Labour productivity and increase in Energy demand.
parameter lpd(cnt) change in productivity due to climate change /
AT        -0.024476882
BE        -0.011556298
BG        -0.013292354
CY        -0.041831028
CZ        -0.024652165
DE        -0.022852234
DK        -0.00748509
EE        -0.013011347
ES        -0.052556627
FI        -0.014482259
FR        -0.022356525
GR        -0.032747425
HU        -0.022118296
IE        -0.007291855
IT        -0.031230142
LT        -0.013292354
LU        -0.013210835
LV        -0.013210835
MT        -0.040775648
NL        -0.014089765
PL        -0.016413713
PT        -0.039519075
RO        -0.023316487
SE        -0.012704408
SI        -0.025810286
SK        -0.024304078
GB        -0.010177949
CH        -0.021564283
NO        -0.006182978
/;
$endif



*j.        Read input from MultiFutures platform

* MultiFutures
* REMOVE blanks before reading the file "the netherlands" --> "thenetherlands"
* ====== Include IAMC input file ============0
*=== Import from Excel using GDX utilities
set year /2015,2020,2025,2030,2035,2040,2045,2050,2055,2060/;

* primary energy from GENeSYS-MOD

set source
/
'SecondaryEnergy|Electricity|Biomass|w/CCS'
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Coal|w/CCS'
'SecondaryEnergy|Electricity|Coal|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/CCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Oil|w/CCS'
'SecondaryEnergy|Electricity|Oil|w/oCCS'
'SecondaryEnergy|Electricity|Other'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Onshore'
'SecondaryEnergy|Electricity|Wind|Offshore'
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Liquids|Biomass'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'
'FinalEnergy|ResidentialandCommercial|Liquids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Coal'
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
'FinalEnergy|Transportation|Liquids|Oil'
'FinalEnergy|Transportation|Gases'
/;

set consource /
'Consumption|Households|pAGR'
'Consumption|Households|pIND'
'Consumption|Households|pALU'
'Consumption|Households|pSER'
'Consumption|Households|pHOT'
'Consumption|Households|pTRA'
'Consumption|Households|pELE'
'Consumption|Households|pTRD'
'Consumption|Households|pOIL'
'Consumption|Households|pNG'
'Consumption|Households|pCOA'
'Consumption|Households|pFUL'
'Consumption|Households|pH2'
/;

* Technology change for energy nest
*tech for power sector
$ifthen %CaseStudy%==0
* Test (corresponds to Gradual Development - It might need to be changed depending on the case study we want to test)
set source1(source)
/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Coal|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Oil|w/oCCS'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Onshore'
'SecondaryEnergy|Electricity|Wind|Offshore'
/;

* what is the share of electricity with CCS
set wccs(source);
wccs(source)=no;


*tech for industry sector
set source2(source)
/
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
/;

*tech for transport sector
set source3(source)
/
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
'FinalEnergy|Transportation|Liquids|Oil'
/;

*tech for service sector and households
set source4(source)
/
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Coal'
/;
$endif

$ifthen %CaseStudy%==1
set source1(source)
/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Coal|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Oil|w/oCCS'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Onshore'
'SecondaryEnergy|Electricity|Wind|Offshore'
/;

* what is the share of electricity with CCS
* what is the share of electricity with CCS
set wccs(source);
wccs(source)=no;

*tech for industry sector
set source2(source)
/
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Liquids|Biomass'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
/;

*tech for transport sector
set source3(source)
/
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Gases'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
'FinalEnergy|Transportation|Liquids|Oil'
/;

*tech for service sector and households
set source4(source)
/
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'
'FinalEnergy|ResidentialandCommercial|Liquids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Coal'
/;
$endif

$ifthen %CaseStudy%==6
set source1(source)
/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Coal|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Oil|w/oCCS'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Onshore'
'SecondaryEnergy|Electricity|Wind|Offshore'
/;

* what is the share of electricity with CCS
* what is the share of electricity with CCS
set wccs(source);
wccs(source)=no;

*tech for industry sector
set source2(source)
/
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
/;

*tech for transport sector
set source3(source)
/
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
'FinalEnergy|Transportation|Liquids|Oil'
/;

*tech for service sector and households
set source4(source)
/
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Coal'
/;
$endif


$ifthen %CaseStudy%==2
set source1(source)
/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Coal|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Oil|w/oCCS'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Onshore'
'SecondaryEnergy|Electricity|Wind|Offshore'
/;

* what is the share of electricity with CCS
set wccs(source);
wccs(source)=no;


*tech for industry sector
set source2(source)
/
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
/;

*tech for transport sector
set source3(source)
/
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
'FinalEnergy|Transportation|Liquids|Oil'
/;

*tech for service sector and households
set source4(source)
/
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Coal'
/;
$endif


$ifthen %CaseStudy%==3
set source1(source)
/
'SecondaryEnergy|Electricity|Biomass|w/CCS'
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/CCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Other'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Offshore'
'SecondaryEnergy|Electricity|Wind|Onshore'
/;

* what is the share of electricity with CCS
set wccs(source)
/
'SecondaryEnergy|Electricity|Biomass|w/CCS'
'SecondaryEnergy|Electricity|Gas|w/CCS'
/;


*tech for industry sector
set source2(source)
/
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Liquids|Biomass'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
/;

*tech for transport sector
set source3(source)
/
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
/;

*tech for service sector and households
set source4(source)
/
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
/;
$endif




$ifthen %CaseStudy%==4
set source1(source)
/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Coal|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Oil|w/oCCS'
'SecondaryEnergy|Electricity|Other'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Onshore'
'SecondaryEnergy|Electricity|Wind|Offshore'
/;

* what is the share of electricity with CCS
set wccs(source);
wccs(source)=no;


*tech for industry sector
set source2(source)
/
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
/;

*tech for transport sector
set source3(source)
/
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
'FinalEnergy|Transportation|Liquids|Oil'
/;

*tech for service sector and households
set source4(source)
/
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Coal'
/;
$endif


$ifthen %CaseStudy%==5
set source1(source)
/
'SecondaryEnergy|Electricity|Biomass|w/CCS'
'SecondaryEnergy|Electricity|Biomass|w/oCCS'
'SecondaryEnergy|Electricity|Coal|w/oCCS'
'SecondaryEnergy|Electricity|Gas|w/CCS'
'SecondaryEnergy|Electricity|Gas|w/oCCS'
'SecondaryEnergy|Electricity|Geothermal'
'SecondaryEnergy|Electricity|Hydro'
'SecondaryEnergy|Electricity|Nuclear'
'SecondaryEnergy|Electricity|Oil|w/oCCS'
'SecondaryEnergy|Electricity|Other'
'SecondaryEnergy|Electricity|Solar|PV'
'SecondaryEnergy|Electricity|Wind|Onshore'
'SecondaryEnergy|Electricity|Wind|Offshore'
/;

set wccs(source)
/
'SecondaryEnergy|Electricity|Biomass|w/CCS'
'SecondaryEnergy|Electricity|Gas|w/CCS'
/;

*tech for industry sector
set source2(source)
/
'FinalEnergy|Industry|Electricity'
'FinalEnergy|Industry|Gases'
'FinalEnergy|Industry|Hydrogen'
'FinalEnergy|Industry|Liquids|Oil'
'FinalEnergy|Industry|Solids|Biomass'
'FinalEnergy|Industry|Solids|Coal'
/;

*tech for transport sector
set source3(source)
/
'FinalEnergy|Transportation|Electricity'
'FinalEnergy|Transportation|Hydrogen'
'FinalEnergy|Transportation|Liquids|Biomass'
'FinalEnergy|Transportation|Liquids|Oil'
/;

*tech for service sector and households
set source4(source)
/
'FinalEnergy|ResidentialandCommercial|Electricity'
'FinalEnergy|ResidentialandCommercial|Gases'
'FinalEnergy|ResidentialandCommercial|Hydrogen'
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'
'FinalEnergy|ResidentialandCommercial|Solids|Coal'
/;
$endif


* countries from GENeSYS-MOD
set countries
/
Austria
Belgium
Bulgaria
Croatia
Cyprus
CzechRepublic
Denmark
Estonia
Finland
France
Germany
Greece
Hungary
Ireland
Italy
Latvia
Lithuania
Luxembourg
Malta
Poland
Portugal
Romania
Slovakia
Slovenia
Spain
Sweden
TheNetherlands
Norway
Switzerland
UnitedKingdom
/;

set Psecs Sectors from PRIMES /
"Agriculture"
"Energy Sector"
"Iron and steel"
"Non ferrous metals"
"Other industries"
"Services"
"Chemicals"
"Non metallic minerals"
"Pulp paper and printing"
"Food drink and tobacco"
"Textiles"
"Engineering"
"Transport"
"Construction"
/;



*$ontext
*=== First unload to GDX file (occurs during compilation phase)

$ifthen %CaseStudy%==1
$call gdxxrw.exe MF_Ref_PRIMES.xlsx par=PrimaryEnergy rng=Sheet1!A1:G10753 cdim=1 rdim=6
$call gdxxrw.exe MIWAG_REF.xlsx par=ConsPref rng=MIWAG_to_REMES!A1:G9241 cdim=1 rdim=6
$endif

$ifthen %CaseStudy%==6
$call gdxxrw.exe oePathwayGD.xlsx par=PrimaryEnergy rng=Sheet1!A1:G5915 cdim=1 rdim=6
$call gdxxrw.exe MIWAG_REF.xlsx par=ConsPref rng=MIWAG_to_REMES!A1:M5986 cdim=1 rdim=6
$endif

$ifthen %CaseStudy%==2
$call gdxxrw.exe oePathwayGD.xlsx par=PrimaryEnergy rng=Sheet1!A1:G5915 cdim=1 rdim=6
$call gdxxrw.exe MIWAG_REF.xlsx par=ConsPref rng=MIWAG_to_REMES!A1:M5986 cdim=1 rdim=6
$endif

$ifthen %CaseStudy%==3
$call gdxxrw.exe oePathwayTF.xlsx par=PrimaryEnergy rng=Sheet1!A1:G5915 cdim=1 rdim=6
$call gdxxrw.exe MIWAG_REF.xlsx par=ConsPref rng=MIWAG_to_REMES!A1:M5986 cdim=1 rdim=6
$endif

$ifthen %CaseStudy%==4
$call gdxxrw.exe oePathwaySC.xlsx par=PrimaryEnergy rng=Sheet1!A1:G5915 cdim=1 rdim=6
$call gdxxrw.exe MIWAG_REF.xlsx par=ConsPref rng=MIWAG_to_REMES!A1:M5986 cdim=1 rdim=6
$endif

$ifthen %CaseStudy%==5
$call gdxxrw.exe oePathwayDT.xlsx par=PrimaryEnergy rng=Sheet1!A1:G5915 cdim=1 rdim=6
$call gdxxrw.exe MIWAG_REF.xlsx par=ConsPref rng=MIWAG_to_REMES!A1:M5986 cdim=1 rdim=6
$endif


set linkCnt(countries,cnt) /
Austria       .        AT
Belgium       .        BE
Bulgaria      .        BG
Cyprus        .        CY
CzechRepublic .        CZ
Denmark       .        DK
Estonia       .        EE
Finland       .        FI
France        .        FR
Germany       .        DE
Greece        .        GR
Hungary       .        HU
Ireland       .        IE
Italy         .        IT
Latvia        .        LV
Lithuania     .        LT
Luxembourg    .        LU
Malta         .        MT
Poland        .        PL
Portugal      .        PT
Romania       .        RO
Slovakia      .        SK
Slovenia      .        SI
Spain         .        ES
Sweden        .        SE
TheNetherlands.        NL
*Norway        .        NO
*Switzerland   .        CH
*UnitedKingdom .        GB
/;

$ifthen %CaseStudy%==0
* Test (corresponds to Gradual Development - It might need to be changed depending on the case study we want to test)
set linkSor(source1,*)/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'.pBIO
'SecondaryEnergy|Electricity|Coal|w/oCCS'.pCOA
'SecondaryEnergy|Electricity|Gas|w/oCCS'.pNG
'SecondaryEnergy|Electricity|Geothermal'.pNG
'SecondaryEnergy|Electricity|Hydro'.K
'SecondaryEnergy|Electricity|Nuclear'.K
'SecondaryEnergy|Electricity|Oil|w/oCCS'.pOIL
'SecondaryEnergy|Electricity|Solar|PV'.K
'SecondaryEnergy|Electricity|Wind|Onshore'.K
'SecondaryEnergy|Electricity|Wind|Offshore'.K
/;

set linkConsInd(source2,com)/
'FinalEnergy|Industry|Electricity'.pELE
'FinalEnergy|Industry|Gases'.pNG
'FinalEnergy|Industry|Hydrogen'.pH2
'FinalEnergy|Industry|Liquids|Oil'.pFUL
'FinalEnergy|Industry|Liquids|Oil'.pOIL
'FinalEnergy|Industry|Liquids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Coal'.pCOA
/;


set linkConsTra(source3,com)/
'FinalEnergy|Transportation|Electricity'.pELE
'FinalEnergy|Transportation|Gases'.pNG
'FinalEnergy|Transportation|Hydrogen'.pH2
'FinalEnergy|Transportation|Liquids|Biomass'.pBIO
'FinalEnergy|Transportation|Liquids|Oil'.pFUL
'FinalEnergy|Transportation|Liquids|Oil'.pOIL
/;

set linkConsSH(source4,com)/
'FinalEnergy|ResidentialandCommercial|Electricity'.pELE
'FinalEnergy|ResidentialandCommercial|Gases'.pNG
'FinalEnergy|ResidentialandCommercial|Hydrogen'.pH2
'FinalEnergy|ResidentialandCommercial|Liquids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'.pFUL
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Solids|Coal'.pCOA
/;

set linkConsHOUS(consource,com)/
'Consumption|Households|pAGR'.pAGR
'Consumption|Households|pIND'.pIND
'Consumption|Households|pALU'.pALU
'Consumption|Households|pSER'.pSER
'Consumption|Households|pHOT'.pHOT
'Consumption|Households|pTRA'.pTRA
'Consumption|Households|pELE'.pELE
'Consumption|Households|pTRD'.pTRD
'Consumption|Households|pOIL'.pOIL
'Consumption|Households|pNG'.pNG
'Consumption|Households|pCOA'.pCOA
'Consumption|Households|pFUL'.pFUL
'Consumption|Households|pH2'.pH2
/;
$endif


$ifthen %CaseStudy%==1
* Reference
set linkSor(source1,*)/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'.pBIO
'SecondaryEnergy|Electricity|Coal|w/oCCS'.pCOA
'SecondaryEnergy|Electricity|Gas|w/oCCS'.pNG
'SecondaryEnergy|Electricity|Geothermal'.pNG
'SecondaryEnergy|Electricity|Hydro'.K
'SecondaryEnergy|Electricity|Nuclear'.K
'SecondaryEnergy|Electricity|Oil|w/oCCS'.pOIL
'SecondaryEnergy|Electricity|Solar|PV'.K
'SecondaryEnergy|Electricity|Wind|Onshore'.K
'SecondaryEnergy|Electricity|Wind|Offshore'.K
/;

set linkConsInd(source2,com)/
'FinalEnergy|Industry|Electricity'.pELE
'FinalEnergy|Industry|Gases'.pNG
'FinalEnergy|Industry|Hydrogen'.pH2
'FinalEnergy|Industry|Liquids|Oil'.pFUL
'FinalEnergy|Industry|Liquids|Oil'.pOIL
'FinalEnergy|Industry|Liquids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Coal'.pCOA
/;


set linkConsTra(source3,com)/
'FinalEnergy|Transportation|Electricity'.pELE
'FinalEnergy|Transportation|Hydrogen'.pH2
'FinalEnergy|Transportation|Liquids|Biomass'.pBIO
'FinalEnergy|Transportation|Gases'.pNG
'FinalEnergy|Transportation|Liquids|Oil'.pFUL
/;

set linkConsSH(source4,com)/
'FinalEnergy|ResidentialandCommercial|Electricity'.pELE
'FinalEnergy|ResidentialandCommercial|Gases'.pNG
'FinalEnergy|ResidentialandCommercial|Hydrogen'.pH2
'FinalEnergy|ResidentialandCommercial|Liquids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'.pFUL
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Solids|Coal'.pCOA
/;

set linkConsHOUS(consource,com)/
'Consumption|Households|pAGR'.pAGR
'Consumption|Households|pIND'.pIND
'Consumption|Households|pALU'.pALU
'Consumption|Households|pSER'.pSER
'Consumption|Households|pHOT'.pHOT
'Consumption|Households|pTRA'.pTRA
'Consumption|Households|pELE'.pELE
'Consumption|Households|pTRD'.pTRD
'Consumption|Households|pOIL'.pOIL
'Consumption|Households|pNG'.pNG
'Consumption|Households|pCOA'.pCOA
'Consumption|Households|pFUL'.pFUL
'Consumption|Households|pH2'.pH2
/;
$endif

$ifthen %CaseStudy%==6
* Reference
set linkSor(source1,*)/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'.pBIO
'SecondaryEnergy|Electricity|Coal|w/oCCS'.pCOA
'SecondaryEnergy|Electricity|Gas|w/oCCS'.pNG
'SecondaryEnergy|Electricity|Geothermal'.pNG
'SecondaryEnergy|Electricity|Hydro'.K
'SecondaryEnergy|Electricity|Nuclear'.K
'SecondaryEnergy|Electricity|Oil|w/oCCS'.pOIL
'SecondaryEnergy|Electricity|Solar|PV'.K
'SecondaryEnergy|Electricity|Wind|Onshore'.K
'SecondaryEnergy|Electricity|Wind|Offshore'.K
/;

set linkConsInd(source2,com)/
'FinalEnergy|Industry|Electricity'.pELE
'FinalEnergy|Industry|Gases'.pNG
'FinalEnergy|Industry|Hydrogen'.pH2
'FinalEnergy|Industry|Liquids|Oil'.pFUL
'FinalEnergy|Industry|Solids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Coal'.pCOA
/;


set linkConsTra(source3,com)/
'FinalEnergy|Transportation|Electricity'.pELE
'FinalEnergy|Transportation|Hydrogen'.pH2
'FinalEnergy|Transportation|Liquids|Biomass'.pBIO
*'FinalEnergy|Transportation|Liquids|Oil'.pOIL
'FinalEnergy|Transportation|Liquids|Oil'.pFUL
/;

set linkConsSH(source4,com)/
'FinalEnergy|ResidentialandCommercial|Electricity'.pELE
'FinalEnergy|ResidentialandCommercial|Gases'.pNG
'FinalEnergy|ResidentialandCommercial|Hydrogen'.pH2
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'.pFUL
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Solids|Coal'.pCOA
/;

set linkConsHOUS(consource,com)/
'Consumption|Households|pAGR'.pAGR
'Consumption|Households|pIND'.pIND
'Consumption|Households|pALU'.pALU
'Consumption|Households|pSER'.pSER
'Consumption|Households|pHOT'.pHOT
'Consumption|Households|pTRA'.pTRA
'Consumption|Households|pELE'.pELE
'Consumption|Households|pTRD'.pTRD
'Consumption|Households|pOIL'.pOIL
'Consumption|Households|pNG'.pNG
'Consumption|Households|pCOA'.pCOA
'Consumption|Households|pFUL'.pFUL
'Consumption|Households|pH2'.pH2
/;
$endif

$ifthen %CaseStudy%==2
* Gradual Development
set linkSor(source1,*)/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'.pBIO
'SecondaryEnergy|Electricity|Coal|w/oCCS'.pCOA
'SecondaryEnergy|Electricity|Gas|w/oCCS'.pNG
'SecondaryEnergy|Electricity|Geothermal'.pNG
'SecondaryEnergy|Electricity|Hydro'.K
'SecondaryEnergy|Electricity|Nuclear'.K
'SecondaryEnergy|Electricity|Oil|w/oCCS'.pOIL
'SecondaryEnergy|Electricity|Solar|PV'.K
'SecondaryEnergy|Electricity|Wind|Onshore'.K
'SecondaryEnergy|Electricity|Wind|Offshore'.K
/;

set linkConsInd(source2,com)/
'FinalEnergy|Industry|Electricity'.pELE
'FinalEnergy|Industry|Gases'.pNG
'FinalEnergy|Industry|Hydrogen'.pH2
'FinalEnergy|Industry|Liquids|Oil'.pFUL
'FinalEnergy|Industry|Solids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Coal'.pCOA
/;


set linkConsTra(source3,com)/
'FinalEnergy|Transportation|Electricity'.pELE
'FinalEnergy|Transportation|Hydrogen'.pH2
'FinalEnergy|Transportation|Liquids|Biomass'.pBIO
*'FinalEnergy|Transportation|Liquids|Oil'.pOIL
'FinalEnergy|Transportation|Liquids|Oil'.pFUL
/;

set linkConsSH(source4,com)/
'FinalEnergy|ResidentialandCommercial|Electricity'.pELE
'FinalEnergy|ResidentialandCommercial|Gases'.pNG
'FinalEnergy|ResidentialandCommercial|Hydrogen'.pH2
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'.pFUL
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Solids|Coal'.pCOA
/;

set linkConsHOUS(consource,com)/
'Consumption|Households|pAGR'.pAGR
'Consumption|Households|pIND'.pIND
'Consumption|Households|pALU'.pALU
'Consumption|Households|pSER'.pSER
'Consumption|Households|pHOT'.pHOT
'Consumption|Households|pTRA'.pTRA
'Consumption|Households|pELE'.pELE
'Consumption|Households|pTRD'.pTRD
'Consumption|Households|pOIL'.pOIL
'Consumption|Households|pNG'.pNG
'Consumption|Households|pCOA'.pCOA
'Consumption|Households|pFUL'.pFUL
'Consumption|Households|pH2'.pH2
/;
$endif


$ifthen %CaseStudy%==3
* Techno-Friendly
set linkSor(source1,*)/
* where is COAL and OIL?
'SecondaryEnergy|Electricity|Biomass|w/CCS'.pBIO
'SecondaryEnergy|Electricity|Biomass|w/oCCS'.pBIO
'SecondaryEnergy|Electricity|Gas|w/CCS'.pNG
'SecondaryEnergy|Electricity|Gas|w/oCCS'.pNG
'SecondaryEnergy|Electricity|Geothermal'.pNG
'SecondaryEnergy|Electricity|Hydro'.K
'SecondaryEnergy|Electricity|Nuclear'.K
'SecondaryEnergy|Electricity|Other'.K
'SecondaryEnergy|Electricity|Solar|PV'.K
'SecondaryEnergy|Electricity|Wind|Offshore'.K
'SecondaryEnergy|Electricity|Wind|Onshore'.K
/;

set linkConsInd(source2,com)/
* where is oil?
'FinalEnergy|Industry|Electricity'.pELE
'FinalEnergy|Industry|Gases'.pNG
'FinalEnergy|Industry|Hydrogen'.pH2
'FinalEnergy|Industry|Liquids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Coal'.pCOA
/;


set linkConsTra(source3,com)/
*where is OIL?
'FinalEnergy|Transportation|Electricity'.pELE
'FinalEnergy|Transportation|Hydrogen'.pH2
'FinalEnergy|Transportation|Liquids|Biomass'.pBIO
/;

set linkConsSH(source4,com)/
* where are OIL and COAL?
'FinalEnergy|ResidentialandCommercial|Electricity'.pELE
'FinalEnergy|ResidentialandCommercial|Gases'.pNG
'FinalEnergy|ResidentialandCommercial|Hydrogen'.pH2
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'.pBIO
/;

set linkConsHOUS(consource,com)/
'Consumption|Households|pAGR'.pAGR
'Consumption|Households|pIND'.pIND
'Consumption|Households|pALU'.pALU
'Consumption|Households|pSER'.pSER
'Consumption|Households|pHOT'.pHOT
'Consumption|Households|pTRA'.pTRA
'Consumption|Households|pELE'.pELE
'Consumption|Households|pTRD'.pTRD
'Consumption|Households|pOIL'.pOIL
'Consumption|Households|pNG'.pNG
'Consumption|Households|pCOA'.pCOA
'Consumption|Households|pFUL'.pFUL
'Consumption|Households|pH2'.pH2
/;
$endif

$ifthen %CaseStudy%==4
* Societal Commitment
set linkSor(source1,*)/
'SecondaryEnergy|Electricity|Biomass|w/oCCS'.pBIO
'SecondaryEnergy|Electricity|Coal|w/oCCS'.pCOA
'SecondaryEnergy|Electricity|Gas|w/oCCS'.pNG
'SecondaryEnergy|Electricity|Geothermal'.pNG
'SecondaryEnergy|Electricity|Hydro'.K
'SecondaryEnergy|Electricity|Nuclear'.K
'SecondaryEnergy|Electricity|Oil|w/oCCS'.pOIL
'SecondaryEnergy|Electricity|Other'.K
'SecondaryEnergy|Electricity|Solar|PV'.K
'SecondaryEnergy|Electricity|Wind|Onshore'.K
'SecondaryEnergy|Electricity|Wind|Offshore'.K
/;

set linkConsInd(source2,com)/
'FinalEnergy|Industry|Electricity'.pELE
'FinalEnergy|Industry|Gases'.pNG
'FinalEnergy|Industry|Hydrogen'.pH2
'FinalEnergy|Industry|Liquids|Oil'.pFUL
'FinalEnergy|Industry|Solids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Coal'.pCOA
/;


set linkConsTra(source3,com)/
'FinalEnergy|Transportation|Electricity'.pELE
'FinalEnergy|Transportation|Hydrogen'.pH2
'FinalEnergy|Transportation|Liquids|Biomass'.pBIO
'FinalEnergy|Transportation|Liquids|Oil'.pFUL
/;

set linkConsSH(source4,com)/
'FinalEnergy|ResidentialandCommercial|Electricity'.pELE
'FinalEnergy|ResidentialandCommercial|Gases'.pNG
'FinalEnergy|ResidentialandCommercial|Hydrogen'.pH2
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'.pFUL
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Solids|Coal'.pCOA
/;

set linkConsHOUS(consource,com)/
'Consumption|Households|pAGR'.pAGR
'Consumption|Households|pIND'.pIND
'Consumption|Households|pALU'.pALU
'Consumption|Households|pSER'.pSER
'Consumption|Households|pHOT'.pHOT
'Consumption|Households|pTRA'.pTRA
'Consumption|Households|pELE'.pELE
'Consumption|Households|pTRD'.pTRD
'Consumption|Households|pOIL'.pOIL
'Consumption|Households|pNG'.pNG
'Consumption|Households|pCOA'.pCOA
'Consumption|Households|pFUL'.pFUL
'Consumption|Households|pH2'.pH2
/;
$endif

$ifthen %CaseStudy%==5
* Directed Transition
set linkSor(source1,*)/
'SecondaryEnergy|Electricity|Biomass|w/CCS'.pBIO
'SecondaryEnergy|Electricity|Biomass|w/oCCS'.pBIO
'SecondaryEnergy|Electricity|Coal|w/oCCS'.pCOA
'SecondaryEnergy|Electricity|Gas|w/CCS'.pNG
'SecondaryEnergy|Electricity|Gas|w/oCCS'.pNG
'SecondaryEnergy|Electricity|Geothermal'.pNG
'SecondaryEnergy|Electricity|Hydro'.K
'SecondaryEnergy|Electricity|Nuclear'.K
'SecondaryEnergy|Electricity|Oil|w/oCCS'.pOIL
'SecondaryEnergy|Electricity|Other'.K
'SecondaryEnergy|Electricity|Solar|PV'.K
'SecondaryEnergy|Electricity|Wind|Onshore'.K
'SecondaryEnergy|Electricity|Wind|Offshore'.K
/;

set linkConsInd(source2,com)/
'FinalEnergy|Industry|Electricity'.pELE
'FinalEnergy|Industry|Gases'.pNG
'FinalEnergy|Industry|Hydrogen'.pH2
'FinalEnergy|Industry|Liquids|Oil'.pFUL
'FinalEnergy|Industry|Solids|Biomass'.pBIO
'FinalEnergy|Industry|Solids|Coal'.pCOA
/;


set linkConsTra(source3,com)/
'FinalEnergy|Transportation|Electricity'.pELE
'FinalEnergy|Transportation|Hydrogen'.pH2
'FinalEnergy|Transportation|Liquids|Biomass'.pBIO
'FinalEnergy|Transportation|Liquids|Oil'.pFUL
/;

set linkConsSH(source4,com)/
'FinalEnergy|ResidentialandCommercial|Electricity'.pELE
'FinalEnergy|ResidentialandCommercial|Gases'.pNG
'FinalEnergy|ResidentialandCommercial|Hydrogen'.pH2
'FinalEnergy|ResidentialandCommercial|Liquids|Oil'.pFUL
'FinalEnergy|ResidentialandCommercial|Solids|Biomass'.pBIO
'FinalEnergy|ResidentialandCommercial|Solids|Coal'.pCOA
/;

set linkConsHOUS(consource,com)/
'Consumption|Households|pAGR'.pAGR
'Consumption|Households|pIND'.pIND
'Consumption|Households|pALU'.pALU
'Consumption|Households|pSER'.pSER
'Consumption|Households|pHOT'.pHOT
'Consumption|Households|pTRA'.pTRA
'Consumption|Households|pELE'.pELE
'Consumption|Households|pTRD'.pTRD
'Consumption|Households|pOIL'.pOIL
'Consumption|Households|pNG'.pNG
'Consumption|Households|pCOA'.pCOA
'Consumption|Households|pFUL'.pFUL
'Consumption|Households|pH2'.pH2
/;
$endif

set linktime(year,step)/
2015.3
2020.4
2025.5
2030.6
2035.7
2040.8
2045.9
2050.10
2055.11
2060.12
/;






