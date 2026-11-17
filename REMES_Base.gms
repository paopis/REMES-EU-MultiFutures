$Ontext
openENTRANCE version of REMES EUROPA
$Offtext


*counterfactuals

*===========Options===========
*a.        Choice of the user case and definition of main parameters for user case
* Define the CaseStudy
* 0 - Test
* 1 - Reference
* 2 - Gradual Development
* 3 - Techno-Friendly
* 4 - Societal Commitment
* 5 - Directed Transition

* Reference is similar to Gradual Development but with higher resource exploitation (0.9 vs 0.5) and higher carbon budget (3 vs 1)
* also Gradual Development has (moderate) circular economy


$ontext
Assumptions
                 Reference
Carbon Budget    60% compared to 1990 (EU Ref)
resource cut     10% reduction every 5 yrs (EU Ref)
circular econ    -
Energy Int.
Carbon Int.
Prod. Ele and H2

Extra Shocks
3. ExEff
4. GSus
5. ExEff+GSus
With Extra efficiency Techno-Friendly breaks after iteration 6 with carbon cap set at 0.05. It works with carbon cap set at 0.045.


MultiFutures:
The model gets Consumption Mix and Effective Labour Force from MIWAG.
The flag HS is to make the model aware of the external consumption mix.
The first run is done without consumption mix information for households. This means that we include the MIWAG file but we set HS to 0. This makes REMES only use population dynamics from the MIWAG file.
The Effective Labour Force is integrated from MIWAG anyway because that needs to be harmonized since the beginning.

* =================================================================
* ============ AIR POLLUTANT THRESHOLD TAX (APcap) ================
* =================================================================
* APcap : if set to 1, every (cnt,pol) with a threshold APthr in
*         AirPollutantThresholds.gms gets a permit market PAP(cnt,pol):
*         0 <= APthr - emissions  _|_  PAP (tax per Gg) >= 0.
*         If set to 0, pollutants are only reported (no tax).
*         Declared here once for all CaseStudy values; override per case
*         with an assignment (APcap = 1;) if needed.
* APbio : origin of the combustion emissions (EDGAR fossil/bio split).
*         1: fossil emissions on fossil fuels, bio emissions on the bio
*            fuel (APbiocom = pBIO), see README_AirPollutants.md.
*         0: fossil + bio emissions on fossil fuels (previous method).


$offtext



$set CaseStudy 1


* override elasticities
scalar orEl 0 uses external elasticities - 1 overrides elasticities /0/;
*================= openENTRANCE scenarios ===============
$ifthen %CaseStudy%==0
*P_S if it is equal to one the calibration of GDP happens based on baseline GDP calibration parameters
scalar P_S if equal to 1 base case without considering external shares and cut of resources                                      /1/;
scalar carbonbudget By default is low (reduce 90% but it can be left at reducing by 40% by multiplying by 4) high=4 low=1        /0/;
scalar GHGred if 1 we control the emissions if 0 we do not use a cap                                                             /0/;
scalar tariff This works on tariffs on energy import from Visegrad countries                                                     /0/;
scalar coop this works on the CO2 budget for Visegrad countries                                                                  /0/;
scalar rescut cut of fossil resources per period                                                                                 /0/;
scalar CUT  if set to 1 we cut resources by rescut otherwise we do not                                                           /0/;
scalar GDPt if set to 1 then we test a case with no GDP growth                                                                   /0/;
scalar CE   if set to 1 circular economy is enforced                                                                             /0/;
scalar EF   if set to 1 we consider energy intensity effects                                                                     /0/;
scalar CF   if set to 1 we consider carbon intensity effects                                                                     /0/;
scalar PG   productivity growth for labour 0 if not accounted                                                                    /0/;
scalar prdR productivity increase factor after the benchmark for power and h2 sector                                             /0/;
scalar ROWgr growth of the Rest Of the World                                                                                     /0/;
scalar ES external shares 1 if external shares are used for power 0 otherwise                                                    /0/;
scalar HS household external shares 1 if shares from MIWAG are used for power 0 otherwise                                        /0/;
scalar ROWco coal export to rest of the world                                                                                    /0/;
scalar CCE climate change effects                                                                                                /0/;
scalar GSus green subsidy                                                                                                        /0/;
scalar ExEff Extra energy efficiency                                                                                             /0/;
scalar unp Effects of unemployment                                                                                               /0/;
scalar pgr Population growth                                                                                                     /0/;
$endif


$ifthen %CaseStudy%==1
*P_S is doing nothing. Could be deleted but it is featured in the model, but it does nothing. Needs to be deleted as it is useless.
scalar P_S if equal to 1 base case without considering external shares and cut of resources                                              /        2        /;
scalar carbonbudget By default is low (reduce 90% but it can be left at reducing by 40% by multiplying by 4) high=4 low=1                /        0.43        /;
scalar GHGred if 1 we control the emissions if 0 we do not use a cap                                                                     /        1        /;
scalar tariff This works on tariffs on energy import from Visegrad countries                                                             /        0        /;
scalar coop this works on the CO2 budget for Visegrad countries                                                                          /        1        /;
scalar rescut cut of fossil resources per period                                                                                         /        0.9        /;
scalar CUT  if set to 1 we cut resources by rescut otherwise we do not                                                                   /        1        /;
scalar GDPt if set to 1 then we test a case with no GDP growth                                                                           /        1        /;
scalar CE   if set to 1 circular economy is enforced                                                                                     /        1        /;
scalar EF   if set to 1 we consider energy intensity effects                                                                             /        1        /;
scalar CF   if set to 1 we consider carbon intensity effects                                                                             /        1        /;
scalar PG   productivity growth for labour 0 if not accounted                                                                            /        0        /;
scalar prdR productivity increase factor after the benchmark for power and h2 sector                                                     /        0        /;
scalar ROWgr growth of the Rest Of the World                                                                                             /        1        /;
scalar ES external shares 1 if external shares are used for power 0 otherwise                                                            /        1        /;
scalar HS household external shares 1 if shares from MIWAG are used for power 0 otherwise                                                /        1        /;
scalar ROWco coal export to rest of the world                                                                                            /        0        /;
scalar CCE climate change effects                                                                                                        /        0        /;
scalar GSus green subsidy                                                                                                                /        0        /;
scalar ExEff Extra energy efficiency                                                                                                     /        0        /;
scalar unp Effects of unemployment                                                                                                       /        0        /;
scalar pgr Population growth                                                                                                             /        1        /;
* ---- In plain words ----------------------------------------------------------------------
* Here you choose whether countries get an air pollution cap. 1 = the caps written in
* AirPollutantThresholds.gms apply: above the cap, polluters must buy permits and pay a
* tax. 0 = no cap: pollution is only calculated and reported.
* -------------------------------------------------------------------------------------------
*   switch for the permit market PAP(cnt,pol): APB = APthr in each step when 1, APB = 0 when 0
scalar APcap flag - threshold tax on air pollutant emissions                                                                             /        0        /;
* ---- In plain words ----------------------------------------------------------------------
* Here you choose how pollution from burning wood and other biofuels is counted.
* 1 = it is charged to the biofuel itself; 0 = it is charged to coal, oil and gas.
* -------------------------------------------------------------------------------------------
*   switch for the EDGAR fossil/bio split: 1 = bio combustion emissions (APsrcB07) on the bio fuel
*   APbiocom (pBIO), fossil ones on the fossil fuels; 0 = all combustion emissions on fossil fuels
scalar APbio flag - EDGAR bio combustion emissions attached to the bio fuel                                                              /        0        /;
$endif


$ifthen %CaseStudy%==2
scalar P_S if equal to 1 base case without considering external shares and cut of resources                                              /        2        /;
scalar carbonbudget By default is low (reduce 90% but it can be left at reducing by 40% by multiplying by 4) high=4 low=1                /        0.1      /;
scalar GHGred if 1 we control the emissions if 0 we do not use a cap                                                                     /        1        /;
scalar tariff This works on tariffs on energy import from Visegrad countries                                                             /        0        /;
scalar coop this works on the CO2 budget for Visegrad countries                                                                          /        1        /;
scalar rescut cut of fossil resources per period                                                                                         /        0.9        /;
scalar CUT  if set to 1 we cut resources by rescut otherwise we do not                                                                   /        1        /;
scalar GDPt if set to 1 then we test a case with no GDP growth                                                                           /        1        /;
scalar CE   if set to 1 circular economy is enforced                                                                                     /        1        /;
scalar EF   if set to 1 we consider energy intensity effects                                                                             /        1        /;
scalar CF   if set to 1 we consider carbon intensity effects                                                                             /        1        /;
scalar PG   productivity growth for labour 0 if not accounted                                                                            /        0        /;
scalar prdR productivity increase factor after the benchmark for power and h2 sector                                                     /        0        /;
scalar ROWgr growth of the Rest Of the World                                                                                             /        1        /;
scalar ES external shares 1 if external shares are used for power 0 otherwise                                                            /        1        /;
scalar HS household external shares 1 if shares from MIWAG are used for power 0 otherwise                                                /        1        /;
scalar ROWco coal export to rest of the world                                                                                            /        0        /;
scalar CCE climate change effects                                                                                                        /        0        /;
scalar GSus green subsidy                                                                                                                /        0        /;
scalar ExEff Extra energy efficiency                                                                                                     /        0        /;
scalar unp Effects of unemployment                                                                                                       /        0        /;
scalar pgr Population growth                                                                                                             /        1        /;
scalar APcap flag - threshold tax on air pollutant emissions                                                                             /        0        /;
scalar APbio flag - EDGAR bio combustion emissions attached to the bio fuel                                                              /        0        /;
$endif


$ifthen %CaseStudy%==3
scalar P_S if equal to 1 base case without considering external shares and cut of resources                                      /3/;
scalar carbonbudget By default is low (reduce 90% but it can be left at reducing by 40% by multiplying by 4) high=4 low=1        /0.047/;
scalar GHGred if 1 we control the emissions if 0 we do not use a cap                                                             /1/;
scalar tariff This works on tariffs on energy import from Visegrad countries                                                     /0/;
scalar coop this works on the CO2 budget for Visegrad countries                                                                  /1/;
scalar rescut cut of fossil resources per period                                                                                 /0.84/;
scalar CUT  if set to 1 we cut resources by rescut otherwise we do not                                                           /1/;
scalar GDPt if set to 1 then we test a case with no GDP growth                                                                   /1/;
scalar CE   if set to 1 circular economy is enforced                                                                             /0/;
scalar EF   if s1t to 1 we consider energy intensity effects                                                                     /1/;
scalar CF   if set to 1 we consider carbon intensity effects                                                                     /1/;
scalar PG   productivity growth for labour 0 if not accounted                                                                    /0/;
scalar prdR productivity increase factor after the benchmark for power and h2 sector                                             /0.02/;
scalar ROWgr growth of the Rest Of the World                                                                                     /1/;
scalar ES external shares 1 if external shares are used for power 0 otherwise                                                    /1/;
scalar HS household external shares 1 if shares from MIWAG are used for power 0 otherwise                                        /1/;
scalar ROWco coal export to rest of the world                                                                                    /1/;
scalar CCE climate change effects                                                                                                /1/;
scalar GSus green subsidy                                                                                                        /0/;
scalar ExEff Extra energy efficiency                                                                                             /1/;
scalar unp Effects of unemployment                                                                                               /0/;
$endif


$ifthen %CaseStudy%==4
scalar P_S if equal to 1 base case without considering external shares and cut of resources                                      /4/;
scalar carbonbudget By default is low (reduce 90% but it can be left at reducing by 40% by multiplying by 4) high=4 low=1        /0.08/;
scalar GHGred if 1 we control the emissions if 0 we do not use a cap                                                             /1/;
scalar tariff This works on tariffs on energy import from Visegrad countries                                                     /0/;
scalar coop this works on the CO2 budget for Visegrad countries                                                                  /1/;
scalar rescut cut of fossil resources per period                                                                                 /0.84/;
scalar CUT  if set to 1 we cut resources by rescut otherwise we do not                                                           /1/;
scalar GDPt if set to 1 then we test a case with no GDP growth                                                                   /1/;
scalar CE   if set to 1 circular economy is enforced                                                                             /1/;
scalar EF   if set to 1 we consider energy intensity effects                                                                     /1/;
scalar CF   if set to 1 we consider carbon intensity effects                                                                     /1/;
scalar PG   productivity growth for labour 0 if not accounted                                                                    /0/;
scalar prdR productivity increase factor after the benchmark for power and h2 sector                                             /0.02/;
scalar ROWgr growth of the Rest Of the World                                                                                     /1/;
scalar ES external shares 1 if external shares are used for power 0 otherwise                                                    /1/;
scalar HS household external shares 1 if shares from MIWAG are used for power 0 otherwise                                        /1/;
scalar ROWco coal export to rest of the world                                                                                    /1/;
scalar CCE climate change effects                                                                                                /1/;
scalar GSus green subsidy                                                                                                        /1/;
scalar ExEff Extra energy efficiency                                                                                             /0/;
scalar unp Effects of unemployment                                                                                               /0/;
$endif


$ifthen %CaseStudy%==5
scalar P_S if equal to 1 base case without considering external shares and cut of resources                                      /5/;
scalar carbonbudget By default is low (reduce 90% but it can be left at reducing by 40% by multiplying by 4) high=4 low=1        /0.08/;
scalar GHGred if 1 we control the emissions if 0 we do not use a cap                                                             /1/;
scalar tariff This works on tariffs on energy import from Visegrad countries                                                     /0/;
scalar coop this works on the CO2 budget for Visegrad countries                                                                  /1/;
scalar rescut cut of fossil resources per period                                                                                 /0.84/;
scalar CUT  if set to 1 we cut resources by rescut otherwise we do not                                                           /1/;
scalar GDPt if set to 1 then we test a case with no GDP growth                                                                   /1/;
scalar CE   if set to 1 circular economy is enforced                                                                             /1/;
scalar EF   if set to 1 we consider energy intensity effects                                                                     /1/;
scalar CF   if set to 1 we consider carbon intensity effects                                                                     /1/;
scalar PG   productivity growth for labour 0 if not accounted                                                                    /0/;
scalar prdR productivity increase factor after the benchmark for power and h2 sector                                             /0.02/;
scalar ROWgr growth of the Rest Of the World                                                                                     /1/;
scalar ES external shares 1 if external shares are used for power 0 otherwise                                                    /1/;
scalar HS household external shares 1 if shares from MIWAG are used for power 0 otherwise                                        /1/;
scalar ROWco coal export to rest of the world                                                                                    /1/;
scalar CCE climate change effects                                                                                                /1/;
scalar GSus green subsidy                                                                                                        /1/;
scalar ExEff Extra energy efficiency                                                                                             /1/;
scalar unp Effects of unemployment                                                                                               /0/;
$endif

$ifthen %CaseStudy%==6
*P_S is doing nothing. Could be deleted but it is featured in the model, but it does nothing. Needs to be deleted as it is useless.
scalar P_S if equal to 1 base case without considering external shares and cut of resources                                      /2/;
scalar carbonbudget By default is low (reduce 90% but it can be left at reducing by 40% by multiplying by 4) high=4 low=1        /0.6/;
scalar GHGred if 1 we control the emissions if 0 we do not use a cap                                                             /1/;
scalar tariff This works on tariffs on energy import from Visegrad countries                                                     /0/;
scalar coop this works on the CO2 budget for Visegrad countries                                                                  /1/;
scalar rescut cut of fossil resources per period                                                                                 /0.9/;
scalar CUT  if set to 1 we cut resources by rescut otherwise we do not                                                           /1/;
scalar GDPt if set to 1 then we test a case with no GDP growth                                                                   /1/;
scalar CE   if set to 1 circular economy is enforced                                                                             /1/;
scalar EF   if set to 1 we consider energy intensity effects                                                                     /1/;
scalar CF   if set to 1 we consider carbon intensity effects                                                                     /1/;
scalar PG   productivity growth for labour 0 if not accounted                                                                    /0/;
scalar prdR productivity increase factor after the benchmark for power and h2 sector                                             /0/;
scalar ROWgr growth of the Rest Of the World                                                                                     /1/;
scalar ES external shares 1 if external shares are used for power 0 otherwise                                                    /0/;
scalar HS household external shares 1 if shares from MIWAG are used for power 0 otherwise                                        /1/;
scalar ROWco coal export to rest of the world                                                                                    /0/;
scalar CCE climate change effects                                                                                                /1/;
scalar GSus green subsidy                                                                                                        /0/;
scalar ExEff Extra energy efficiency                                                                                             /0/;
scalar unp Effects of unemployment                                                                                               /0/;
$endif


*================= openENTRANCE scenarios ===============


$setglobal SW_start "No";
$setglobal Period "12";

*Choose the numeraire value for the model
scalar num /1/;
* to stop the model at only 'STEPS' iterations
scalar STEPS /12/;
scalar IterLim 0 1 1e9 /0/;

* =================================================================
* ============ GDP CALIBRATION CONTROL FLAGS (CalGDP) =============
* =================================================================
* CalGDP   : if set to 1, an outer calibration loop iteratively adjusts
*            CFac(cnt) so that gdptest(cnt,'10') matches gdp(cnt).
*            If set to 0, the model is solved exactly once with the
*            CFac values currently stored in InputParameters.gms
*            (i.e. the original behaviour is preserved).
* MaxCalIter : maximum number of outer calibration iterations.
* CalTol     : convergence tolerance on max_cnt | gdp(cnt)/gdptest(cnt,'10') - 1 |.
* damping    : damping factor (0,1] applied to the CFac update rule
*              CFac(cnt) = CFac(cnt)*(1+(gdp(cnt)/gdptest(cnt,'10')-1)*damping).
*              Reduce below 1 if the iteration overshoots / cycles.
scalar CalGDP      flag - calibrate CFac to match gdp at step 12  /0/;
scalar MaxCalIter  maximum number of outer calibration iterations       /2/;
scalar CalTol      convergence tolerance for the calibration error      /1e-4/;
scalar damping     damping factor for the CFac update             /0.15/;
* Sign-aware nudge applied when CFac(cnt) is exactly zero. The plain
* multiplicative update would leave a zero base stuck at zero, so we kick it
* off the wall by +epsTFP (if more growth is needed) or -epsTFP (if less).
scalar epsTFP      nudge magnitude when CFac is exactly zero       /1e-4/;

display STEPS, P_S;
* fix that GDPt flag needs to be zero to activate the GDP
GDPt=1-GDPt;

*===========================================================
*====================== Model Starts =======================
*===========================================================

* 5) DATA HANDLING

set
samr(*)  rows and columns of sam (dynamic)
/
HOUS
GOVT
INV
STOCKS
Labour
Capital
tax_com
tax_sec
tdirect
tmarg
Trade
/

set
samd(*)  rows and columns of sam (dynamic)
/
HOUS
GOVT
INV
STOCKS
Labour
Capital
tax_com
tax_sec
tdirect
tmarg
Trade
/


cnt(*) regions in the model
com0(*) commodities and services
sec0(*) industries or sectors

com(*)
sec(*);

alias(samd,samh);

* ========== load the file to read ==========
$gdxin EuroSAMMF2
*$gdxin EuroSAM14

* ========== Load the indices for the main sets ==========
$load cnt
$load com0=com
$load sec0=sec

* ========== add the goods and indices to the samr matrix ==========
samr(com0)=yes;
samr(sec0)=yes;



Alias
(sec0,secc0)
(samr,samrr)
(sec,secc)
(cnt,cntt)
(com,comm)
;

*read the three main data tables
Parameter
SAMt(cnt,*,*)
TradeDatat(com0,*,*)
TradeMarginst(com0,*,*)
distrgood_share_public(*,*)
;

*FOR GDX INPUT
$load SAMt = SAM
$load TradeDatat = Trade
$load TradeMarginst = TTM


$gdxin

* this is to initialize the parameter ES to 0 in the first 4 periods.
* If ES=1 then the elasticities for the energy nest will become quasi-leontief
* even without using external shares and the solution will be different between the reference and the alternative scenarios.
scalar ES0 /0/;

* this value is updated at every step and enters the model
parameter eint(cnt) emission intensity over time in countries
eintFC(cnt) energy intensity for final consumption
cint(cnt,sec)  carbon intensity over time in countries;




parameter yS0(cnt,sec0,com0) detailed sectoral outputs;
parameter XD0(cnt,sec0) sectoral output;
parameter PD0(cnt,com0) good output;
yS0(cnt,sec0,com0)=SAMt(cnt,sec0,com0)   ;
XD0(cnt,sec0)         = sum(com0,yS0(cnt,sec0,com0)) ;
PD0(cnt,com0)         = sum(sec0,yS0(cnt,sec0,com0)) ;

parameter IOZ0(cnt,com0,sec0),CZ0(cnt,com0),CGZ0(cnt,com0),IZ0(cnt,com0);

IOZ0(cnt,com0,sec0)     = SAMt(cnt, com0, sec0) ;
CZ0(cnt, com0)             =  SAMt(cnt, com0, "HOUS");
CGZ0(cnt, com0)            = SAMt(cnt, com0, "GOVT");
IZ0(cnt, com0)             = SAMt(cnt, com0, "INV");

*b.        Definition of parameters to use in the model
Parameter
XDZ(cnt,sec)      sectoral outputs
XDDZ(cnt,sec,com) detailed sectoral outputs
IOZ(cnt,com,sec)  intermediate inputs
LZ(cnt,sec)       labour inputs
KZ(cnt,sec)       capital inputs

CZ(cnt,com)       households consumption
CGZ(cnt,com)      governmental consumption
CGLZ(cnt, com)     local governemnt consumption

IZ(cnt,com)       investments
SVZ(cnt,com)      changes in stocks

EROWZ(cnt,com)    exports
MROWZ(cnt,com)    imports
TRADEZ(com,cnt,cntt) trade flows
TMCRZ(com,cnt,cntt)  trade and transportmargins
EZ(cnt,com)       total exports

TMCZ(cnt,com)     transport and trade margins
TMXZ(cnt,com)     production of transport and trade margins

TTYZ(cnt)         income taxes
TRANSFZ(cnt)      government to households transfers
TRANSFGZ(cnt)     national to local government transfers

SHZ(cnt)          households savings
SGZ(cnt)         local governmental savings

CBUDGLZ(cnt)       local governmental consumption budget

SROWZ(cnt)        savings from RoW
INVZ(cnt,sec)     sectoral investments

TRROWZ(cnt)       net transfers to government (closing trade balance)
TRHROWZ(cnt)      net transfers to households (closing trade balance)

TAXCZ(cnt,com)    net taxes on products
TAXPZ(cnt,sec)    net taxes on production

LSZ(cnt)          initial labour endowment
KSZ(cnt)          initial capital endowment

CBUDZ(cnt)        households consumption budget
CBUDGZ(cnt)       governmental consumption budget

XZ(cnt,com)       total sales
XXDZ(cnt,com)     domestic products supply to domestic market

ITZ(cnt)          total investments
OGR(cnt)          oil and gas resources
CR(cnt)           coal resources
NGR(cnt)          natural gas resources
LR(cnt)           land resources;



*c.        Data reading
* ---- In plain words ----------------------------------------------------------------------
* Here the EDGAR pollution data for 2007 are read: the list of pollutants, the list of
* sources, and the amount of each pollutant from each source in each country (total and
* from biofuels). They are read before the sector lists, which refer to these sources.
* -------------------------------------------------------------------------------------------
* EDGAR air pollutant sets and data (pol, apsrc, APsrc07): read before the InputParameters
* file, which maps the EDGAR sources to its sectors (mapAPs, see section i.)
*   generated by prepare_air_pollutants.py: sets pol, apsrc, apcomb, apmix, apact;
*   parameters APsrc07 (total) and APsrcB07 (bio part), Gg
$include "AirPollutants2007.gms"
$include "InputParameters.gms"

* initialize it to one
eint(cnt)=1;
eintFC(cnt)=1;
cint(cnt,sec)=1;



Alias(samd,samdd);

*d.        Reaggregation of commodities and sectors.
parameter SAM1(cnt,*,*),SAM(cnt,*,*);
* Populating the SAM only using the initial elements (no sectors, no commodities)
SAM1(cnt,samdd,samr)=SAMt(cnt,samdd,samr);
SAM(cnt,samdd,samd)=SAM1(cnt,samdd,samd);

* including commodities and sectors in the index
samd(com)=yes;
samd(sec)=yes;

alias
(cnt,r)
(sec,s)
(com,g);

display samd,samr;


* Create aggregated SAM, trade data and trade margins data
SAM1(cnt,sec,samr)=sum(sec0$maps(sec0,sec),SAMt(cnt,sec0,samr));
SAM1(cnt,com,samr)=sum(com0$mapc(com0,com),SAMt(cnt,com0,samr));

SAM(cnt,samd,samdd)=SAM1(cnt,samd,samdd);
SAM(cnt,samd,sec)=sum(sec0$maps(sec0,sec),SAM1(cnt,samd,sec0));
SAM(cnt,samd,com)=sum(com0$mapc(com0,com),SAM1(cnt,samd,com0));

parameter tradeData(com,*,*);
tradeData(com,cnt,cntt)=sum(com0$mapc(com0,com),tradeDatat(com0,cnt,cntt));
tradeData(com,cnt,"ROW")=sum(com0$mapc(com0,com),tradeDatat(com0,cnt,"ROW"));
tradeData(com,"ROW",cntt)=sum(com0$mapc(com0,com),tradeDatat(com0,"ROW",cntt));

parameter TradeMargins(com,cnt,cntt);
TradeMargins(com,cnt,cntt)=sum(com0$mapc(com0,com),TradeMarginst(com0,cnt,cntt));


* ===================== check if SAM is balanced ===============================
Parameter SAM_balance(cnt,*) ;
SAM_balance(cnt,samd) =  sum(samdd,SAM(cnt,samd,samdd))
       -  sum(samdd,SAM(cnt,samdd,samd)) ;
display SAM_balance;
*execute_unload "sambalance.gdx" SAM_balance;
*execute_unload "newSAM.gdx" SAM1,SAM,tradeData,TradeMargins,SAM_balance;

* ===== Calculate initial levels of variables for calibration ==================


*e.        Assignment of parameters
XDDZ(cnt,sec,com)    = SAM(cnt,sec,com)   ;

XDZ(cnt,sec)         = sum(com,XDDZ(cnt,sec,com)) ;
IOZ(cnt,com,sec)     = SAM(cnt, com, sec) ;
CZ(cnt, com)             =  SAM(cnt, com, "HOUS");
CGZ(cnt, com)            = SAM(cnt, com, "GOVT");
IZ(cnt, com)             = SAM(cnt, com, "INV");
LZ(cnt,sec)          = SAM(cnt,'Labour',sec);
KZ(cnt,sec)          = SAM(cnt,'Capital',sec);

* split the capital remuneration of oil and gas from the general capital
parameter AOGR(cnt), ACR(cnt),ANGR(cnt),ALR(cnt) available resources (oil and gas coil natural gas and land);

OGR(cnt)             = 0.5*KZ(cnt,"iCOI");
KZ(cnt,"iCOI")     = 0.5*KZ(cnt,"iCOI");
NGR(cnt)             = 0.5*KZ(cnt,"iNG");
KZ(cnt,"iNG")       = 0.5*KZ(cnt,"iNG");
CR(cnt)              = 0.5*KZ(cnt,"iCOA");
KZ(cnt,"iCOA")     = 0.5*KZ(cnt,"iCOA");

* initialize the available resources with the values featured in the sectors (resources used = resources available)
AOGR(cnt)=OGR(cnt);
ACR(cnt)=CR(cnt);
ANGR(cnt)=NGR(cnt);
*ALR(cnt)=LR(cnt);
parameter AOGR0(cnt),ACR0(cnt),ANGR0(cnt),ALR0(cnt);
AOGR0(cnt)=OGR(cnt);
ACR0(cnt)=CR(cnt);
ANGR0(cnt)=NGR(cnt);
*ALR0(cnt)=LR(cnt);


parameter Rp(cnt) Renewable sector productivity;
* set to 1 for benchmarking
Rp(cnt)=1;

*Feb26
parameter GG(cnt,sec);
GG(cnt,sec)=1;


parameter CPD(cnt) climate change induced labour productivity;
CPD(cnt)=0;

display CZ;
* Identify sectors with negative capital returns
Parameter negcap(cnt,sec) ;
negcap(cnt,sec)$(KZ(cnt,sec) lt 0) = 1 ;

* Generate positive returns to capital
Parameter KZ_old(cnt,sec) ;
KZ_old(cnt,sec) = KZ(cnt,sec) ;
KZ(cnt,sec)$negcap(cnt,sec) = sum(secc$(KZ(cnt,secc) gt 0),KZ(cnt,secc) )
                     /sum(secc$(KZ(cnt,secc) gt 0),XDZ(cnt,secc) )
                     *XDZ(cnt,sec) ;

SVZ(cnt,com)         = SAM(cnt,com,'STOCKS') ;

display LZ,KZ;

*Read initial consumption figures from SAM
ITZ(cnt)             = sum(com, SAM(cnt,com, "INV"));
CBUDZ(cnt)           = sum(com, SAM(cnt,com, "HOUS"))  ;


*Define the local governments budget
CBUDGLZ(cnt)  = sum(com, SAM(cnt,com, "GOVT"))  ;


*Define Local Government Consumption
CGLZ(cnt, com) = CGZ(cnt, com);
CGLZ(cnt, "pH2") = 0 ;

EROWZ(cnt,com)       = TradeData(com,cnt,'ROW') ;
MROWZ(cnt,com)       = TradeData(com,'ROW',cnt) ;
EROWZ(cnt, "pH2") = 0 ;
MROWZ(cnt, "pH2") = 0 ;

TRADEZ(com,cnt,cntt) = TradeData(com,cnt,cntt) ;
TMCRZ(com,cnt,cntt)  = TradeMargins(com,cnt,cntt) ;
TRADEZ("pH2",cnt,cntt) = 0 ;
TMCRZ("pH2",cnt,cntt) = 0;

* Compute domestic Supply to Domestic Market (XXDZ)
XXDZ(cnt,com)        = sum(sec,XDDZ(cnt,sec,com))- EROWZ(cnt,com) - sum(cntt,TRADEZ(com,cnt,cntt));

loop ((com,cnt), TRADEZ(com, cnt, cnt) = 0);

TMCZ(cnt,com)        = SAM(cnt,'tmarg',com) ;
TMXZ(cnt,com)        = SAM(cnt,com,'tmarg') ;
TMCZ(cnt,"pH2")        = 0 ;
TMXZ(cnt,"pH2")        = 0 ;

TTYZ(cnt)            = SAM(cnt,'tdirect','HOUS') ;
TRANSFZ(cnt)         = SAM(cnt,'HOUS','GOVT') - SAM(cnt, 'GOVT', 'HOUS') ;

TRROWZ(cnt)          = SAM(cnt,'GOVT','Trade') - SAM(cnt,'Trade','GOVT') ;
TRHROWZ(cnt)         = SAM(cnt,'HOUS','Trade') - SAM(cnt,'Trade','HOUS') ;

SHZ(cnt)             = SAM(cnt,'INV','HOUS') ;
SGZ(cnt)             = SAM(cnt,'INV','GOVT') ;

SROWZ(cnt)           = SAM(cnt,'INV','Trade') - SAM(cnt,'Trade','INV') ;

TAXCZ(cnt,com)       = SAM(cnt,'tax_com',com) ;
TAXPZ(cnt,sec)       = SAM(cnt,'tax_sec',sec) ;

INVZ(cnt,sec)        = SAM(cnt,'INV',sec) ;

LSZ(cnt)             = sum(sec,LZ(cnt,sec)) ;
KSZ(cnt)             = sum(sec,KZ(cnt,sec)) ;

* Save the initial value for capital and labour
parameter KSZ0(cnt), LSZ0(cnt);
KSZ0(cnt)=KSZ(cnt);
LSZ0(cnt)=LSZ(cnt);

* Compute initial sectoral value added both in value and percentage.
parameter sVA(cnt,sec),sVAperc(cnt,sec);
sVA(cnt,sec)=(LZ(cnt,sec)+LZ(cnt,sec)+TAXPZ(cnt,sec));
sVAperc(cnt,sec)=(LZ(cnt,sec)+LZ(cnt,sec)+TAXPZ(cnt,sec))/sum(secc,LZ(cnt,secc)+LZ(cnt,secc)+TAXPZ(cnt,secc));
*execute_unload "InitialVA.gdx", sVA,sVAperc;



*Define the Fix for potential Trade Margins' Imbalance in the SAM
Parameter
TMFIX(cnt)
TMFIXC(cnt, com);

TMFIX(cnt) = -sum(com, TMCZ(cnt, com)) + sum(com, TMXZ(cnt, com));
TMFIXC(cnt, com)$(sum(sec,IOZ(cnt,com,sec))
                  +  CZ(cnt,com) +  CGZ(cnt,com) +  IZ(cnt,com)) =
                         TMFIX(cnt)*(sum(sec,IOZ(cnt,com,sec))+  CZ(cnt,com) +  CGZ(cnt,com) +
                                                 IZ(cnt,com))/
                                 sum(comm, sum(sec,IOZ(cnt,comm,sec))+  CZ(cnt,comm) +  CGZ(cnt,comm) +
                                                                 IZ(cnt,comm)) ;

* Adjust consumption figures for taxes and trade margins
* Here it is basically decreasing the value of the commodities to eliminate the effect of consumption taxes.
* These will be included back as mark-ups in the CGE model
Parameters
TOTALCONSZ(cnt,com)   total taxed consumption
TAXTOTALZ(cnt,com)    sum of taxes and margins
;

TOTALCONSZ(cnt,com)   = sum(sec,IOZ(cnt,com,sec)) +  CZ(cnt,com) +  CGZ(cnt,com) + IZ(cnt,com) ;

TAXTOTALZ(cnt,com)    =  TAXCZ(cnt,com) ;

display TMCZ, TAXCZ, totalconsz, taxtotalz;


IOZ(cnt,com,sec)$TOTALCONSZ(cnt,com)
                                 = IOZ(cnt,com,sec) - TAXTOTALZ(cnt,com)*IOZ(cnt,com,sec)/TOTALCONSZ(cnt,com) ;
CZ(cnt,com)$TOTALCONSZ(cnt,com)
                                 = CZ(cnt,com) - TAXTOTALZ(cnt,com)*CZ(cnt,com)/TOTALCONSZ(cnt,com) ;
CGZ(cnt,com)$TOTALCONSZ(cnt,com)
                                 = CGZ(cnt,com) - TAXTOTALZ(cnt,com)*CGZ(cnt,com)/TOTALCONSZ(cnt,com) ;
IZ(cnt,com)$TOTALCONSZ(cnt,com)
                                 = IZ(cnt,com) - TAXTOTALZ(cnt,com)*IZ(cnt,com)/TOTALCONSZ(cnt,com) ;

CGLZ(cnt,com)$(TOTALCONSZ(cnt,com) and  CGLZ(cnt,com))
                                 = CGLZ(cnt,com) - TAXTOTALZ(cnt,com)*CGLZ(cnt,com)/TOTALCONSZ(cnt,com) ;


* HERE WE FIND INDICES FOR POSSIBLE IOZ NEGATIVE VALUES
parameter
possec
poscom
poscnt
amnt;

* check there there are no negative values
loop ((cnt,com),
   if ((CZ(cnt,com) lt 0) and (abs(CZ(cnt,com)) gt 1e-5) ,
         CZ(cnt, com) = 0;
         poscom = ord(com);
         poscnt = ord(cnt);
         amnt = CZ(cnt,com)
         display amnt;
          abort "check CZ(cnt,com) "
   );
   if ((CGZ(cnt,com) lt 0) and (abs(CGZ(cnt,com)) gt 1e-5) ,
         CGZ(cnt, com) = 0;
         poscom = ord(com);
         poscnt = ord(cnt);
         amnt = CGZ(cnt,com)
         display amnt;
          abort "CGZ(cnt,com) "
   );
   if ((IZ(cnt,com) lt 0) and (abs(IZ(cnt,com)) gt 1e-5) ,
         IZ(cnt, com)= 0;
         poscom = ord(com);
         poscnt = ord(cnt);
         amnt = IZ(cnt,com)
         display amnt;
          abort "IZ(cnt,com) "
   );
loop (sec,
   if ((IOZ(cnt,com,sec) lt 0) and (abs(IOZ(cnt,com,sec)) gt 1e-5) ,
         possec = ord(sec);
         poscom = ord(com);
         poscnt = ord(cnt);
         amnt = IOZ(cnt, com, sec);
         IOZ(cnt, com, sec) = 0;
         display amnt;
          abort "check IOZ(cnt,com,sec)"
   );
);
);

* for each commodity and country
* compute percentage trade margins over consumption (trmz) and total sales (XZ)
* CZ, CGZ, IZ and IOZ have already been reduced for the effect of the taxes
* =========== Calculate transport and trade margins ============================
Parameter
trmz(cnt,com) initial transport and trade margins
trm(cnt,com) transport and trade margins
;

trmz(cnt,com)$(sum(sec,IOZ(cnt,com,sec))+  CZ(cnt,com) +  CGZ(cnt,com)+  IZ(cnt,com)) =
                 (TMCZ(cnt,com))/(sum(sec,IOZ(cnt,com,sec))+  CZ(cnt,com) +  CGZ(cnt,com) +  IZ(cnt,com)) ;

trm(cnt,com) = trmz(cnt,com) ;

*f.        Balance checks

* ========== Check trade flows balance =========================================
XZ(cnt,com) =  sum(sec,IOZ(cnt,com,sec)) +  CZ(cnt,com) +  CGZ(cnt,com)
               + TMXZ(cnt,com) + IZ(cnt,com) + SVZ(cnt,com) ;



Parameter
check_tradebal(cnt,com) sales equal domestic supply plus imports
check_tradebal_2(cnt,com) outputs equal domestic products supply + Export to ROW and Export other countries
;

check_tradebal(cnt,com) = XZ(cnt,com) - ( XXDZ(cnt,com) + MROWZ(cnt,com)
   + sum(cntt, TRADEZ(com,cntt,cnt)) ) ;




check_tradebal_2(cnt,com) = sum(sec,XDDZ(cnt,sec,com))- XXDZ(cnt,com)- EROWZ(cnt,com) -
               sum(cntt, TRADEZ(com,cnt,cntt)) ;

Execute_unload "sjekk_tradebal" XZ,XXDZ,MROWZ,TRADEZ,check_tradebal,check_tradebal_2;

EZ(cnt,com) =  EROWZ(cnt,com) + sum(cntt,TRADEZ(com,cnt,cntt)) ;

*g.        Calculation of initial tax rates
* ====== Calculate the levels of  taxes ========================================
Parameter
taxcz(cnt,com) initial taxes on products
taxpz(cnt,sec) initial taxes on production

taxc(cnt,com) taxes on products
taxp(cnt,sec) taxes on production

tyz(cnt)      initial tax on income
ty(cnt)       tax on income
;

taxcz(cnt,com)$(sum(sec,IOZ(cnt,com,sec))+  CZ(cnt,com) +  CGZ(cnt,com) +  IZ(cnt,com)) =
                  TAXCZ(cnt,com)/( (sum(sec,IOZ(cnt,com,sec))  +  CZ(cnt,com) +  CGZ(cnt,com)+  IZ(cnt,com)) ) ;

taxpz(cnt,sec)$XDZ(cnt,sec) =   TAXPZ(cnt,sec)/XDZ(cnt,sec) ;

*h.        Calculation of baseline CO2 emissions
* =================== Calculate CO2 Emissions =================================

* https://www.eea.europa.eu/data-and-maps/data/data-viewers/greenhouse-gases-viewer
Parameter
CO2B(cnt)         co2 budget
CO2P(cnt,com,sec) co2 payments per commodity and sector
CO2H(cnt,com)     HOUSEHOLDS CO2 PAYMENT
CO2G(cnt,com)     GOVERNMENT CO2 PAYMENT
CO2I(cnt,com)     INVESTMENTS CO2 PAYMENT
CO2r(cnt,com,*)         emission factors;

Parameter
CO2Emissions(cnt,com,*),EmissionTest(cnt,com,*);

$gdxin 'Co2Emission'
*FOR GDX INPUT
$load CO2Emissions
$gdxin



* rough estimation of emissions in 2005
*CO2Emissions(cnt,com,sec)=CO2Emissions(cnt,com,sec);
*CO2Emissions(cnt,com,"HOUS")=CO2Emissions(cnt,com,"HOUS");
*CO2Emissions(cnt,com,"INV")=CO2Emissions(cnt,com,"INV");
*CO2Emissions(cnt,com,"GOVT")=CO2Emissions(cnt,com,"GOVT");
*CO2Emissions(cnt,com,"tmarg")=CO2Emissions(cnt,com,"tmarg");


* we do not care anymore on how the emissions have been allocated in GENeSyS-MOD: here we reallocate them based on the SAM
*CO2Fuel(cnt,com)=sum(sec,CO2Emissions(cnt,com,sec))+CO2Emissions(cnt,com,"HOUS")+CO2Emissions(cnt,com,"INV")+CO2Emissions(cnt,com,"GOVT");
*CO2r(cnt,com,sec)=0;

* distribute the impact of each fuel per sector based on its usage
CO2r(cnt,com,sec)$(fosfuels(com))=CO2Fuel(cnt,com)/(sum(secc,SAM(cnt,com,secc))+SAM(cnt,com,"HOUS")+SAM(cnt,com,"INV")+SAM(cnt,com,"GOVT")+SAM(cnt,com,"tmarg"));
CO2r(cnt,com,"HOUS")$(SAM(cnt,com,"HOUS") and fosfuels(com))=CO2Fuel(cnt,com)/(sum(secc,SAM(cnt,com,secc))+SAM(cnt,com,"HOUS")+SAM(cnt,com,"INV")+SAM(cnt,com,"GOVT")+SAM(cnt,com,"tmarg"));
CO2r(cnt,com,"INV")$(SAM(cnt,com,"INV") and fosfuels(com))=CO2Fuel(cnt,com)/(sum(secc,SAM(cnt,com,secc))+SAM(cnt,com,"HOUS")+SAM(cnt,com,"INV")+SAM(cnt,com,"GOVT")+SAM(cnt,com,"tmarg"));
CO2r(cnt,com,"GOVT")$(SAM(cnt,com,"GOVT") and fosfuels(com))=CO2Fuel(cnt,com)/(sum(secc,SAM(cnt,com,secc))+SAM(cnt,com,"HOUS")+SAM(cnt,com,"INV")+SAM(cnt,com,"GOVT")+SAM(cnt,com,"tmarg"));
CO2r(cnt,com,"tmarg")$(SAM(cnt,com,"tmarg") and fosfuels(com))=CO2Fuel(cnt,com)/(sum(secc,SAM(cnt,com,secc))+SAM(cnt,com,"HOUS")+SAM(cnt,com,"INV")+SAM(cnt,com,"GOVT")+SAM(cnt,com,"tmarg"));

EmissionTest(cnt,com,sec)$(fosfuels(com))=CO2r(cnt,com,sec)*SAM(cnt,com,sec);
EmissionTest(cnt,com,"HOUS")$(fosfuels(com))=CO2r(cnt,com,"HOUS")*SAM(cnt,com,"HOUS");
EmissionTest(cnt,com,"INV")$(fosfuels(com))=CO2r(cnt,com,"INV")*SAM(cnt,com,"INV");
EmissionTest(cnt,com,"GOVT")$(fosfuels(com))=CO2r(cnt,com,"GOVT")*SAM(cnt,com,"GOVT");
EmissionTest(cnt,com,"tmarg")$(fosfuels(com))=CO2r(cnt,com,"tmarg")*SAM(cnt,com,"tmarg");

execute_unload 'CO2factors.gdx' CO2r,CO2Fuel,EmissionTest;
parameter CO2rs(cnt,com,sec) save parameter;
CO2rs(cnt,com,sec)=CO2r(cnt,com,sec);

CO2P(cnt,com,sec)=0;
CO2H(cnt,com)=0;
CO2I(cnt,com)=0;
CO2G(cnt,com)=0;

CO2P(cnt,com,sec)$(FF(com) eq 1 )     = IOZ(cnt,com,sec)*CO2r(cnt,com,sec);
CO2H(cnt,com)$(FF(com) eq 1 )         = CZ(cnt,com)*CO2r(cnt,com,"HOUS");
CO2G(cnt,com)$(FF(com) eq 1 )         = CGLZ(cnt,com)*CO2r(cnt,com,"GOVT");
CO2I(cnt,com)$(FF(com) eq 1 )         = IZ(cnt,com)*CO2r(cnt,com,"INV");


display CO2P,CO2H,CO2G,CO2I;
CO2B(cnt)=0;

*i.        Calculation of baseline air pollutant emissions (EDGAR v8.1, 2007)
* =================== Calculate air pollutant emission factors ==================
* ---- In plain words ----------------------------------------------------------------------
* This part of the model works out how much air pollution (fine particles, nitrogen oxides,
* sulphur dioxide, ammonia and five more pollutants) each fuel and each activity causes.
* - EDGAR tells us how much each country emitted in 2007, broken down by source (power
*   plants, factories, road traffic, homes, farms, waste...).
* - For pollution from burning fuels, each source's amount is shared among the fuels burnt
*   there and the buyers of those fuels. A fuel and technology that pollute more (coal in an
*   old stove, diesel in a lorry) get a bigger share, using the European emission guidebook.
* - Pollution not caused by burning fuels (farming, industrial processes, waste, road dust)
*   is tied to how much each industry produces.
* - The result is a "pollution per unit of fuel" for every fuel and buyer, and a "pollution
*   per unit of output" for every industry. The model uses them every year to compute
*   emissions and, when a country has a pollution cap, the permits each buyer needs.
* - A final check makes sure that, in the starting year, the model reproduces EDGAR exactly.
* -------------------------------------------------------------------------------------------
* See README_AirPollutants.md. Emissions are in Gg (= kt); SAM values in model units.
* - Combustion sources (apcomb, apmix) are split group by group (1.A.1.a, 1.A.1.bc, 1.A.2,
*   1.A.3.a-e, 1.A.4+5) over the granular SAM fuel uses of that group, in proportion to
*   energy use x EMEP/EEA Guidebook factor (AirPollutantEF.gms). The result is aggregated
*   with maps/mapc, so the emission factor APr(cnt,pol,com,user) differs by user, as CO2r.
* - All other sources (apact) are attached to the activity of the sectors in
*   mapAPs, split by benchmark output when a source maps to several sectors.
* - With APbio = 1 the bio part of the combustion sources (APsrcB07) is split separately
*   over the C-BIO purchases of the group's users (weights C-BIO use x Guidebook biomass
*   factor) and gives factors APr for the bio fuel (APbiocom). Groups with bio emissions but
*   no C-BIO use keep them on their fossil fuels. Activity sources keep fossil + bio.
* The sector-specific choices (mapAPs, APfbsec, mapAPr, APbiocom) are set in the InputParameters file.
* AirPollutants2007.gms (pol, apsrc, APsrc07) is included before the InputParameters file.

* ---- In plain words ----------------------------------------------------------------------
* Here the emission guidebook data are read: pollution per unit of energy for each fuel and
* technology, and which technology each buyer of fuel uses.
* -------------------------------------------------------------------------------------------
*   Guidebook factors APgb/APbiogb, technologies aptech, source groups apblk and the
*   user/fuel mappings aptechU, apfc0, aproad0, apnoroad, apbio0 (see that file)
$include "AirPollutantEF.gms"

* ---- In plain words ----------------------------------------------------------------------
* Here three safety checks stop the run if the EDGAR sources are not linked correctly:
* every non-burning source must belong to an industry, no burning source may be tied to an
* industry's output, and every burning source must belong to a group.
* -------------------------------------------------------------------------------------------
*   check: every activity-related source (apact) is mapped to at least one sector in mapAPs
abort$sum(apact$(not sum(sec$mapAPs(apact,sec),1)),1) "an activity-related EDGAR source is not mapped to any sector in mapAPs";
*   check: mapAPs contains only activity-related sources (combustion goes through the fuels)
abort$sum((apsrc,sec)$(mapAPs(apsrc,sec) and not apact(apsrc)),1)
*   message printed when the check fails
         "mapAPs maps a combustion EDGAR source to a sector: only activity-related sources (apact) belong there";
*   check: every combustion source (apcomb, apmix) belongs to a source group in mapsrcblk
abort$sum(apsrc$((apcomb(apsrc) or apmix(apsrc)) and not sum(apblk$mapsrcblk(apsrc,apblk),1)),1)
*   message printed when the check fails
         "a combustion EDGAR source is not assigned to a source group in mapsrcblk (AirPollutantEF.gms)";

* ---- In plain words ----------------------------------------------------------------------
* Here the lists used in the calculation are declared: who buys fuel (industries in full
* detail, households, government, investment, transport services), which detailed fuels
* are fossil, and which technology each fuel purchase is burnt in.
* -------------------------------------------------------------------------------------------
*   final users of fuel in the SAM besides the sectors
set apfd final users of fuel / HOUS, GOVT, INV, tmarg /
*   granular users: the 35 SAM sectors (sec0) and the final users
    apu0(*)               granular fuel users: SAM sectors and final users
*   model users: the model sectors (sec) and the final users
    apmu(*)               model fuel users: sectors and final users
*   mapping granular user -> model user (maps for sectors, identity for final users)
    apumap(*,*)           granular fuel user to model fuel user
*   granular fuels that belong to a model fossil fuel and have a Guidebook fuel class
    apfos0(com0)          granular fuels belonging to a model fossil fuel
*   (granular fuel, granular user, technology): the Guidebook technology of each fossil fuel use
    apcell(com0,*,aptech) Guidebook technology of each granular fuel use
*   fuel uses found in the SAM without a technology (must be empty, see the abort below)
    apmiss(com0,*)        granular fuel uses without a Guidebook technology
* ---- In plain words ----------------------------------------------------------------------
* Two new lists: which technology (stove, boiler, power plant...) each user of biofuel has,
* and which fuels carry pollution: coal, oil and gas, plus biofuel when the switch is on.
* -------------------------------------------------------------------------------------------
*   (granular bio fuel, granular user, Guidebook technology) triples, filled below from aptechU
    apcellB(com0,*,aptech) Guidebook technology of each granular bio fuel use
*   model fuels that get combustion emission factors APr: fosfuels plus APbiocom when APbio = 1
    apcom(com)            fuels with combustion emission factors: fossil fuels and with APbio = 1 the bio fuel;
*   apany: any label, used to check the users named in aptechU
alias (*,apany);

* ---- In plain words ----------------------------------------------------------------------
* Here the lists are filled in, and three more checks stop the run if a fossil fuel has no
* guidebook fuel type, or if the technology list names a buyer that does not exist or gives
* a buyer two technologies.
* -------------------------------------------------------------------------------------------
*   granular users: all SAM sectors
apu0(sec0) = yes;
*   ... and the final users
apu0(apfd) = yes;
*   model users: all model sectors
apmu(sec)  = yes;
*   ... and the final users
apmu(apfd) = yes;
*   each SAM sector maps to its model sector (maps, from the InputParameters file)
apumap(sec0,sec)$maps(sec0,sec) = yes;
*   each final user maps to itself
apumap(apfd,apfd) = yes;
*   fossil granular fuels: those with a Guidebook fuel class (apfc0) that map to a model fossil fuel
apfos0(com0)$sum(apfc$apfc0(com0,apfc),1) = yes$sum(com$(mapc(com0,com) and fosfuels(com)),1);
*   check: every granular fuel of a model fossil fuel has a Guidebook fuel class
abort$sum(com0$(sum(com$(mapc(com0,com) and fosfuels(com)),1) and not sum(apfc$apfc0(com0,apfc),1)),1)
*   message printed when the check fails
         "a granular SAM fuel of a model fossil fuel has no Guidebook fuel class in apfc0 (AirPollutantEF.gms)";
*   check: every user named in aptechU exists in the SAM
abort$sum((aptech,apany)$(aptechU(aptech,apany) and not apu0(apany)),1)
*   message printed when the check fails
         "aptechU (AirPollutantEF.gms) names a fuel user that is not in the SAM";
*   check: no user has more than one technology
abort$sum(apu0$(sum(aptech$aptechU(aptech,apu0),1) gt 1),1)
*   message printed when the check fails
         "a fuel user has more than one Guidebook technology in aptechU (AirPollutantEF.gms)";

* ---- In plain words ----------------------------------------------------------------------
* Here each purchase of fossil fuel gets the technology it is burnt in. As a rule this is
* the buyer's technology, but petrol and diesel count as road vehicles for almost every
* buyer, because EDGAR counts all road vehicles as road transport, whoever owns them.
* -------------------------------------------------------------------------------------------
* technology of each granular fuel use: by user, except road fuels (aproad0)
*   every fossil fuel use takes the technology of its user
apcell(com0,apu0,aptech)$(apfos0(com0) and aptechU(aptech,apu0)) = yes;
*   gasoline and diesel (aproad0) bought by users not in apnoroad are road transport (1A3b) instead;
*   yes$sameas(...) also removes the user technology assigned on the line above
apcell(com0,apu0,aptech)$(apfos0(com0) and aproad0(com0) and not apnoroad(apu0)) = yes$sameas(aptech,'1A3b');

* ---- In plain words ----------------------------------------------------------------------
* Here each buyer of biofuel gets the technology it burns it in: households use stoves,
* offices and farms use boilers, factories use industrial boilers, and so on. Then the
* list of polluting fuels is set, and two safety checks stop the run if the biofuel data
* do not fit the model.
* -------------------------------------------------------------------------------------------
*   bio fuel uses take the technology of their user (aptechU); unlike gasoline and diesel there is
*   no road-fuel rule, so only the purchases of C_TLND count as road transport (1A3b)
apcellB(com0,apu0,aptech)$(apbio0(com0) and aptechU(aptech,apu0)) = yes;
*   fuels with emission factors: the fossil fuels, plus the bio fuel commodity when APbio = 1
apcom(com)$(fosfuels(com) or (APbiocom(com) and APbio eq 1)) = yes;
*   check: every granular bio fuel (apbio0) must map through mapc to a commodity in APbiocom,
*   otherwise its emissions would have no model fuel to sit on
abort$(APbio eq 1 and sum(com0$(apbio0(com0) and not sum(com$(mapc(com0,com) and APbiocom(com)),1)),1))
*   message printed when the check fails
         "a granular bio fuel (apbio0, AirPollutantEF.gms) does not map to a bio fuel commodity in APbiocom";
*   check: the bio fuel must have no transport-margin use (tmarg), because the TRANSP block
*   has no permit line for it and those emissions would be lost
abort$(APbio eq 1 and sum((cnt,com0)$apbio0(com0), max(0,SAMt(cnt,com0,"tmarg"))))
*   message printed when the check fails
         "the bio fuel has a transport-margin use, but TRANSP has no bio fuel permit line";

* ---- In plain words ----------------------------------------------------------------------
* Here the storage boxes for all the numbers of this part are declared: total 2007
* pollution, fuel purchases and their energy content, how pollution is shared, the
* resulting pollution per unit of fuel and of output, and the checks.
* -------------------------------------------------------------------------------------------
Parameter
*   EDGAR 2007 total per country and pollutant (sum over sources)
APbase07(cnt,pol)       EDGAR 2007 emissions (Gg)
*   fossil fuel purchase of each granular user (SAM, negative entries set to 0)
APX0(cnt,com0,*)        granular gross fuel use (SAM)
*   CO2 of a model fuel per unit of its gross purchase (the same for all users)
APco2X(cnt,com)         CO2Fuel per unit of gross fuel use
*   energy content of each granular fuel use, from CO2 and the IPCC CO2 factor per energy
APen0(cnt,com0,*)       granular energy use (CO2Fuel units per t CO2 per TJ)
*   weight of each fossil fuel use in the split: energy x Guidebook factor
APw0(cnt,pol,com0,*)    granular weight: energy use x Guidebook factor
*   emissions of each combustion source group to be split over its fossil fuels
APblkE(cnt,pol,apblk)   EDGAR emissions of each combustion source group (Gg)
*   total weight of each source group: denominator of the split
APblkW(cnt,pol,apblk)   sum of weights in each source group
*   total energy of each source group: used when no fuel of the group has a Guidebook factor
APblkN(cnt,apblk)       energy use in each source group
*   emissions of groups with no fuel purchase at all in a country's SAM
APorph(cnt,pol)         emissions of source groups without fuel use in the SAM (Gg)
*   emissions assigned before the orphan groups: base for spreading APorph
APtot0(cnt,pol)         combustion emissions allocated before the orphan groups (Gg)
*   result of the fossil split: emissions of each granular fuel use
APcomb0(cnt,pol,com0,*) combustion emissions of each granular fuel use (Gg)
*   fuel quantity per model fuel and user as it enters MPSGE: denominator of APr
APq(cnt,com,*)          benchmark fuel use entering MPSGE (net of taxes)
*   emissions per model fuel and user: aggregation of APcomb0 (and APcombB0)
APfuel(cnt,pol,com,*)   combustion emissions of each fuel and model user (Gg)
*   activity (non-combustion) emissions assigned to each sector
APsec(cnt,pol,sec)      activity emissions attributed to each sector (Gg)
*   combustion factor: emissions per unit of fuel, by user (used in MPSGE and reports)
APr(cnt,pol,com,*)      combustion emission factors (Gg per unit of fuel)
*   activity factor: emissions per unit of sector output (used in MPSGE and reports)
EFact(cnt,pol,sec)      activity emission factors (Gg per unit of output)
*   benchmark check: EDGAR total, model combustion, activity and difference
APcheck(cnt,pol,*)      benchmark emissions: EDGAR vs model
*   threshold of the current step: endowment of permits in MPSGE (0 = no cap)
APB(cnt,pol)            active air pollutant threshold in the current step (Gg)
* ---- In plain words ----------------------------------------------------------------------
* New storage boxes for the biofuel calculation: an on/off flag per country, the biofuel
* pollution of each group of sources, how much biofuel each user buys, how the pollution is
* shared among them, and two control figures used to check the result.
* -------------------------------------------------------------------------------------------
*   per country and step: 1 where the bio fuel carries permits (APbio = 1 and a threshold), which
*   switches on its own Leontief nest in REMES_MPSGE_alt.gms
APbioOn(cnt)            1 if the bio fuel carries air pollutant permits in the current step (APbio = 1 and a threshold)
*   bio part of the EDGAR emissions of each combustion source group (sum of APsrcB07 over its sources)
APblkEB(cnt,pol,apblk)  EDGAR bio emissions of each combustion source group (Gg) - APbio = 1
*   C-BIO purchases of each granular user, taken from the SAM (negative entries set to 0)
APXB0(cnt,com0,*)       granular gross bio fuel use (SAM)
*   weight of each C-BIO use in the split: purchase times Guidebook solid-biomass factor
APwB0(cnt,pol,com0,*)   granular bio weight: bio fuel use x Guidebook biomass factor
*   total weight of a source group: denominator of the split
APblkWB(cnt,pol,apblk)  sum of bio weights in each source group
*   total C-BIO purchases of a source group: used only for the diagnostic APbioInt
APblkXB(cnt,apblk)      bio fuel use in each source group
*   result of the split: bio emissions of each granular C-BIO use
APcombB0(cnt,pol,com0,*) bio combustion emissions of each granular bio fuel use (Gg)
*   bio emissions of a group that has no C-BIO use: they are added back to its fossil part
APbioFB(cnt,pol,apblk)  bio emissions of groups without bio fuel use - kept on the fossil fuels (Gg)
*   diagnostic: bio emissions per unit of C-BIO purchase of each group (shows the country spread)
APbioInt(cnt,pol,apblk) bio emissions per unit of bio fuel use in each source group (Gg per unit);

* ---- In plain words ----------------------------------------------------------------------
* Here the total 2007 pollution of each country is added up from all its sources.
* -------------------------------------------------------------------------------------------
*   national total of each pollutant: sum of APsrc07 over all EDGAR sources
APbase07(cnt,pol) = sum(apsrc, APsrc07(cnt,apsrc,pol));

* ---- In plain words ----------------------------------------------------------------------
* Here the fossil fuel purchases of every buyer are taken from the accounting tables of the
* economy, and the run stops if some purchase has no technology to burn it in.
* -------------------------------------------------------------------------------------------
*   fossil fuel purchase of each granular user from the SAM (negative entries set to 0)
APX0(cnt,com0,apu0)$apfos0(com0) = max(0, SAMt(cnt,com0,apu0));
*   fuel uses with a purchase in some country but no technology in apcell
apmiss(com0,apu0)$(sum(cnt,APX0(cnt,com0,apu0)) and not sum(aptech,apcell(com0,apu0,aptech))) = yes;
*   print them in the listing (should be empty)
display apmiss;
*   check: stop if any fuel use has no technology
abort$card(apmiss) "a granular fuel use has no Guidebook technology: add its user to aptechU (AirPollutantEF.gms)";

* ---- In plain words ----------------------------------------------------------------------
* Here each fuel purchase, recorded in money, is turned into energy. This uses the model's
* own CO2 data: the CO2 a purchase causes, divided by the CO2 per unit of energy of that
* fuel, gives its energy. Then each purchase gets a weight: its energy times the guidebook
* pollution per unit of energy of its fuel and technology.
* -------------------------------------------------------------------------------------------
* energy: the model's CO2 per unit of fuel divided by the CO2 per GJ of each granular fuel
*   CO2 per unit of gross purchase of each model fuel: CO2Fuel / total gross purchases of its granular fuels
APco2X(cnt,com)$(fosfuels(com) and sum((com0,apu0)$mapc(com0,com),APX0(cnt,com0,apu0)))
*   (continuation) numerator and denominator of that ratio
         = CO2Fuel(cnt,com)/sum((com0,apu0)$mapc(com0,com),APX0(cnt,com0,apu0));
*   energy of each granular fuel use: purchase x CO2 per unit of purchase / IPCC CO2 per TJ (APco2f)
APen0(cnt,com0,apu0)$APX0(cnt,com0,apu0)
*   (continuation) the sum picks the model fuel of the granular fuel (mapc)
         = APX0(cnt,com0,apu0)*sum(com$mapc(com0,com),APco2X(cnt,com))/APco2f(com0);
*   weight of each fossil fuel use: energy x Guidebook factor of its technology and fuel class
APw0(cnt,pol,com0,apu0)$APen0(cnt,com0,apu0)
*   (continuation) the sum picks the single technology (apcell) and fuel class (apfc0) of the use
         = APen0(cnt,com0,apu0)*sum((aptech,apfc)$(apcell(com0,apu0,aptech) and apfc0(com0,apfc)), APgb(aptech,apfc,pol));

* ---- In plain words ----------------------------------------------------------------------
* Here the pollution from burning biofuel is shared out among the buyers of biofuel.
* For each group of sources (power plants, factories, homes and offices...) EDGAR tells us
* how much pollution comes from biofuel. That amount is divided among the users of the
* group in proportion to how much biofuel they buy, weighted by how dirty their equipment
* is (an old home stove pollutes more than an office boiler). If a group has biofuel
* pollution but nobody in it buys biofuel, that pollution stays with its fossil fuels.
* -------------------------------------------------------------------------------------------
* bio part (APbio = 1): split over the C-BIO purchases of the group's users
*   bio emissions of each source group: APsrcB07 summed over the EDGAR sources of the group
*   (mapsrcblk); zero when APbio = 0, so that everything below has no effect
APblkEB(cnt,pol,apblk)$(APbio eq 1) = sum(apsrc$mapsrcblk(apsrc,apblk), APsrcB07(cnt,apsrc,pol));
*   C-BIO purchase of each granular user from the SAM; negative SAM entries are set to 0
APXB0(cnt,com0,apu0)$(apbio0(com0) and APbio eq 1) = max(0, SAMt(cnt,com0,apu0));
*   weight of each C-BIO use: purchase times the Guidebook biomass factor of the user's technology
*   (one common price per country is assumed, so the purchase stands for energy use)
APwB0(cnt,pol,com0,apu0)$APXB0(cnt,com0,apu0)
*   (continuation) the sum picks the single technology of the use from apcellB
         = APXB0(cnt,com0,apu0)*sum(aptech$apcellB(com0,apu0,aptech), APbiogb(aptech,pol));
*   total weight of each source group: sum over the C-BIO uses whose technology belongs to it (mapblk)
APblkWB(cnt,pol,apblk) = sum((com0,apu0,aptech)$(apcellB(com0,apu0,aptech) and mapblk(aptech,apblk)), APwB0(cnt,pol,com0,apu0));
*   total C-BIO purchases of each source group (for the diagnostic APbioInt only)
APblkXB(cnt,apblk)     = sum((com0,apu0,aptech)$(apcellB(com0,apu0,aptech) and mapblk(aptech,apblk)), APXB0(cnt,com0,apu0));
*   the split: each C-BIO use gets the group's bio emissions times its share of the group weight
APcombB0(cnt,pol,com0,apu0)$APwB0(cnt,pol,com0,apu0)
*   (continuation) sum over the group of the use, only where the group has a positive weight
         = sum((aptech,apblk)$(apcellB(com0,apu0,aptech) and mapblk(aptech,apblk) and APblkWB(cnt,pol,apblk)),
*   (continuation) group bio emissions x weight of the use / weight of the group
               APblkEB(cnt,pol,apblk)*APwB0(cnt,pol,com0,apu0)/APblkWB(cnt,pol,apblk));
* groups with bio emissions but no bio fuel use keep them on their fossil fuels (as with APbio = 0)
*   bio emissions of a group with zero total weight (no C-BIO use): handed back to the fossil split
APbioFB(cnt,pol,apblk)$(not APblkWB(cnt,pol,apblk)) = APblkEB(cnt,pol,apblk);
*   diagnostic: bio emissions per unit of C-BIO purchase of each group (Gg per SAM unit)
APbioInt(cnt,pol,apblk)$APblkXB(cnt,apblk) = APblkEB(cnt,pol,apblk)/APblkXB(cnt,apblk);
*   print the fallback amounts in the listing (empty with the 2007 data)
display APbioFB;

* ---- In plain words ----------------------------------------------------------------------
* Here the pollution left for coal, oil and gas is computed: total pollution of each group
* minus the part due to biofuel (plus any biofuel pollution that found no biofuel buyer).
* With the switch off, this is simply the total, as before. Then the total weight and the
* total energy of each group are added up.
* -------------------------------------------------------------------------------------------
* fossil part (all emissions with APbio = 0)
*   fossil emissions of each source group = all EDGAR emissions of its sources minus the bio part
APblkE(cnt,pol,apblk) = sum(apsrc$mapsrcblk(apsrc,apblk), APsrc07(cnt,apsrc,pol))
*   (continuation) minus the bio emissions split above, plus those of groups without C-BIO use
                      - APblkEB(cnt,pol,apblk) + APbioFB(cnt,pol,apblk);
*   total weight of each source group: sum over the fossil fuel uses whose technology belongs to it
APblkW(cnt,pol,apblk) = sum((com0,apu0,aptech)$(apcell(com0,apu0,aptech) and mapblk(aptech,apblk)), APw0(cnt,pol,com0,apu0));
*   total energy of each source group (for the energy-share fallback and the orphan test)
APblkN(cnt,apblk)     = sum((com0,apu0,aptech)$(apcell(com0,apu0,aptech) and mapblk(aptech,apblk)), APen0(cnt,com0,apu0));

* ---- In plain words ----------------------------------------------------------------------
* Here the fossil pollution of each group is shared among its fuel purchases in proportion
* to their weights, so dirtier fuels and technologies get more. Two special cases:
* - if the guidebook gives no figure for any fuel of a group (e.g. sulphur from gas
*   pipelines), the pollution is shared by energy use alone;
* - if a country has pollution in a group but no fuel purchases in it, that pollution is
*   spread over all the country's other fuel purchases.
* -------------------------------------------------------------------------------------------
* the linear system of each source group: emissions in proportion to the weights
*   emissions of each fossil fuel use = group emissions x weight of the use / weight of the group
APcomb0(cnt,pol,com0,apu0)$APen0(cnt,com0,apu0)
*   (continuation) sum over the group of the use, only where the group has a positive weight
         = sum((aptech,apblk)$(apcell(com0,apu0,aptech) and mapblk(aptech,apblk) and APblkW(cnt,pol,apblk)),
*   (continuation) the closed-form solution of sum_f X_f e_f = E with e_f = phi_f e_ref
               APblkE(cnt,pol,apblk)*APw0(cnt,pol,com0,apu0)/APblkW(cnt,pol,apblk));
* no Guidebook factor for any fuel of the group (e.g. SO2 of gas-fired pipelines): energy shares
*   add, for groups with zero total weight but positive energy, the split by energy share
APcomb0(cnt,pol,com0,apu0)$APen0(cnt,com0,apu0)
*   (continuation) keep what was assigned above
         = APcomb0(cnt,pol,com0,apu0)
*   (continuation) groups of the use with no weight but some energy
         + sum((aptech,apblk)$(apcell(com0,apu0,aptech) and mapblk(aptech,apblk) and not APblkW(cnt,pol,apblk) and APblkN(cnt,apblk)),
*   (continuation) group emissions x energy of the use / energy of the group
               APblkE(cnt,pol,apblk)*APen0(cnt,com0,apu0)/APblkN(cnt,apblk));
* source groups without any fuel use in the SAM: spread over all other fuel uses of the country
*   emissions of the groups with no energy use at all in the country (orphan groups)
APorph(cnt,pol) = sum(apblk$(not APblkN(cnt,apblk)), APblkE(cnt,pol,apblk));
*   emissions assigned so far in the country
APtot0(cnt,pol) = sum((com0,apu0), APcomb0(cnt,pol,com0,apu0));
*   print the orphan emissions in the listing (only PL, < 0.5 Gg)
display APorph;
*   scale up all fuel uses of the country so that they also carry the orphan emissions
APcomb0(cnt,pol,com0,apu0)$(APorph(cnt,pol) and APtot0(cnt,pol))
*   (continuation) proportional scaling: each use keeps its share of the country total
         = APcomb0(cnt,pol,com0,apu0)*(1 + APorph(cnt,pol)/APtot0(cnt,pol));

* ---- In plain words ----------------------------------------------------------------------
* Here the detailed results are added up to the fuels and buyers the model works with,
* and divided by the amount of each fuel each buyer uses. This gives the pollution per
* unit of fuel. Biofuel is now included next to coal, oil and gas. Hydrogen producers,
* which buy no fuel in the starting year, borrow the figures of the natural gas industry.
* -------------------------------------------------------------------------------------------
* aggregation to the model fuels and users
*   benchmark quantity entering MPSGE for each fuel in apcom (fossil fuels and, with APbio = 1, pBIO):
*   intermediate use of each sector, net of taxes
APq(cnt,com,sec)$apcom(com)     = IOZ(cnt,com,sec);
*   household consumption
APq(cnt,com,"HOUS")$apcom(com)  = CZ(cnt,com);
*   local government consumption
APq(cnt,com,"GOVT")$apcom(com)  = CGLZ(cnt,com);
*   investment demand
APq(cnt,com,"INV")$apcom(com)   = IZ(cnt,com);
*   transport margins
APq(cnt,com,"tmarg")$apcom(com) = TMXZ(cnt,com);
*   emissions of each model fuel and user: granular fossil (APcomb0) and bio (APcombB0) emissions
*   summed over the granular fuels (mapc) and users (apumap) belonging to them
APfuel(cnt,pol,com,apmu)$apcom(com)
*   (continuation) APcombB0 is non-zero only for C-BIO, which maps to pBIO
         = sum((com0,apu0)$(mapc(com0,com) and apumap(apu0,apmu)), APcomb0(cnt,pol,com0,apu0)+APcombB0(cnt,pol,com0,apu0));
*   combustion factor: emissions / benchmark quantity entering MPSGE, so the benchmark reproduces EDGAR
APr(cnt,pol,com,apmu)$(APq(cnt,com,apmu) gt 0) = APfuel(cnt,pol,com,apmu)/APq(cnt,com,apmu);
* sectors without benchmark fuel use (e.g. hydrogen) take the factors of the sector in mapAPr
*   APr of a sector listed first in mapAPr = APr of the sector listed second (iH2S, iH2E <- iNG)
APr(cnt,pol,com,sec)$sum(secc$mapAPr(sec,secc),1) = sum(secc$mapAPr(sec,secc), APr(cnt,pol,com,secc));

* ---- In plain words ----------------------------------------------------------------------
* Here the pollution not caused by burning fuels (farming, industrial processes, solvents,
* waste, road dust, leaks from mines and gas pipes) is given to the industries that cause
* it. When a source belongs to several industries, it is shared by their output. If none of
* those industries exists in a country, the pollution goes to general industry. Dividing by
* output gives the pollution per unit of output.
* -------------------------------------------------------------------------------------------
*   activity emissions of a sector: each activity source mapped to it (mapAPs), shared by output XDZ
APsec(cnt,pol,sec) = sum(apact$(mapAPs(apact,sec) and sum(secc$mapAPs(apact,secc),XDZ(cnt,secc))),
*   (continuation) source emissions x output of the sector / output of all sectors of the source
         APsrc07(cnt,apact,pol)*XDZ(cnt,sec)/sum(secc$mapAPs(apact,secc),XDZ(cnt,secc)));
* fallback: sources whose mapped sectors have no output in a country (e.g. 1.B.1 coke ovens
* in BE, NL, CY, which have no coal mining) go to the fallback sector APfbsec
*   add to the fallback sector (APfbsec, iIND) the sources whose sectors have no output in the country
APsec(cnt,pol,APfbsec) = APsec(cnt,pol,APfbsec)
*   (continuation) sources with zero total output of their mapped sectors
         + sum(apact$(not sum(secc$mapAPs(apact,secc),XDZ(cnt,secc))), APsrc07(cnt,apact,pol));
*   activity factor: activity emissions / benchmark output of the sector
EFact(cnt,pol,sec)$XDZ(cnt,sec) = APsec(cnt,pol,sec)/XDZ(cnt,sec);

* ---- In plain words ----------------------------------------------------------------------
* Here the model recomputes its starting-year pollution and compares it with EDGAR,
* now also showing how much of it comes from biofuel. The difference must be zero.
* -------------------------------------------------------------------------------------------
* benchmark check with the quantities that enter the MPSGE blocks
*   EDGAR national total
APcheck(cnt,pol,"EDGAR") = APbase07(cnt,pol);
*   model combustion emissions at the benchmark: factor x benchmark quantity, over all fuels in apcom
APcheck(cnt,pol,"comb")  = sum((com,apmu)$apcom(com), APr(cnt,pol,com,apmu)*APq(cnt,com,apmu));
*   of which on the bio fuel (zero with APbio = 0)
APcheck(cnt,pol,"comb_bio")   = sum((com,apmu)$(apcom(com) and APbiocom(com)), APr(cnt,pol,com,apmu)*APq(cnt,com,apmu));
*   EDGAR bio total for comparison; it also includes the bio part of activity sources (e.g. 3.C.1),
*   which stays on sector output, so it is larger than comb_bio
APcheck(cnt,pol,"EDGARbio") = sum(apsrc, APsrcB07(cnt,apsrc,pol));
*   model activity emissions at the benchmark: factor x benchmark output
APcheck(cnt,pol,"act")   = sum(sec, EFact(cnt,pol,sec)*XDZ(cnt,sec));
*   model minus EDGAR: must be 0 (up to rounding)
APcheck(cnt,pol,"diff")  = APcheck(cnt,pol,"comb")+APcheck(cnt,pol,"act")-APcheck(cnt,pol,"EDGAR");
*   print the check in the listing
display APcheck;

* ---- In plain words ----------------------------------------------------------------------
* Here all the pollution factors, including the new biofuel ones, are saved to a file
* (APfactors.gdx) so they can be inspected after the run.
* -------------------------------------------------------------------------------------------
*   calibration results of the air pollutant module (first line: fossil method and checks)
execute_unload 'APfactors.gdx' APsrc07,APbase07,APgb,APblkE,APcomb0,APfuel,APsec,APr,EFact,APcheck,
*   (continuation) bio split: EDGAR bio data, biomass factors, group bio emissions, split, fallback, diagnostic
                               APsrcB07,APbiogb,APblkEB,APcombB0,APbioFB,APbioInt;

* ---- In plain words ----------------------------------------------------------------------
* Here the pollution caps chosen by the user are read. In the starting year no cap applies,
* so the model starts from the economy as it is.
* -------------------------------------------------------------------------------------------
* thresholds (user-editable) and activation switch; inactive in the benchmark solve
*   thresholds APthr(cnt,pol,step) in Gg, as fractions APfrac of the 2007 emissions (see that file)
$include "AirPollutantThresholds.gms"
*   no permit market in the benchmark solve
APB(cnt,pol) = 0;
* ---- In plain words ----------------------------------------------------------------------
* Here the biofuel on/off flag is switched off for the starting year, when no country has
* a pollution cap. The model then has exactly the same structure as before.
* -------------------------------------------------------------------------------------------
* the bio fuel moves to its own Leontief nest (with its permits) only where it carries permits, so
* that uncapped runs keep exactly the previous model structure (see REMES_MPSGE_alt.gms)
*   no bio permit structure in the benchmark solve (APB = 0 everywhere)
APbioOn(cnt) = 0;


*************************
parameter check_taxcom(cnt, com);
check_taxcom(cnt, com) = CZ(cnt, com)*(1+taxcz(cnt, com))*(1 + trmz(cnt, com));
display check_taxcom;

************************

taxc(cnt,com) = taxcz(cnt,com) ;
taxp(cnt,sec) = taxpz(cnt,sec) ;

* Income tax computation in percentage
tyz(cnt)$((LSZ(cnt) + KSZ(cnt)) ne 0) =  TTYZ(cnt)/(LSZ(cnt) + KSZ(cnt)) ;
ty(cnt)  =  tyz(cnt) ;

*i.        Trade Balance checks
Parameter
trade_bal_global(cnt) global trade balance
trade_bal_global_nat national trade balance
;

trade_bal_global(cnt) =
* Incoming monetary flows - exports
*Exports
  sum(com,EROWZ(cnt,com))
         + sum((com,cntt),TRADEZ(com,cnt,cntt))
         +  TRROWZ(cnt)
         +  TRHROWZ(cnt)
         +  SROWZ(cnt)
* Outgong monetary flows - imports
         - ( sum(com,MROWZ(cnt,com))
         + sum((com,cntt),TRADEZ(com,cntt,cnt)) ) ;

trade_bal_global_nat = sum(cnt,trade_bal_global(cnt));

display trade_bal_global,trade_bal_global_nat;


Parameter
investment_bal(cnt) balance of savings and investments
investment_bal_nat
;

investment_bal(cnt) =+ sum(sec,INVZ(cnt,sec))
  + SHZ(cnt) + SGZ(cnt) + SROWZ(cnt) - ITZ(cnt)
  - sum(com, SVZ(cnt,com))  ;

investment_bal_nat = sum(cnt, investment_bal(cnt));



parameter
TaxedTradeMargins(cnt, com)
;

TaxedTradeMargins(cnt, com) = (CZ(cnt, com)+IZ(cnt, com)
         +CGZ(cnt, com)+sum(sec,IOZ(cnt, com, sec)))*trmz(cnt, com);

display investment_bal,investment_bal_nat,TaxedTradeMargins;


* ======================= Aggregate ELASTICITIES =================================

*aggregate elasticities for old sectors
ELAS(sec,"KL")$(not sameas(sec,"iH2S") and not sameas(sec,"iH2C") and not sameas(sec,"iH2E")) = sum((r,sec0)$maps(sec0,sec),ELAS0(sec0,"KL")*XD0(r,sec0))/sum((cnt,sec0)$maps(sec0,sec),XD0(cnt,sec0));
ELAS(sec,"KLE")$(not sameas(sec,"iH2S") and not sameas(sec,"iH2C") and not sameas(sec,"iH2E")) = sum((r,sec0)$maps(sec0,sec),ELAS0(sec0,"KLE")*XD0(r,sec0))/sum((cnt,sec0)$maps(sec0,sec),XD0(cnt,sec0));
ELAS(sec,"KLEM")$(not sameas(sec,"iH2S") and not sameas(sec,"iH2C") and not sameas(sec,"iH2E")) = sum((r,sec0)$maps(sec0,sec),ELAS0(sec0,"KLEM")*XD0(r,sec0))/sum((cnt,sec0)$maps(sec0,sec),XD0(cnt,sec0));

elasM(com)$(not sameas(com, "pH2"))= sum((r,com0)$mapc(com0,com),elasM0(com0)*XZ(r,com))/sum((cnt,com0)$mapc(com0,com),XZ(cnt,com));
elasM("pH2")=elasM("pNG");

display ELAS0,ELAS,elasM;

* override elasticities
ELAS(sec,"KL")$(orEl eq 1)=0.95;
ELAS(sec,"KLE")$(orEl eq 1)=0.4;
ELAS(sec,"KLEM")$(orEl eq 1)=1;

* ============                             ===================
* ============ Currencies                  ===================
* ============                             ===================
* 8) HERE WE SET A FLAG FOR THE CURRENCY IN EACH COUNTRY. This is not ROW, but still "internal" trade with another currency
set CRR /EURO, NOK, SEK, GBP, DNK, SWF/;
*set CRR /EURO, NOK/;

parameter used_currency(cnt, CRR);

used_currency(cnt, 'EURO') = 1;

used_currency('NO', 'EURO') = 0;
used_currency('NO', 'NOK') = 1;

used_currency('SE', 'EURO') = 0;
used_currency('SE', 'SEK') = 1;
used_currency('GB', 'EURO') = 0;
used_currency('GB', 'GBP') = 1;
used_currency('DK', 'EURO') = 0;
used_currency('DK', 'DNK') = 1;
used_currency('CH', 'EURO') = 0;
used_currency('CH', 'SWF') = 1;

parameter Exch_out(CRR)
Exch_in(CRR);

* 9) HERE WE COMPUTE THE TOTAL OUTFLOWS AND INFLOWS IN A GIVEN CURRENCY
Exch_out(CRR) = (sum(cnt$used_currency(cnt, CRR), sum(com, MROWZ(cnt, com)) - TRROWZ(cnt)$(TRROWZ(cnt) < 0) + SROWZ(cnt) -  TRHROWZ(cnt)$( TRHROWZ(cnt) < 0)));

Exch_in(CRR) =  (sum(cnt$used_currency(cnt, CRR), sum(com,EROWZ(cnt, com)) + TRROWZ(cnt)$(TRROWZ(cnt) > 0) +  TRHROWZ(cnt)$( TRHROWZ(cnt) > 0)));

display used_currency,Exch_out,Exch_in;
display MROWZ, TRROWZ, SROWZ, TRHROWZ, EROWZ;

* ============ Define variable to study and the set of increments ==============================
* INCLUDE GROWTH FOR POPULATION AND GDP PROJECTIONS
parameter t;
t=1;

parameter R_GDP(step, cnt),
gdp_p(cnt),growth_p(cnt),growth_lf(cnt),growth_e(cnt);

*******************Capital Accumulation****************** Added Jan26
*Add parameter for AMECO and definition of kap before run of model
parameter Kap(cnt) total capital in the economy;
*parameter depr(cnt) depreciation/
parameter ror(cnt) return on revenue;

* Sets Kapital for the first time
Kap(cnt) = (LSZ(cnt)+KSZ(cnt)+sum(sec,TAXPZ(cnt,sec)))*GtK(cnt);

parameter DisplayKap(step, cnt);
DisplayKap("1", cnt) = Kap(cnt);
ror(cnt) = KSZ(cnt)/Kap(cnt);

*moved from longer down to use in depr
parameter grow(cnt) single period (5 years) growth trend;
grow(cnt)$(GDPt eq 0)=((gdp(cnt)*(GDPcal(cnt)$(P_S ne 1) + GDPcalBase(cnt)$(P_S eq 1)))**(5/(2050-2005))-1);
grow(cnt)$(GDPt eq 1)=0;

parameter depr(cnt);
depr(cnt) = ITZ(cnt)*5/Kap(cnt)-grow(cnt);
display depr

* ============                                  ===================
* ============ Definitions of the TRANSPORT CASE ===================
* ============                                  ===================
* NewSharet DESCRIBES HOW FUELS MIX CHANGES WITH TIME MOVING FROM CONVENTIONAL TO H2 AND ELECTRICITY
* THE SHARES ARE TAKEN FROM EXTERNAL DATA. (openENTRANCE scenario platform)
parameter T_adj(cnt, *, *)   Adjustment to Transport sectors
NewSharet(*, *, *, *)   Share of fuels according to external data;

T_adj(cnt,sec,com)=0;

*=== Now import data from GDX
Parameter PrimaryEnergy(*,*,countries,source,*,year,*),
SelEnet(countries,source1,year),SelEne(cnt,*,step),SelEne0(cnt,*,step);

Parameter ConsEneIndt(countries,source2,year),ConsEneInd(cnt,*,step),ConsEneInd0(cnt,*,step),
ConsEneTrat(countries,source3,year),ConsEneTra(cnt,*,step),ConsEneTra0(cnt,*,step),
ConsEneSHt(countries,source4,year),ConsEneSH(cnt,*,step),ConsEneSH0(cnt,*,step);

*###### Consumption Preferences from MIWAG ################
* NOTE: declared on the universe (*) instead of (cnt,consource) so we can
* also load non-consumption series stored in the same GDX (e.g.
* 'Effective labor|Population', used below to drive labour-force growth).
Parameter ConsPref(*,*,*,*,*,*,*);
Parameter ConsHt(countries,consource,year),ConsH(cnt,*,step),ConsH0(cnt,*,step);

* ####### Parameter translation between REMES sectors and PRIMES sectors #######
Parameter P2R(cnt,sec0,Psecs);
* Savings rate
parameter SavRat(cnt,year),SavRatGr(cnt,step);

$ifthen %CaseStudy%==0
* for the test case we are taking it from Gradual Development, but it might need to change depending on the case study we want to test.
$gdxin oePathwayGD.gdx
$load PrimaryEnergy
$gdxin

$gdxin MIWAG_REF.gdx
$load ConsPref
$gdxin

SelEnet(countries,source1,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source4,'EJ/yr',year,'value');
$endif


$ifthen %CaseStudy%==1

$gdxin MF_Ref_PRIMES.gdx
*$gdxin oePathwayGD.gdx
$load PrimaryEnergy
$gdxin

$gdxin MappingMatricesREMESPRIMES_3D.gdx
$load P2R
$gdxin


$gdxin MIWAG_REF.gdx
$load ConsPref
$gdxin


SelEnet(countries,source1,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source4,'EJ/yr',year,'value');

parameter TargCons(cnt,year), TaCo(cnt);

TargCons(cnt,year)=1;
TargCons(cnt,year)$(ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value'))=ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value')/ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr','2015','Value');
* Redefine growth and decrease as fractions of them (otherwise it is too restrictive and being as "ambitious" as MIWAG easily leads to infeasibilities.
TargCons(cnt,year)=1+1.1*(TargCons(cnt,year)-1);
TaCo(cnt)=1;

* Household saving from MIWAG as a share of consumption plus net saving
SavRat(cnt,year)$(ConsPref('MIWAG','Reference',cnt,'Consumption|Net Saving','billion EUR_2020/yr',year,'Value')+ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value'))
=ConsPref('MIWAG','Reference',cnt,'Consumption|Net Saving','billion EUR_2020/yr',year,'Value')/(ConsPref('MIWAG','Reference',cnt,'Consumption|Net Saving','billion EUR_2020/yr',year,'Value')+ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value'));

* remove negatives
alias(year,yr);
SavRat(cnt,year)$(smin(yr,SavRat(cnt,yr)) le 0)=1;

$ontext
SelEnet(countries,source1,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source4,'EJ/yr',year,'value');
$offtext

$endif

$ifthen %CaseStudy%==2

$gdxin MF_Ref_PRIMES.gdx
*$gdxin oePathwayGD.gdx
$load PrimaryEnergy
$gdxin

$gdxin MappingMatricesREMESPRIMES_3D.gdx
$load P2R
$gdxin


$gdxin MIWAG_REF.gdx
$load ConsPref
$gdxin


SelEnet(countries,source1,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('PRIMES 2023','MF_Baseline',countries,source4,'EJ/yr',year,'value');

parameter TargCons(cnt,year), TaCo(cnt);

TargCons(cnt,year)=1;
TargCons(cnt,year)$(ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value'))=ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value')/ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr','2015','Value');
* Redefine growth and decrease as fractions of them (otherwise it is too restrictive and being as "ambitious" as MIWAG easily leads to infeasibilities.
TargCons(cnt,year)=1+1.1*(TargCons(cnt,year)-1);
TaCo(cnt)=1;

* Household saving from MIWAG as a share of consumption plus net saving
SavRat(cnt,year)$(ConsPref('MIWAG','Reference',cnt,'Consumption|Net Saving','billion EUR_2020/yr',year,'Value')+ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value'))
=ConsPref('MIWAG','Reference',cnt,'Consumption|Net Saving','billion EUR_2020/yr',year,'Value')/(ConsPref('MIWAG','Reference',cnt,'Consumption|Net Saving','billion EUR_2020/yr',year,'Value')+ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value'));

* remove negatives
alias(year,yr);
SavRat(cnt,year)$(smin(yr,SavRat(cnt,yr)) le 0)=1;

$endif


$ifthen %CaseStudy%==6

$gdxin oePathwayGD.gdx
$load PrimaryEnergy
$gdxin

$gdxin MIWAG_REF.gdx
$load ConsPref
$gdxin

SelEnet(countries,source1,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('GENeSYS-MOD2.9','GradualDevelopment1.0',countries,source4,'EJ/yr',year,'value');
$endif

$ifthen %CaseStudy%==3

$gdxin oePathwayTF.gdx
$load PrimaryEnergy
$gdxin

SelEnet(countries,source1,year)=
PrimaryEnergy('GENeSYS-MOD2.9','Techno-Friendly1.0',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('GENeSYS-MOD2.9','Techno-Friendly1.0',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('GENeSYS-MOD2.9','Techno-Friendly1.0',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('GENeSYS-MOD2.9','Techno-Friendly1.0',countries,source4,'EJ/yr',year,'value');
$endif

$ifthen %CaseStudy%==4

$gdxin oePathwaySC.gdx
$load PrimaryEnergy
$gdxin

$gdxin MIWAG_REF.gdx
$load ConsPref
$gdxin

SelEnet(countries,source1,year)=
PrimaryEnergy('GENeSYS-MOD2.9','SocietalCommitment1.0',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('GENeSYS-MOD2.9','SocietalCommitment1.0',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('GENeSYS-MOD2.9','SocietalCommitment1.0',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('GENeSYS-MOD2.9','SocietalCommitment1.0',countries,source4,'EJ/yr',year,'value');
$endif


$ifthen %CaseStudy%==5

$gdxin oePathwayDT.gdx
$load PrimaryEnergy
$gdxin

$gdxin MIWAG_REF.gdx
$load ConsPref
$gdxin

SelEnet(countries,source1,year)=
PrimaryEnergy('GENeSYS-MOD2.9','DirectedTransition1.0',countries,source1,'EJ/yr',year,'value');
ConsEneIndt(countries,source2,year)=
PrimaryEnergy('GENeSYS-MOD2.9','DirectedTransition1.0',countries,source2,'EJ/yr',year,'value');
ConsEneTrat(countries,source3,year)=
PrimaryEnergy('GENeSYS-MOD2.9','DirectedTransition1.0',countries,source3,'EJ/yr',year,'value');
ConsEneSHt(countries,source4,year)=
PrimaryEnergy('GENeSYS-MOD2.9','DirectedTransition1.0',countries,source4,'EJ/yr',year,'value');
$endif


display ConsPref;


* ##### HERE IT IS GOOD THAT THE EXTERNAL DATA IS INCLUDED FROM 3 (2015)
* ##### EVEN IF THE REST OF THE SIMULATION STARTS FROM 5 (2025).
* ##### THIS IS BECAUSE THE DATA FROM PRIMES STARTS FROM 2015, SO REMES WILL
* ##### FOLLOW A SIMILAR PATH STARTING FROM 2015 FOR THE ENERGY MIX. THIS WORKS
* ##### ASSUMING THAT PRIMES WILL PROVIDE THE SAME DATA FROM 2015 TO 2025 UNDER EVERY SCENARIO
*
* Transform the data from the openENTRANCE Scenario platform into data understandable by REMES
* aggregate the sources into REMES commodities
SelEne0(cnt,g,step)=0;
SelEne0(cnt,'K',step)=0;
SelEne0(cnt,g,step)=sum((countries,source1,year)$(linkCnt(countries,cnt) and linkSor(source1,g) and linktime(year,step)), SelEnet(countries,source1,year));
SelEne0(cnt,'K',step)=sum((countries,source1,year)$(linkCnt(countries,cnt) and linkSor(source1,'K') and linktime(year,step)), SelEnet(countries,source1,year));
SelEne0(cnt,g,step)$(ord(step) lt 3)=SelEne0(cnt,g,'3');
SelEne0(cnt,'K',step)$(ord(step) lt 3)=SelEne0(cnt,'K','3');

parameter SelCCS(cnt,step);
* total power production with CCS
SelCCS(cnt,step)=sum((countries,source1,year)$(linkCnt(countries,cnt) and linktime(year,step) and wccs(source1)), SelEnet(countries,source1,year));
* redefined as share of power production with CCS over all fossil power production (we exclude renewable power by requiring not to consider the sources mapped to Capital 'K'
SelCCS(cnt,step)$(sum((countries,source1,year)$(linkCnt(countries,cnt) and linktime(year,step) ), SelEnet(countries,source1,year)))=SelCCS(cnt,step)/sum((countries,source1,year)$(linkCnt(countries,cnt) and linktime(year,step) and not linkSor(source1,'K')), SelEnet(countries,source1,year));


SelEne(cnt,'K',step)$(SelEne0(cnt,'K',step))=SelEne0(cnt,'K',step)/(sum(com,SelEne0(cnt,com,step))+SelEne0(cnt,'K',step));
SelEne(cnt,g,step)$(SelEne0(cnt,g,step))=SelEne0(cnt,g,step)/(sum(com,SelEne0(cnt,com,step))+SelEne0(cnt,'K',step));


* Weighted disaggregation of linked external commodities using SAM shares.
parameter baseIndShare(cnt,source2,com), denIndShare(cnt,source2), wMapInd(cnt,source2,com);
baseIndShare(cnt,source2,com)=0;
* for all the industry, compute how REMES commodities are shared for a given external source
* E.G. the external source FinalEnergy|Industry|Liquids|Oil is connected to many internal sources (pFUL, pDSL, pHDI)
* To assign the external commodity to the bundle of these commodities for a given country and sector we need to know
* how these commodities connected to the given external commodity are distributed across industries in the industry aggregate

* Here we compute numerator (the intermediate usage of the commodity in industry)
* and the denominator (the intermediate usage of all the commodities in industry)
baseIndShare(cnt,source2,com)$linkConsInd(source2,com)=sum(sec$indsecs(sec), IOZ(cnt,com,sec));
denIndShare(cnt,source2)=sum(comm$linkConsInd(source2,comm), baseIndShare(cnt,source2,comm));

* Here we compute the allocation percentage. (if the denominator is zero we share it based on the number of commodities linked to the external commodity
wMapInd(cnt,source2,com)=0;
wMapInd(cnt,source2,com)$(linkConsInd(source2,com) and denIndShare(cnt,source2) gt 0)=baseIndShare(cnt,source2,com)/denIndShare(cnt,source2);
wMapInd(cnt,source2,com)$(linkConsInd(source2,com) and denIndShare(cnt,source2)=0 and sum(comm$linkConsInd(source2,comm),1) gt 0)=1/sum(comm$linkConsInd(source2,comm),1);


ConsEneInd0(cnt,g,step)=0;
ConsEneInd0(cnt,g,step)=sum((countries,source2,year)$(linkCnt(countries,cnt) and linktime(year,step)), ConsEneIndt(countries,source2,year)*wMapInd(cnt,source2,g));
ConsEneInd0(cnt,g,step)$(ord(step) lt 3)=ConsEneInd0(cnt,g,'3');
ConsEneInd(cnt,g,step)$(ConsEneInd0(cnt,g,step))=ConsEneInd0(cnt,g,step)/sum(com,ConsEneInd0(cnt,com,step));

parameter baseTraShare(cnt,source3,com), denTraShare(cnt,source3), wMapTra(cnt,source3,com);
baseTraShare(cnt,source3,com)=0;
baseTraShare(cnt,source3,com)$linkConsTra(source3,com)=IOZ(cnt,com,'iTRA');
denTraShare(cnt,source3)=sum(comm$linkConsTra(source3,comm), baseTraShare(cnt,source3,comm));

wMapTra(cnt,source3,com)=0;
wMapTra(cnt,source3,com)$(linkConsTra(source3,com) and denTraShare(cnt,source3) gt 0)=baseTraShare(cnt,source3,com)/denTraShare(cnt,source3);
wMapTra(cnt,source3,com)$(linkConsTra(source3,com) and denTraShare(cnt,source3)=0 and sum(comm$linkConsTra(source3,comm),1) gt 0)=1/sum(comm$linkConsTra(source3,comm),1);

ConsEneTra0(cnt,g,step)=0;
ConsEneTra0(cnt,g,step)=sum((countries,source3,year)$(linkCnt(countries,cnt) and linktime(year,step)), ConsEneTrat(countries,source3,year)*wMapTra(cnt,source3,g));
ConsEneTra0(cnt,g,step)$(ord(step) lt 3)=ConsEneTra0(cnt,g,'3');
ConsEneTra(cnt,g,step)$(ConsEneTra0(cnt,g,step))=ConsEneTra0(cnt,g,step)/sum(com,ConsEneTra0(cnt,com,step));

parameter baseSHShare(cnt,source4,com), denSHShare(cnt,source4), wMapSH(cnt,source4,com);
baseSHShare(cnt,source4,com)=0;
baseSHShare(cnt,source4,com)$linkConsSH(source4,com)=IOZ(cnt,com,'iSER');
denSHShare(cnt,source4)=sum(comm$linkConsSH(source4,comm), baseSHShare(cnt,source4,comm));

wMapSH(cnt,source4,com)=0;
wMapSH(cnt,source4,com)$(linkConsSH(source4,com) and denSHShare(cnt,source4) gt 0)=baseSHShare(cnt,source4,com)/denSHShare(cnt,source4);
wMapSH(cnt,source4,com)$(linkConsSH(source4,com) and denSHShare(cnt,source4)=0 and sum(comm$linkConsSH(source4,comm),1) gt 0)=1/sum(comm$linkConsSH(source4,comm),1);

ConsEneSH0(cnt,g,step)=0;
ConsEneSH0(cnt,g,step)=sum((countries,source4,year)$(linkCnt(countries,cnt) and linktime(year,step)), ConsEneSHt(countries,source4,year)*wMapSH(cnt,source4,g));
ConsEneSH0(cnt,g,step)$(ord(step) lt 3)=ConsEneSH0(cnt,g,'3');
ConsEneSH(cnt,g,step)$(ConsEneSH0(cnt,g,step))=ConsEneSH0(cnt,g,step)/sum(com,ConsEneSH0(cnt,com,step));

* To include data from MIWAG
* What is done here is: we take the external data and we make it percentage allocation.
ConsH0(cnt,g,step)=0;
ConsH0(cnt,g,step)=sum((consource,year)$(linkConsHOUS(consource,g) and linktime(year,step)), ConsPref('MIWAG','Reference',cnt,consource,'billion EUR_2020/yr',year,'value'));
ConsH0(cnt,g,step)$(ord(step) lt 3)=ConsH0(cnt,g,'3');
* Remove Hydrogen from the household consumption in the first periods before the one changed by the external data
* Otherwise the model gets upset
ConsH0(cnt,"pH2",step)$(ord(step) le 5)=0;
ConsH(cnt,g,step)$(ConsH0(cnt,g,step))=ConsH0(cnt,g,step)/sum(com,ConsH0(cnt,com,step));

*ConsHt(countries,consource,year),ConsH(cnt,*,step),ConsH0(cnt,*,step)

* ============== Population / Effective-labour path from MIWAG ===========
* The 'Effective labor|Population' series from MIWAG_REF.gdx is read into
* PopData_t(cnt,year) and projected onto REMES steps via linktimePop:
*   step 2  <-> 2010   step 3  <-> 2015   ...   step 10 <-> 2050
* pop_step(cnt,step) then carries the population value at every step,
* with step 1 (pre-2010 benchmark) padded with the 2010 value so the
* base-year ratio is well defined. growth_lf(cnt) is later set inside
* the recursive loop to pop_step(cnt,step)/pop_step(cnt,'2'), i.e. the
* relative population growth with respect to year 2010.
parameter PopData_t(cnt,year) "Effective labor|Population from MIWAG_REF";
PopData_t(cnt,year) = ConsPref('MIWAG','Reference',cnt,'Effective labor|Population','billion EUR_2020/yr',year,'Value');


set linktimePop(year,step) "year-to-step mapping for population (2010->step 2 .. 2060->step 12)" /
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

parameter pop_step(cnt,step) "population mapped to REMES steps";
pop_step(cnt,step) = sum(year$linktimePop(year,step), PopData_t(cnt,year));
* Pad step 1 with the 2010 value so any ratio against step 1 is defined
pop_step(cnt,step)$(ord(step) lt 3) = pop_step(cnt,'3');
* Pad steps 11-12 with the step-10 value when no MIWAG data is available
* for 2055 / 2060 (first-iteration behaviour). When MIWAG starts shipping
* 2055/2060 values the assignment above already picks them up and this
* fallback becomes a no-op.
pop_step(cnt,step)$(ord(step) gt 10 and pop_step(cnt,step) eq 0 and pop_step(cnt,'10') ne 0) = pop_step(cnt,'10');

* ---- Country growth path (MIWAG countries) + weighted average ------
* MIWAG covers 2015..2050 (= REMES steps 3..10). For each MIWAG country
* we derive TWO equivalent yearly population growth rates from the MIWAG
* series and apply them as 5-year compound factors on the REMES grid:
*
*   lfgrow_pop1(cnt) = (pop(2025)/pop(2015))^(1/10) - 1   (yearly, 2015-2025)
*   lfgrow_pop2(cnt) = (pop(2050)/pop(2025))^(1/25) - 1   (yearly, 2025-2050)
*
*   For step in {1..5}  (REMES periods up to 2025):
*       growth_lf_path(cnt,step) = (1 + lfgrow_pop1(cnt))^(5*(ord(step)-1))
*       => step1=1, step2=(1+r1)^5, step3=(1+r1)^10,
*          step4=(1+r1)^15, step5=(1+r1)^20
*
*   For step in {6..10} (REMES periods after 2025):
*       growth_lf_path(cnt,step) = (1 + lfgrow_pop1(cnt))^20
*                                  * (1 + lfgrow_pop2(cnt))^(5*(ord(step)-5))
*       => step5 anchor is preserved; step10 = (1+r1)^20 * (1+r2)^25
*
* Using two phase-specific rates instead of a single 2015-2050 rate
* tracks the kink in the MIWAG demographic path at 2025 more faithfully.
*
* The growth_lf to be applied to NON-MIWAG REMES countries
* (BG, CY, GR, IE, LU, MT, PL, plus GB, CH, NO if active) is then a
* cross-country population-weighted average of growth_lf_path,
* avg_pop_ratio(step), so all countries follow the same average
* demographic trend instead of the heterogeneous (and sometimes
* negative) lfgrow path from growth_table.gms.

parameter lfgrow_pop1(cnt)        "MIWAG-implied yearly population growth rate, 2015-2025";
parameter lfgrow_pop2(cnt)        "MIWAG-implied yearly population growth rate, 2025-2050";
parameter growth_lf_path(cnt,step) "per-country growth_lf path for MIWAG countries";
parameter pop_tot(step)           "total MIWAG-country population at each step";
parameter avg_pop_ratio(step)     "population-weighted average growth_lf path (MIWAG countries)";

* Phase-1 yearly rate, 2015->2025 (10 years => REMES steps 3->5)
lfgrow_pop1(cnt)$(pop_step(cnt,'3') and pop_step(cnt,'5')) =
    (pop_step(cnt,'5')/pop_step(cnt,'3'))**(1/(2025-2015)) - 1;

* Phase-2 yearly rate, 2025->2050 (25 years => REMES steps 5->10)
lfgrow_pop2(cnt)$(pop_step(cnt,'5') and pop_step(cnt,'10')) =
    (pop_step(cnt,'10')/pop_step(cnt,'5'))**(1/(2050-2025)) - 1;

* Steps 1..5: compound phase-1 rate over 5*(ord(step)-1) years
growth_lf_path(cnt,step)$(pop_step(cnt,'3') and ord(step) le 5) =
    (1+lfgrow_pop1(cnt))**(5*(ord(step)-1));

* Steps 6..10: anchor at step 5 (= (1+r1)^20) and compound phase-2 rate
growth_lf_path(cnt,step)$(pop_step(cnt,'3') and ord(step) gt 5) =
    ((1+lfgrow_pop1(cnt))**20)
    * (1+lfgrow_pop2(cnt))**(5*(ord(step)-5));

* Population-weighted cross-country average of the growth path. The
* weight at every step is the country's own MIWAG population at that
* step, so larger MIWAG economies dominate and weights track each year
* individually. For step 1 and step 2 the weight is pop_step('3')
* (set by the linktimePop padding above).
pop_tot(step)                     = sum(cnt$pop_step(cnt,'3'), pop_step(cnt,step));
avg_pop_ratio(step)$pop_tot(step) =
    sum(cnt$pop_step(cnt,'3'), pop_step(cnt,step)*growth_lf_path(cnt,step))
    / pop_tot(step);

* # SAVING RATIO DEVELOPMENT FROM MIWAG
* set the change in saving ratio to 1 for all countries
SavRatGr(cnt,step)=1;
Parameter
    SavRatGrRaw(cnt,step)
    SavRatGrFirst(cnt)
    SavRatGrLast(cnt)
    HasMIWAG(cnt);

Scalar
    firstStepOrd
    lastStepOrd;

* First interpolation step: step '3' = 2015
firstStepOrd = 3;
lastStepOrd  = card(step);

* Check whether MIWAG data exists for the country
HasMIWAG(cnt) =
    sum(year,
        ConsPref('MIWAG','Reference',cnt,'Consumption|Net Saving','billion EUR_2020/yr',year,'Value')
      + ConsPref('MIWAG','Reference',cnt,'Consumption|Households','billion EUR_2020/yr',year,'Value')
    );

* Default value
SavRatGr(cnt,step)    = 1;
SavRatGrRaw(cnt,step) = 1;

* Raw value from MIWAG/SavRat, computed for all steps only as source information
* The original saving-rate index from MIWAG in relative terms, with 2015 = 1
SavRatGrRaw(cnt,step)$(HS eq 1 and HasMIWAG(cnt)) =
    sum(year$linktimePop(year,step), SavRat(cnt,year)) / SavRat(cnt,'2015');

* Extract first and last values for the MIWAG relative savings rate (Starting from 2015)
SavRatGrFirst(cnt) = sum(step$(ord(step) eq firstStepOrd), SavRatGrRaw(cnt,step));
SavRatGrLast(cnt)  = sum(step$(ord(step) eq lastStepOrd),  SavRatGrRaw(cnt,step));

* Cap endpoint values before interpolation
* The saving rate can, at most, double.
SavRatGrFirst(cnt) = min(SavRatGrFirst(cnt), 2);
SavRatGrLast(cnt)  = min(SavRatGrLast(cnt),  2);

* Linear interpolation between capped first and capped last step
* start from 1 in step 3 and then change according to MIWAG
SavRatGr(cnt,step)$(HS eq 1 and HasMIWAG(cnt) and ord(step) ge firstStepOrd) =
      SavRatGrFirst(cnt)
    + (ord(step) - firstStepOrd)
    / (lastStepOrd - firstStepOrd)
    * (SavRatGrLast(cnt) - SavRatGrFirst(cnt));

* Periods before 2015 take the capped 2015 value
SavRatGr(cnt,step)$(ord(step) le firstStepOrd) = SavRatGrFirst(cnt);
* set to 1 periods before 3 (2015)
SavRatGr(cnt,step)$(ord(step) le 3)=SavRatGr(cnt,'3');

display PopData_t, pop_step, lfgrow_pop1, lfgrow_pop2, growth_lf_path, pop_tot, avg_pop_ratio;

execute_unload 'ExtData.gdx', SelEne,SelCCS,ConsH,ConsH0, ConsEneIndt,ConsEneInd0,ConsEneInd,ConsEneTrat,ConsEneTra0,ConsEneTra,ConsEneSHt,ConsEneSH0,ConsEneSH,ConsPref,PopData_t,pop_step,lfgrow_pop1,lfgrow_pop2,growth_lf_path,pop_tot,avg_pop_ratio,SavRatGr,SavRat,TargCons;

*$exit
* ================ CPD - COUNTERFACTUAL POLICY DEFINITION =====================
* Counterfactual point 1
* choose where to read the data from depending on the case study
$ifthen %CaseStudy%==1
* nothing happens for technology
newsharet(cnt,sec0,com0,step)=0;
newsharet("UK",sec0,com0,step)=0;
newsharet("UK","iH2S","pH2",step)=0;
newsharet("UK","iH2C","pH2",step)=0;
newsharet("UK","iH2E","pH2",step)=0;
newsharet("UK","HOUS",com0,step)=0;
newsharet("UK","GOVT",com0,step)=0;
newsharet("UK","INV",com0,step)=0;
* in this case the productivity is the baseline one
*PRC1(cnt)=PRC0(cnt);
$endif


$ifthen %CaseStudy%==6
* nothing happens for technology
newsharet(cnt,sec0,com0,step)=0;
newsharet("UK",sec0,com0,step)=0;
newsharet("UK","iH2S","pH2",step)=0;
newsharet("UK","iH2C","pH2",step)=0;
newsharet("UK","iH2E","pH2",step)=0;
newsharet("UK","HOUS",com0,step)=0;
newsharet("UK","GOVT",com0,step)=0;
newsharet("UK","INV",com0,step)=0;
* in this case the productivity is the baseline one
*PRC1(cnt)=PRC0(cnt);
$endif


* 15c) THE H2 COMMODITY IS THE ONLY EXTRA COMMODITY CONSIDERED. initially its share is set to zero.
T_adj(cnt, sec, com) = 0;
T_adj(cnt, sec, "pH2") = 0;

T_adj(cnt, "HOUS", com) = 0;
T_adj(cnt, "HOUS", "pH2") = 0;

T_adj(cnt, "GOVT", com) = 0;
T_adj(cnt, "GOVT", "pH2") = 0;





* k.        Translation of openENTRANCE input into REMES technology shares

* =============== newshare IS REDEFINED WITH THE GROUPED SECTORS ===============

parameter newshare0(*,*,*,*), newshare(*,*,*,*), KZ0(cnt,sec,step),KZshare(cnt,sec,step);
parameter consshare0(*,*,*,*), consshare(*,*,*,*);
parameter extelas(cnt,sec) energy elasticity for sectors whose energy mix is defined by the energy system model;
extelas(cnt,sec)=5;
extelas(cnt,trasecs)=0.2;
extelas(cnt,indsecs)=0.2;
extelas(cnt,servsecs)=0.2;


newshare0(cnt,'iELC',com,step)=SelEne(cnt,com,step);
KZ0(cnt,'iELC',step)=1-sum(com,newshare0(cnt,'iELC',com,step));

*PP if I deactivate these there is no external technology transition
newshare0(cnt,trasecs,com,step)=ConsEneTra(cnt,com,step);
newshare0(cnt,indsecs,com,step)=ConsEneInd(cnt,com,step);
newshare0(cnt,servsecs,com,step)=ConsEneSH(cnt,com,step);

* Replace the old reallocation that was mimicking services into the one given from MIWAG
*newshare0(cnt,"HOUS",com,step)=newshare0(cnt,"iSER",com,step);
newshare0(cnt,"HOUS",com,step)=ConsH(cnt,com,step);

* check data
execute_unload 'FromPlatform.gdx' SelEnet, SelEne0,SelEne, newshare0;


alias(step,pass);

parameter
temp0(cnt,sec)       total sum of commodities that subject to technical change from SAM ,
tempH0(cnt)          commodities that change for households
multSAM(cnt,*,*) ensures that in the first period the resharing give the same values as the SAM even with external shares,
multKZ(cnt,sec)  ensures that in the first period the resjaring gives the same values as the SAM for the capital,
reSAM(cnt,*,*,step)   reallocation of values with same magnitude as into the SAM,
reKZ(cnt,sec,step)            reallocation of values for capital. same magnitude as the SAM,
KAP0(cnt,sec)    initial share belonging to capital
FZ0(cnt,sec)     initial share belonging to fuels;

* if at one point the share is nonzero compute the sum only for commodities with a nonzero share
* the initial sum of newshare0 over goods is not 1. The rest is kapital

* For each country and sector:
* Consider the total consumption of commodities that are going to change in allocation
* (all the commodities for which at least one newshare is non-zero over time.
temp0(cnt,sec) = sum(com$(sum(pass,newshare0(cnt,sec,com,pass))), IOZ(cnt,com,sec));
tempH0(cnt) = sum(com$(sum(pass,newshare0(cnt,'HOUS',com,pass))), CZ(cnt,com));

* Prices: compute the prices for the goods in the SAM
multSAM(cnt,sec,com)$(sum(pass,newshare0(cnt,sec,com,pass)) and IOZ(cnt,com,sec) and newshare0(cnt,sec,com,"3"))=IOZ(cnt,com,sec)/(newshare0(cnt,sec,com,"3")*temp0(cnt,sec));
multSAM(cnt,'HOUS',com)$(sum(pass,newshare0(cnt,'HOUS',com,pass)) and CZ(cnt,com) and newshare0(cnt,'HOUS',com,"3"))=CZ(cnt,com)/(newshare0(cnt,'HOUS',com,"3")*tempH0(cnt));
multKZ(cnt,sec)$(sum((com,pass),newshare0(cnt,sec,com,pass)) and SID(sec)=3 and sum(step,KZ0(cnt,sec,step)))=KZ(cnt,sec)/(KZ0(cnt,sec,"3")*temp0(cnt,sec))

* count how many multSAM are nonnegative
parameter count(cnt,*);
count(cnt,sec)=sum(com$(multSAM(cnt,sec,com)),multSAM(cnt,sec,com)/multSAM(cnt,sec,com));
count(cnt,'HOUS')=sum(com$(multSAM(cnt,'HOUS',com)),multSAM(cnt,'HOUS',com)/multSAM(cnt,'HOUS',com));

* Prices: if their initial share in the SAM is zero take the average of the other multipliers.
multSAM(cnt,sec,com)$(sum(pass,newshare0(cnt,sec,com,pass)) and FID(com)>0 and FID(com)<3 and SID(sec)=3 and (IOZ(cnt,com,sec)=0 or newshare0(cnt,sec,com,"3")=0))=sum(g$(multSAM(cnt,sec,g)),multSAM(cnt,sec,g))/count(cnt,sec);
multSAM(cnt,'HOUS',com)$(sum(pass,newshare0(cnt,'HOUS',com,pass)) and FID(com)>0 and FID(com)<3 and (CZ(cnt,com)=0 or newshare0(cnt,'HOUS',com,"3")=0))=sum(g$(multSAM(cnt,'HOUS',g)),multSAM(cnt,'HOUS',g))/count(cnt,'HOUS');

reSAM(cnt,sec,com,step)$(sum(pass,newshare0(cnt,sec,com,pass)))=0;
reSAM(cnt,'HOUS',com,step)$(sum(pass,newshare0(cnt,'HOUS',com,pass)))=0;
reSAM(cnt,sec,"pH2",step)=0;

* this pushes the percentage of all the fossil fuels to zero. It is needed because not all the fuels are accounted in the external data
reSAM(cnt,sec,fosfuels,step)$(sum((pass,com),newshare0(cnt,sec,com,pass)))=IOZ(cnt,fosfuels,sec)*(1-(ord(step))/card(step));
reSAM(cnt,'HOUS',fosfuels,step)$(sum((pass,com),newshare0(cnt,'HOUS',com,pass)))=CZ(cnt,fosfuels)*(1-(ord(step))/card(step));
*SAM(cnt,fosfuels,sec)*(1-(ord(step))/card(step));
reSAM(cnt,sec,fosfuels,step)$(sum((pass,com),newshare0(cnt,sec,com,pass)) and ord(step) le 5)=IOZ(cnt,fosfuels,sec);
reSAM(cnt,'HOUS',fosfuels,step)$(sum((pass,com),newshare0(cnt,'HOUS',com,pass)) and ord(step) le 5)=CZ(cnt,fosfuels);
*SAM(cnt,fosfuels,sec);
* this line reassigns the fuels according to the external data.
reSAM(cnt,sec,com,step)$(sum(pass,newshare0(cnt,sec,com,pass)))=newshare0(cnt,sec,com,step)*temp0(cnt,sec)*multSAM(cnt,sec,com);
reSAM(cnt,'HOUS',com,step)$(sum(pass,newshare0(cnt,'HOUS',com,pass)))=newshare0(cnt,'HOUS',com,step)*tempH0(cnt)*multSAM(cnt,'HOUS',com);
reSAM(cnt,sec,"pH2",step)=newshare0(cnt,sec,"pH2",step)*temp0(cnt,sec)*multSAM(cnt,sec,"pH2");
reKZ(cnt,sec,step)= KZ0(cnt,sec,step)*temp0(cnt,sec)*multKZ(cnt,sec);

* compute new shares for the power sector techchange
*newshare(cnt,sec,com,step)$(sum(pass,newshare0(cnt,sec,com,pass)) and reSAM(cnt,sec,com,step))=reSAM(cnt,sec,com,step)/(sum(g$(CID(g)=1),reSAM(cnt,sec,g,step))+reKZ(cnt,sec,step));
newshare(cnt,sec,com,step)$(reSAM(cnt,sec,com,step))=reSAM(cnt,sec,com,step)/(sum(g,reSAM(cnt,sec,g,step))+reKZ(cnt,sec,step));
newshare(cnt,'HOUS',com,step)$(reSAM(cnt,'HOUS',com,step))=reSAM(cnt,'HOUS',com,step)/(sum(g,reSAM(cnt,'HOUS',g,step)));

newshare(cnt,sec,"pH2",step)$(newshare(cnt,sec,"pH2",step))=reSAM(cnt,sec,"pH2",step)/(sum(g,reSAM(cnt,sec,g,step))+reKZ(cnt,sec,step));
KZshare(cnt,sec,step)$(sum(pass,KZ0(cnt,sec,pass)) and sum(com,newshare(cnt,sec,com,step)))=1-sum(com,newshare(cnt,sec,com,step));
*newshare(cnt,"HOUS",com,step)=newshare(cnt,"iSER",com,step);


* share of renewable, fossils and fossils with CCS as for Genesys-mod
parameter renE(cnt,step), fosE(cnt,step), CCSE(cnt,step);
* compute the share of power with fossil fuels
fosE(cnt,step)=sum(fosfuels,newshare(cnt,'iELC',fosfuels,step));
* compute the share of power with renewables
renE(cnt,step)=1-fosE(cnt,step);
* compute the share of fossil with CCS
CCSE(cnt,step)=fosE(cnt,step)*SelCCS(cnt,step);
* redefine the fossil without CCS
fosE(cnt,step)=fosE(cnt,step)*(1-SelCCS(cnt,step));

* norway has mismatch between reconstructed SAM and original one due to wrong data from platform for Norway, GB and Switzerland
* as a mention, in the external data power consumption is zero for norway for households in 2010
execute_unload "reshare", newshare0, multSAM, multKZ, IOZ, temp0, CZ, tempH0, reSAM, reKZ, newshare,KZshare,KZ,KZ0, renE, fosE, CCSE;

*$exit

* ================================ DONE ========================================


parameter Pathway_adj(cnt, *, *) Sum of the adjustments from all cases


* Parameters used to define the change in technology structure of the sectors in the model
parameter temp(cnt,*),
tempH(cnt)
selected(cnt,sec),
pathway_adj_total(cnt, *, *)  Original values plus the total adjustments ,
pathway_unadj_total(cnt, *, *)  Original Input coeficient ,
Pathway_total(cnt, *)  New total input  per sector and consumers after adjustments,
Pathway_adj_cap(cnt, sec) Original capital minus the pathway adjustment total if the latter is negative;
Parameter Pathway_adjusted(step, cnt,  *, com);
* it is important that temp is initialized to 0 for defining the parameter pathways_cap_adj
temp(cnt,sec)=0;
* to select sectors with technology change in the capital
selected(cnt,sec)=sum(step,KZshare(cnt,sec,step));

parameter bin to account for unemployment (0 in benchmark and 1 in counterfactual);
bin=0;
parameter SR(cnt) savings ratio in the model;
SR(cnt)=1;
*l.        Inclusion of the CGE model
* ============                             ===================
* ============ DEFINITION OF THE CGE MODEL ===================
* ============                             ===================

$include "REMES_MPSGE_alt.gms"

* ============                             ===================
* ============ DEFINITION OF THE CGE MODEL ===================
* ============                             ===================

* ============ Provide initial levels of the model variables ===================


option mcp = path ;
Arrow_Debreu.iterlim = IterLim;
Arrow_Debreu.tolProj = 0.00001;
Arrow_Debreu.tolInfeas = 0.01;
Arrow_Debreu.workfactor = 3;
Arrow_Debreu.reslim = 6000;

* POPULATE THE SECTORS AND COMMODITIES THAT WILL BE MODIFIED
*populate the sets for the adjustment operations

set adjust_sec(*), adjust_com(*);


adjust_sec(sec)=YES;
adjust_sec("Hous")=YES;
adjust_sec("Govt")=YES;

adjust_com(com)=YES;
adjust_com("pH2")=YES;


parameter check(cnt, *, *);

Pathway_adj(cnt, sec, com)=0;
Pathway_adj(cnt, "HOUS", com)=0;
Pathway_adj(cnt, "GOVT", com)=0;
Pathway_adj_cap(cnt, sec)=KZ(cnt,sec);
Pathway_total(cnt, "HOUS")=0;
Pathway_total(cnt, "GOVT")=0;
Pathway_total(cnt, sec)=0;
* GDP growth is set to unit for the benchmark solution
gdp_p(cnt)=1;
growth_p(cnt)=1;
growth_e(cnt)=1;
growth_lf(cnt)=1;
display ty;

parameter time;
time=0;

parameter PRC(cnt);
PRC(cnt)=1;
parameter open(cnt,sec);
open(cnt,sec)=1;
*==================== Benckmark Solution ======================
*execute_unload "junk" XDDZ,TRADEZ,EROWZ,MROWZ;

parameter Capital(cnt,step),Investments(cnt,step);

* ================= Other scenario optons =========================
parameter tfp(cnt) tariff per country;
tfp(cnt)=0;

* catch up from the rest of the world.
parameter ROWgt;
ROWgt=1;

* Exports of coal factor
parameter ROWc;
ROWc=0;

* ================================================================

scalar hb /0/;

$include "reset_initial_values_basic.gms"
$INCLUDE ARROW_DEBREU.GEN
Arrow_Debreu.iterlim = 0;
ARROW_DEBREU.Savepoint = 1;
Solve ARROW_DEBREU using mcp;


$include "balances.gms"

*$exit
parameter depr(cnt) depreciation;
* 20a) Capital accumulation
* the depreciation must depend on the number of periods
* first year is 2007 last is 2050 and there are 10 periods so every period is 5 years long
* II(cnt) in the benckmark year are the investments that are transfered to the next year to increase the capital
* Then we assume that for one period (5 years) the additional investment is II*5
* If investments are too small the capital might become zero (sector shuts down).
* we define the depreciation such that Kap(1-depr)+I=Kap(1+gdp)
* depr(cnt)=5*II.l(cnt)/Kap(cnt)-(gdp(cnt,"1")-1);
* Kap(cnt)=Kap(cnt)*(1-depr(cnt))+5*II.l(cnt);





parameter emissions(cnt,com,sec);
emissions(cnt,com,sec)=(IOZ(cnt,com,sec)+Pathway_adj(cnt, sec, com))*CO2r(cnt,com,sec);
display emissions;

* define the visegrad countries for non cooperative case studies.

set visegrad(cnt)/
CZ
HU
PL
SK
/;

parameter inVis(cnt) visegrad countries flag;
inVis(cnt)=0;
inVis(visegrad)=1;

*m.         Base year output definition
* OUT ============= Define Parameters for Output =============================
parameter production(cnt,*,*,step), finaldemand(cnt,com,step),import(cnt,com,step),exports(cnt,*,step),
IOanalysis(*,*,*,*,step), inputsec3(cnt,*,*,step), outputsec3(cnt,*,*,step), inputsec4(cnt,*,*,step),
TradeAnalysis(*,*,com,step)
outputsec4(cnt,*,*,step) total value entering a sector and total value exiting a sector;


finaldemand(cnt,com,"1")=CZ(cnt,com)+IZ(cnt,com)+CGZ(cnt,com);
production(cnt,sec,com,"1")=XDDZ(cnt,sec,com);
IOanalysis('input',cnt,sec,com,"1")=IOZ(cnt,com,sec)*(1+taxcz(cnt,com));
IOanalysis('input',cnt,sec,"Labour","1")=LZ(cnt,sec);
IOanalysis('input',cnt,sec,"Capital","1")=Pathway_adj_cap(cnt, sec)+AOGR(cnt)$(sameas(sec,"iCOI"))+ACR(cnt)$(sameas(sec,"iCOA"))+ANGR(cnt)$(sameas(sec,"iNG"));
IOanalysis('input',cnt,sec,"tax_sec","1")=sum(com,XDDZ(cnt,sec,com)*taxpz(cnt,sec));
IOanalysis('input',cnt,"demand",com,"1")=finaldemand(cnt,com,"1")*(1+taxcz(cnt,com));
IOanalysis('input',cnt,"stocks",com,"1")=SVZ(cnt,com);
IOanalysis('input',cnt,"tmarg",com,"1")=TMXZ(cnt,com);
IOanalysis('input',cnt,"exportsROW",com,"1")=EROWZ(cnt,com)+sum(cntt$(ord(cntt) ne ord(cnt)),TRADEZ(com,cnt,cntt));

IOanalysis('output',cnt,sec,com,"1")=XDDZ(cnt,sec,com);
IOanalysis('output',cnt,"tax_com",com,"1")=(sum(sec,IOZ(cnt,com,sec))+finaldemand(cnt,com,"1"))*taxcz(cnt,com);
IOanalysis('output',cnt,"tmarg",com,"1")=sum(cntt,trademargins(com, cntt, cnt));
IOanalysis('output',cnt,"importsROW",com,"1")=MROWZ(cnt,com)+sum(cntt$(ord(cntt) ne ord(cnt)),TRADEZ(com,cntt,cnt));


parameter UNEMPLOYMENT(cnt,*);
UNEMPLOYMENT(cnt,"1")=ROUND(urate(cnt)*100);

parameter EneDem(cnt,*,*),EneDemBase(cnt,*),EneDemProj(cnt,*),EneDemTot(cnt,*),Alloc(cnt,*,*),EneDemTWh(cnt,*,*);
EneDem(cnt,sec,"1")=IOZ(cnt, "pELE", sec);
EneDem(cnt,"iH2S","1")=0;
EneDem(cnt,"iH2C","1")=0;
EneDem(cnt,"iH2E","1")=0;
EneDem(cnt,"CONS","1")=CZ(cnt,"pELE")
                 +CGLZ(cnt,"pELE")
                 +IZ(cnt,"pELE");


parameter PriceCO2(step),ElPrice(cnt,step),CO2Pr(cnt,step);
parameter
* ---- In plain words ----------------------------------------------------------------------
* Here the yearly pollution report is prepared: pollution by type for each country and
* year, the pollution tax and the money it raises. For the starting year the figures come
* from the check above. The report also has an entry for the part of fuel-burning
* pollution that comes from biofuel.
* -------------------------------------------------------------------------------------------
*   report by type: comb (fuel combustion, of which comb_bio from the bio fuel), act (activity), total
APemis(cnt,pol,*,step)  air pollutant emissions in Gg by type - comb (of which bio) or act or total
*   tax per Gg of each capped pollutant: permit price deflated by the consumer price index PU
APtax(cnt,pol,step)     air pollutant tax - permit price PAP relative to PU per Gg
*   revenue of the permits (price x threshold), deflated by PU; received by the local government
APrev(cnt,step)         air pollutant tax revenue to the local government relative to PU
*   permits used by each buyer in the current step, computed after the solve (no MPSGE report, see REMES_MPSGE_alt.gms)
APuse(cnt,pol,*)        air pollutant permits used by each sector and final user in Gg;
*   step 1 (benchmark): combustion emissions from the calibration check (= EDGAR combustion)
APemis(cnt,pol,"comb","1")  = APcheck(cnt,pol,"comb");
*   step 1 (benchmark): bio part of combustion emissions from the calibration check
APemis(cnt,pol,"comb_bio","1")   = APcheck(cnt,pol,"comb_bio");
*   step 1: activity emissions from the calibration check
APemis(cnt,pol,"act","1")   = APcheck(cnt,pol,"act");
*   step 1: total = combustion + activity (= EDGAR total)
APemis(cnt,pol,"total","1") = APcheck(cnt,pol,"comb")+APcheck(cnt,pol,"act");
PriceCO2("1")=1;
CO2Pr(cnt,"1")=1;
ElPrice(cnt,"1")=1;


parameter FFdem(cnt,com,step),EEdem(cnt,*,step);

FFdem(cnt,energy,"1")=sum(sec,IOZ(cnt,energy,sec))+CZ(cnt,energy)+CGLZ(cnt,energy)+IZ(cnt,energy);
EEdem(cnt,sec,"1")=sum((fosfuels),IOZ(cnt,fosfuels,sec)*CO2r(cnt,fosfuels,sec)*cint(cnt,sec));
EEdem(cnt,"HOUS","1")=sum(fosfuels,CZ(cnt,fosfuels)*CO2r(cnt,fosfuels,"HOUS")*cint(cnt,"iSER"));
EEdem(cnt,"GOVT","1")=sum(fosfuels,CGLZ(cnt,fosfuels)*CO2r(cnt,fosfuels,"GOVT")*cint(cnt,"iSER"));
EEdem(cnt,"INV","1")=sum(fosfuels,IZ(cnt,fosfuels)*CO2r(cnt,fosfuels,"INV")*cint(cnt,"iSER"));
EEdem(cnt,"tmarg","1")= sum(fosfuels,TMXZ(cnt,fosfuels)*CO2r(cnt,fosfuels,"tmarg")*cint(cnt,"iSER"));
EEdem(cnt,sec,"1")$nonpoll(sec)=0

parameter demand(cnt,*,com,step),cdem(cnt,com,step);
demand(cnt,sec,com,"1")=IOZ(cnt,com,sec);
demand(cnt,"HOUS",com,"1")=CZ(cnt,com);
demand(cnt,"GOVT",com,"1")=CGZ(cnt,com);
demand(cnt,"INVB",com,"1")=IZ(cnt,com);
demand(cnt,"stocks",com,"1")=max(0,SVZ(cnt,com));
demand(cnt,"Exports",com,"1")=EROWZ(cnt,com);

cdem(cnt,com,"1")=sum(sec,demand(cnt,sec,com,"1"))+demand(cnt,"HOUS",com,"1")+demand(cnt,"GOVT",com,"1")+demand(cnt,"INVB",com,"1")+demand(cnt,"Exports",com,"1")+demand(cnt,"stocks",com,"1");

parameter SAMout(cnt,*,*,step),QQQ(cnt,*,*,step),PPP(cnt,*,*,step),Quantity(cnt,*,*,step),FtPrt(cnt,sec,com,step);
parameter ConsExp(*,cnt,step);
* ---- In plain words ----------------------------------------------------------------------
* Here the air pollution of each industry is shared out among the products it makes, in
* proportion to how much of each product it makes, as FtPrt does for CO2. Only pollution
* of the industries is shared out: households, government, investment and transport
* margins burn fuels too, but their pollution is not part of any product.
* -------------------------------------------------------------------------------------------
*   air pollutant emissions of each sector (fuel combustion + activity), Gg
parameter APsecE(cnt,pol,sec,step)          air pollutant emissions of each sector in Gg - combustion plus activity
*   air pollutant emissions embedded in each product of each sector, Gg (pollutant footprint, as FtPrt for CO2)
          FtPrtAP(cnt,pol,sec,com,step)     air pollutant emissions embedded in each product of each sector in Gg;

SAMout(cnt,sec,com,step)=0;
QQQ(cnt,sec,com,step)=0;
PPP(cnt,sec,com,step)=0;
Quantity(cnt,samd,samr,step)=0;

parameter EUIMP(cnt,com,step),EUEXP(cnt,com,step);
parameter MCO2B(cnt,step) monetary value of the CO2 budget;
parameter VA(cnt,sec,step),FuelPrice(cnt,fosfuels,step),GDPout(cnt,step);


SAMout(cnt,com,sec,"1")=IOZ(cnt,com,sec)*(1+taxcz(cnt,com));
SAMout(cnt,sec,com,"1")$(XDDZ(cnt,sec,com))=XDDZ(cnt,sec,com);
SAMout(cnt,"iH2S","pH2","1")=0;
SAMout(cnt,"iH2C","pH2","1")=0;
SAMout(cnt,"iH2E","pH2","1")=0;
SAMout(cnt,"Capital",sec,"1")=Pathway_adj_cap(cnt, sec)+AOGR(cnt)$(sameas(sec,"iCOI"))+ACR(cnt)$(sameas(sec,"iCOA"))+ANGR(cnt)$(sameas(sec,"iNG"));
SAMout(cnt,"Labour",sec,"1")=LZ(cnt,sec);
SAMout(cnt,"tax_sec",sec,"1")=sum(com,taxpz(cnt,sec)*XDDZ(cnt,sec,com));
SAMout(cnt,com,"HOUS","1")=CZ(cnt,com)*(1+taxcz(cnt,com));
SAMout(cnt,com,"GOVT","1")=CGLZ(cnt,com)*(1+taxcz(cnt,com));
SAMout(cnt,com,"INV","1")=IZ(cnt,com)*(1+taxcz(cnt,com));
SAMout(cnt,com,"STOCKS","1")=SVZ(cnt,com);
SAMout(cnt,"HOUS","Capital","1")=KSZ(cnt)+AOGR(cnt)+ACR(cnt)+ANGR(cnt);
SAMout(cnt,"GOVT","Capital","1")=-sum(sec,pathway_total(cnt, sec));
SAMout(cnt,"HOUS","Labour","1")=sum(sec,LZ(cnt,sec));
SAMout(cnt,"INV","HOUS","1")=SHZ(cnt);
SAMout(cnt,"HOUS","trade","1")=max(0, TRHROWZ(cnt));
SAMout(cnt,"trade","HOUS","1")=max(0,-TRHROWZ(cnt));
SAMout(cnt,"GOVT","tax_sec","1")=sum(sec,taxp(cnt,sec)*sum(com,XDDZ(cnt,sec,com)));
SAMout(cnt,"GOVT","tax_com","1")=sum(com,sum(sec,IOZ(cnt,com,sec)*taxcz(cnt,com))+(CZ(cnt,com)+CGLZ(cnt,com)+IZ(cnt,com))*taxcz(cnt,com));
SAMout(cnt,"tax_sec",sec,"1")=taxpz(cnt,sec)*sum(com,XDDZ(cnt,sec,com));
SAMout(cnt,"tax_com",com,"1")=sum(sec,IOZ(cnt,com,sec))*taxcz(cnt,com)+(CZ(cnt,com)+CGLZ(cnt,com)+IZ(cnt,com))*taxcz(cnt,com);
SAMout(cnt,"STOCKS","INV","1")=sum(com,SVZ(cnt,com));
SAMout(cnt,com,"tmarg","1")= TMXZ(cnt,com);
SAMout(cnt,"tmarg",com,"1")= TMCZ(cnt,com);
SAMout(cnt,com,"trade","1")= EROWZ(cnt,com)+sum(cntt,TRADEZ(com,cnt,cntt));
SAMout(cnt,"trade",com,"1")=MROWZ(cnt,com)+sum(cntt,TRADEZ(com,cntt,cnt));
SAMout(cnt,"GOVT","trade","1")=TRROWZ(cnt);
SAMout(cnt,"CO2allow",sec,"1")=0;
SAMout(cnt,"CO2allow","HOUS","1")=0;
SAMout(cnt,"CO2allow","GOVT","1")=0;
SAMout(cnt,"CO2allow","INV","1") =0;
SAMout(cnt,"GOVT","CO2allow","1")=0;

ConsExp("HOUS",cnt,"1")=sum((com),SAMout(cnt,com,"HOUS","1"))+SAMout(cnt,"trade","HOUS","1");
ConsExp("GOVT",cnt,"1")=sum((com),SAMout(cnt,com,"GOVT","1"));
ConsExp("INV",cnt,"1")=sum((com),SAMout(cnt,com,"INV","1"));

VA(cnt,sec,"1")=SAMout(cnt,"Capital",sec,"1")+SAMout(cnt,"Labour",sec,"1")+SAMout(cnt,"tax_sec",sec,"1")+SAMout(cnt,"GOVT","CO2allow","1");
GDPout(cnt,"1")=sum(sec,VA(cnt,sec,"1"));

QQQ(cnt,com,sec,"1")$SAM(cnt,com,sec)=0;
QQQ(cnt,sec,com,"1")$SAM(cnt,sec,com)=0;
QQQ(cnt,"Capital",sec,"1")$SAM(cnt,"Capital",sec)=0;
QQQ(cnt,"Labour",sec,"1")$SAM(cnt,"Labour",sec)=0;
QQQ(cnt,"tax_sec",sec,"1")$SAM(cnt,"tax_sec",sec)=0;
QQQ(cnt,com,"HOUS","1")$SAM(cnt,com,"HOUS")=0;
QQQ(cnt,com,"GOVT","1")$SAM(cnt,com,"GOVT")=0;
QQQ(cnt,com,"INV","1")$SAM(cnt,com,"INV")=0;
QQQ(cnt,com,"STOCKS","1")$SAM(cnt,com,"STOCKS")=0;
QQQ(cnt,"HOUS","Capital","1")$SAM(cnt,"HOUS","Capital")=0;
QQQ(cnt,"GOVT","Capital","1")$SAM(cnt,"GOVT","Capital")=0;
QQQ(cnt,"HOUS","Labour","1")$SAM(cnt,"HOUS","Labour")=0;
QQQ(cnt,"INV","HOUS","1")$SAM(cnt,"INV","HOUS")=0;
QQQ(cnt,"HOUS","trade","1")$SAM(cnt,"HOUS","trade")=0;
QQQ(cnt,"trade","HOUS","1")$SAM(cnt,"trade","HOUS")=0;
QQQ(cnt,"GOVT","tax_sec","1")=0;
QQQ(cnt,"GOVT","tax_com","1")=0;
QQQ(cnt,"tax_sec",sec,"1")$SAM(cnt,"tax_sec",sec)=0;
QQQ(cnt,"tax_com",com,"1")$SAM(cnt,"tax_com",com)=0;
QQQ(cnt,"STOCKS","INV","1")=0;
QQQ(cnt,com,"tmarg","1")$SAM(cnt,com,"tmarg")=0;
QQQ(cnt,"tmarg",com,"1")= 0;
QQQ(cnt,com,"trade","1")$SAM(cnt,com,"trade")=0;
QQQ(cnt,"trade",com,"1")$SAM(cnt,"trade",com)=0;
QQQ(cnt,"GOVT","trade","1")$SAM(cnt,"GOVT","trade")=0;
QQQ(cnt,"CO2allow",sec,"1")=0;
QQQ(cnt,"CO2allow","HOUS","1")=0;
QQQ(cnt,"CO2allow","GOVT","1")=0;
QQQ(cnt,"CO2allow","INV","1") =0;
QQQ(cnt,"GOVT","CO2allow","1")=0;

Quantity(cnt,samd,samr,"1")=SAM(cnt,samd,samr);
Quantity(cnt,sec,com,"1")=SAM(cnt,sec,com);
Quantity(cnt,com,sec,"1")=SAM(cnt,com,sec);

Quantity(cnt,com,sec,"1")=IOZ(cnt,com,sec);
Quantity(cnt,sec,com,"1")$(XDDZ(cnt,sec,com))=XDDZ(cnt,sec,com);
Quantity(cnt,"iH2S","pH2","1")=0;
Quantity(cnt,"iH2C","pH2","1")=0;
Quantity(cnt,"iH2E","pH2","1")=0;
Quantity(cnt,"Capital",sec,"1")=Pathway_adj_cap(cnt, sec)+AOGR(cnt)$(sameas(sec,"iCOI"))+ACR(cnt)$(sameas(sec,"iCOA"))+ANGR(cnt)$(sameas(sec,"iNG"));
Quantity(cnt,"Labour",sec,"1")=LZ(cnt,sec);
Quantity(cnt,com,"HOUS","1")=CZ(cnt,com);
Quantity(cnt,com,"GOVT","1")=CGLZ(cnt,com);
Quantity(cnt,com,"INV","1")=IZ(cnt,com);
Quantity(cnt,com,"STOCKS","1")=SVZ(cnt,com);
Quantity(cnt,"HOUS","Capital","1")=KSZ(cnt)+AOGR(cnt)+ACR(cnt)+ANGR(cnt);
Quantity(cnt,"GOVT","Capital","1")=-sum(sec,pathway_total(cnt, sec));
Quantity(cnt,"HOUS","Labour","1")=sum(sec,LZ(cnt,sec));
Quantity(cnt,"INV","HOUS","1")=SHZ(cnt);
Quantity(cnt,"HOUS","trade","1")=max(0, TRHROWZ(cnt));
Quantity(cnt,"trade","HOUS","1")=max(0,-TRHROWZ(cnt));
Quantity(cnt,"STOCKS","INV","1")=sum(com,SVZ(cnt,com));
Quantity(cnt,com,"tmarg","1")= TMXZ(cnt,com);
Quantity(cnt,"tmarg",com,"1")= TMCZ(cnt,com);
Quantity(cnt,com,"trade","1")= EROWZ(cnt,com)+sum(cntt,TRADEZ(com,cnt,cntt));
Quantity(cnt,"trade",com,"1")=MROWZ(cnt,com)+sum(cntt,TRADEZ(com,cntt,cnt));
Quantity(cnt,"GOVT","trade","1")=TRROWZ(cnt);
Quantity(cnt,"CO2allow",sec,"1")=0;
Quantity(cnt,"CO2allow","HOUS","1")=0;
Quantity(cnt,"CO2allow","GOVT","1")=0;
Quantity(cnt,"CO2allow","INV","1") =0;
Quantity(cnt,"GOVT","CO2allow","1")=0;

FtPrt(cnt,sec,com,"1")$(XDDZ(cnt,sec,com))=Quantity(cnt,sec,com,"1")/sum(g,Quantity(cnt,sec,g,"1"))*EEdem(cnt,sec,"1");

* air pollutant footprint per product, benchmark (as APemis "1": benchmark fuel use APq and output XDZ)
*   sector emissions: combustion factor x benchmark fuel use, plus activity factor x benchmark output
APsecE(cnt,pol,sec,"1") = sum(com$apcom(com), APr(cnt,pol,com,sec)*APq(cnt,com,sec)) + EFact(cnt,pol,sec)*XDZ(cnt,sec);
*   product share: emissions of the sector x share of the product in the sector's output
FtPrtAP(cnt,pol,sec,com,"1")$(XDDZ(cnt,sec,com) and sum(g,Quantity(cnt,sec,g,"1")))
*   (continuation) the output share of the product, times the sector's emissions
    = Quantity(cnt,sec,com,"1")/sum(g,Quantity(cnt,sec,g,"1"))*APsecE(cnt,pol,sec,"1");

PPP(cnt,com,sec,"1")=(1+taxc(cnt,com))/(1+taxcz(cnt,com));
PPP(cnt,sec,com,"1")$(XDDZ(cnt,sec,com))=1;
PPP(cnt,"Capital",sec,"1")=1;
PPP(cnt,"Labour",sec,"1")=1;
PPP(cnt,com,"HOUS","1")=(1+taxc(cnt,com))/(1+taxcz(cnt,com));
PPP(cnt,com,"GOVT","1")=(1+taxc(cnt,com))/(1+taxcz(cnt,com));
PPP(cnt,com,"INV","1")=(1+taxc(cnt,com))/(1+taxcz(cnt,com));
PPP(cnt,com,"STOCKS","1")=1;
PPP(cnt,"HOUS","Capital","1")=1;
PPP(cnt,"GOVT","Capital","1")=1;
PPP(cnt,"HOUS","Labour","1")=1;
PPP(cnt,"INV","HOUS","1")=1;
PPP(cnt,"HOUS","trade","1")=1;
PPP(cnt,"trade","HOUS","1")=1;
PPP(cnt,"GOVT","tax_sec","1")=1;
PPP(cnt,"GOVT","tax_com","1")=1;
PPP(cnt,"tax_sec",sec,"1")=1;
PPP(cnt,"tax_com",com,"1")=1;
PPP(cnt,"STOCKS","INV","1")=1;
PPP(cnt,com,"tmarg","1")= 1;
PPP(cnt,"tmarg",com,"1")= 1;
PPP(cnt,com,"trade","1")= 1;
PPP(cnt,"trade",com,"1")=1;
PPP(cnt,"GOVT","trade","1")=1;
PPP(cnt,"CO2allow",sec,"1")=1;
PPP(cnt,"CO2allow","HOUS","1")=1;
PPP(cnt,"CO2allow","GOVT","1")=1;
PPP(cnt,"CO2allow","INV","1") =1;
PPP(cnt,"GOVT","CO2allow","1")=1;


EUIMP(cnt,com,"1")=sum(cntt,TRADEZ(com,cntt,cnt));
EUEXP(cnt,com,"1")=sum(cntt,TRADEZ(com,cnt,cntt));
*PRC0 is the baseline productivity, while PRC1 is the counterfactual one for tests.
* I tried to include productivity in the Value Added nest but it does not work,
* therefore I use it here to define the growth of the economy considering a proportion
* between the baseline growth and the counterfactual one


Capital(cnt,"1")=KSZ(cnt)/ror(cnt);
Investments(cnt,"1")=ITZ(cnt)*5;

*n.        Recoursive step definition
* In the GTAP database the depreciation rate d is assumed to be constant at 4 % for any region

* ================ Dynamic data for first iteration ===================
* one period depreciation (5 years)
*Kap(cnt)=KSZ(cnt)/ror(cnt);
*depr(cnt)=ITZ(cnt)*5/Kap(cnt)-grow(cnt);
*Kap(cnt)=(Kap(cnt)*(1-depr(cnt))+ITZ(cnt)*5);
*KSZ(cnt)=Kap(cnt)*ror(cnt);
* ======================================================================

display Kap,KSZ,depr;

parameter gdptest(cnt,step);
gdptest(cnt,"1")=1;
gdptest(cnt,"2")=1;

parameter NRS(cnt,sec,com,step) new remes share;
NRS(cnt,sec,com,step)=0;

parameter outLab(cnt,sec,step), outAct(cnt,sec,step),outPrice(cnt,com,step),outWages(cnt,step),outKap(cnt,step);
parameter PriceIndex(cnt,step);
parameter WVA(cnt,sec0,sec) Weight of a sector Value Added in the aggregation;
parameter VAos(cnt,sec0,step) Value added re-expressed in original sectors;
parameter VAps(cnt,Psecs,step) Value added re-expressed in PRIMES sectors;


WVA(cnt,sec0,sec)=0;
WVA(cnt,sec0,sec)$(maps(sec0,sec) and (SAMt(cnt,"Labour",sec0)+SAMt(cnt,"Capital",sec0)+SAMt(cnt,"tax_sec",sec0)) gt 0)=
(SAMt(cnt,"Labour",sec0)+SAMt(cnt,"Capital",sec0)+SAMt(cnt,"tax_sec",sec0))/sum(secc0$maps(secc0,sec),SAMt(cnt,"Labour",secc0)+SAMt(cnt,"Capital",secc0)+SAMt(cnt,"tax_sec",secc0));

VAos(cnt,sec0,"1")=sum(secc$maps(sec0,secc),VA(cnt,secc,"1"))*sum(sec$maps(sec0,sec),WVA(cnt,sec0,sec));

VAps(cnt,Psecs,"1")=sum(sec0,VAos(cnt,sec0,"1")*P2R(cnt,sec0,Psecs));

outLab(cnt,sec,'1')=LZ(cnt,sec);
outAct(cnt,sec,'1')=XDZ(cnt,sec);
outPrice(cnt,com,'1')=1;
outWages(cnt,'1')=1;
outKap(cnt,'1')=1;

parameter r_taxc(cnt,com,step);

Parameter
    shiftfac(cnt)        "Circularity shift factor"
    servtot(cnt,sec)     "Total service base in sector"
    indtotrem(cnt,sec)   "Total amount removed from industrial commodities";


* ################################################
* ############ START OF THE LOOP #################
* ################################################

* =====================================================================
* ============= GDP CALIBRATION LOOP - SNAPSHOT BEGIN =================
* =====================================================================
* The recursive step loop below mutates a number of state parameters
* (Kap, KSZ, GG, gdp_p, growth_p, growth_lf, cint, eint, taxc, AOGR,
*  ACR, ANGR, Rp, CPD, ROWgt, ROWc, t, time, ...). To allow the outer
* calibration loop to re-run the recursion from a clean initial state
* at every iteration, we snapshot these values BEFORE entering the
* recursive loop and restore them at the start of every iteration.
* This block is harmless when CalGDP=0 (the loop runs exactly once).

parameters
    CFac_save(cnt)   "snapshot of CFac"
    Kap_save(cnt)          "snapshot of Kap"
    KSZ_save(cnt)          "snapshot of KSZ"
    GG_save(cnt,sec)       "snapshot of GG"
    gdp_p_save(cnt)        "snapshot of gdp_p"
    growth_p_save(cnt)     "snapshot of growth_p"
    growth_e_save(cnt)     "snapshot of growth_e"
    growth_lf_save(cnt)    "snapshot of growth_lf"
    cint_save(cnt,sec)     "snapshot of cint"
    eint_save(cnt)         "snapshot of eint"
    taxc_save(cnt,com)     "snapshot of taxc"
    AOGR_save(cnt)         "snapshot of AOGR"
    ACR_save(cnt)          "snapshot of ACR"
    ANGR_save(cnt)         "snapshot of ANGR"
    Rp_save(cnt)           "snapshot of Rp"
    CPD_save(cnt)          "snapshot of CPD"
    CO2r_save(cnt,com,sec) "snapshot of sector emission factors"
;
scalars
    ROWgt_save  "snapshot of ROWgt"
    ROWc_save   "snapshot of ROWc"
    t_save      "snapshot of step counter t"
    time_save   "snapshot of time counter"
;

CFac_save(cnt)   = CFac(cnt);
Kap_save(cnt)          = Kap(cnt);
KSZ_save(cnt)          = KSZ(cnt);
GG_save(cnt,sec)       = GG(cnt,sec);
gdp_p_save(cnt)        = gdp_p(cnt);
growth_p_save(cnt)     = growth_p(cnt);
growth_e_save(cnt)     = growth_e(cnt);
growth_lf_save(cnt)    = growth_lf(cnt);
cint_save(cnt,sec)     = cint(cnt,sec);
eint_save(cnt)         = eint(cnt);
taxc_save(cnt,com)     = taxc(cnt,com);
AOGR_save(cnt)         = AOGR(cnt);
ACR_save(cnt)          = ACR(cnt);
ANGR_save(cnt)         = ANGR(cnt);
Rp_save(cnt)           = Rp(cnt);
CPD_save(cnt)          = CPD(cnt);
ROWgt_save             = ROWgt;
ROWc_save              = ROWc;
t_save                 = t;
time_save              = time;
CO2r_save(cnt,com,sec) = CO2r(cnt,com,sec);

scalar CalIter   "current calibration iteration"        /0/;
scalar CalErr    "max relative deviation across cnt"    /1/;
parameter CalDev(cnt)               "country deviation gdp/gdptest('10') - 1 (sign-agnostic, used for convergence)";
parameter CalUpd(cnt)               "directional correction term used in the sign-aware update of CFac";
* Indexed iteration set for diagnostic logs (sized loosely above MaxCalIter)
set citer "calibration iterations" /it1*it200/;
parameter CFac_log(cnt,citer)   "log of CFac across calibration iterations";
parameter gdptest_log(cnt,citer)      "log of gdptest('10') across calibration iterations";
parameter GG_log(cnt,sec,citer)       "log of GG (after step 10) across calibration iterations";
parameter CalErr_log(citer)           "log of max calibration error per iteration";

* Outer calibration loop. The condition guarantees the recursive simulation
* runs at least once. When CalGDP=0 it runs exactly once and behaves as
* the original model. When CalGDP=1 it iterates until convergence or
* MaxCalIter is reached.
while(  (CalIter eq 0)
     or ( (CalGDP eq 1) and (CalIter lt MaxCalIter) and (CalErr gt CalTol) ),

  CalIter = CalIter + 1;

* Restore recursive state to its pre-loop snapshot (no-op on CalIter=1
* because the snapshot was just taken; needed from CalIter>=2 onward).
  Kap(cnt)         = Kap_save(cnt);
  KSZ(cnt)         = KSZ_save(cnt);
  GG(cnt,sec)      = GG_save(cnt,sec);
  gdp_p(cnt)       = gdp_p_save(cnt);
  growth_p(cnt)    = growth_p_save(cnt);
  growth_e(cnt)    = growth_e_save(cnt);
  growth_lf(cnt)   = growth_lf_save(cnt);
  cint(cnt,sec)    = cint_save(cnt,sec);
  eint(cnt)        = eint_save(cnt);
  taxc(cnt,com)    = taxc_save(cnt,com);
  AOGR(cnt)        = AOGR_save(cnt);
  ACR(cnt)         = ACR_save(cnt);
  ANGR(cnt)        = ANGR_save(cnt);
  Rp(cnt)          = Rp_save(cnt);
  CPD(cnt)         = CPD_save(cnt);
  CO2r(cnt,com,sec)= CO2r_save(cnt,com,sec);
  ROWgt            = ROWgt_save;
  ROWc             = ROWc_save;
  t                = t_save;
  time             = time_save;

* =====================================================================
* ============= GDP CALIBRATION LOOP - SNAPSHOT END ===================
* =====================================================================

loop(step$(ord(step) gt 1 and ord(step) le STEPS),
t=t+1;

ES0$(ord(step) le 5)=0;
ES0$(ord(step) gt 5)=ES;

ROWgt$(ord(step) le 5)=1;
ROWgt$(ord(step) gt 5)=ROWgt*ROWd;
taxc(cnt,"pELE")$(GSus eq 1 and ord(step) eq 6)=(1+taxc(cnt,"pELE"))*(1-0.05)-1;
taxc(cnt,fosfuels)$(GSus eq 1 and ord(step) eq 6)=(1+taxc(cnt,fosfuels))*(1+0.05)-1;
* In the Ref2020+ scenario there is a trend of decrease of 1.1% of taxes for electricity
taxc(cnt,"pELE")$(GSus eq 1 and ord(step) gt 5)=(1+taxc(cnt,"pELE"))*(1-0.011)-1;

r_taxc(cnt,com,step)=taxc(cnt,com);

PRC(cnt)$(PG eq 1 and ord(step) gt 5)=(1+PRC1(cnt)*0.1)**ord(step);
TaCo(cnt)=sum(year$linktime(year,step),TargCons(cnt,year));
TaCo(cnt)$(ord(step) lt 4)=1;

*PRC(cnt)$(PG eq 1 and P_S eq 3)=(1+PRC2(cnt)*0.1)**ord(step);
*PRC(cnt)$(PG eq 1)=1+(PRC0(cnt))/(card(step)-1)*(ord(step)-1);
*Reset variables to initial levels
$include "reset_initial_values_basic.gms"
open(cnt,sec)=opent(cnt,sec,step);
*put a tax on electricity exports for visegrad countries
tfp(cnt)$(sameas(cnt,"HU"))=tft(step)*tariff;
tfp(cnt)$(sameas(cnt,"CZ"))=tft(step)*tariff;
tfp(cnt)$(sameas(cnt,"PL"))=tft(step)*tariff;
tfp(cnt)$(sameas(cnt,"SK"))=tft(step)*tariff;
*clear****************************************

* update the growth rate based on where we are in the period
* before 2015 I use the standard that I had in openEntrance
* after 2015 I use the one I got from PRIMES for the REF scenario 2020+
*grow(cnt)$(GDPt eq 0 and ord(step) le 3)=(gdp(cnt)*(GDPcal(cnt)$(P_S ne 1) + GDPcalBase(cnt)$(P_S eq 1)))**(5/(2050-2015))-1;
*grow(cnt)$(GDPt eq 0 and ord(step) gt 3)=(gdp(cnt)*(GDPcal2(cnt)$(P_S ne 1) + GDPcalBase(cnt)$(P_S eq 1)))**(5/(2050-2015))-1;

*grow(cnt)$(GDPt eq 1)=0;

* GDP is set to the one from the database for the counterfactual
gdp_p(cnt) = gdp_p(cnt)*(1+grow(cnt));

TRANSFZ(cnt)=0;
TRANSFZ(cnt)$(ord(step) gt 3)=0.1*sum(com,CGZ(cnt,com));
*growth_p(cnt)=growth_p(cnt)*(1+growth(cnt))**5;
growth_p(cnt)=1+(TaCo(cnt)-1)*2;
growth_e(cnt)=1+(TaCo(cnt)-1)*2;
* growth_lf:
*   - For countries present in MIWAG_REF.gdx (pop_step(cnt,'3') > 0) we
*     overwrite growth_lf with the country growth path growth_lf_path(cnt,step):
*       step 1..3 follow the MIWAG-implied yearly rate compounded over
*       5-year intervals; step >= 4 anchors at step 3 and follows the
*       MIWAG ratio pop(year)/pop(2015).
*   - For the remaining countries (BG, CY, GR, IE, LU, MT, PL, GB, CH,
*     NO) we use the population-weighted cross-country average of that
*     same path, avg_pop_ratio(step). This keeps all countries on a
*     consistent positive demographic trend and avoids the negative
*     lfgrow values from growth_table.gms that produced corner solutions.
growth_lf(cnt)$(pgr eq 1 and pop_step(cnt,'3'))       = growth_lf_path(cnt,step);
growth_lf(cnt)$(pgr eq 1 and not pop_step(cnt,'3')) = avg_pop_ratio(step);

* if we want no GDP growth
gdp_p(cnt)$(GDPt eq 1)=1;

* carbon and energy intensity for 5 years
cint(cnt,sec)$(CF eq 1 and ord(step) le 5)=cint(cnt,sec)*cint0(cnt,sec)**5;
cint(cnt,sec)$(CF eq 1 and ord(step) gt 5)=cint(cnt,sec)*cint1(cnt,sec)**5;
eint(cnt)$(EF eq 1 and ExEff eq 0)=1+(eint0(cnt)-1)/(card(step)-1)*(ord(step)-1);
eint(cnt)$(EF eq 1 and ExEff eq 1)=1+(eint0(cnt)$(ord(step) le 5)+eint1(cnt)$(ord(step) gt 5)-1)/(card(step)-1)*(ord(step)-1);
* there is no extra energy efficiency for final consumption.
eintFC(cnt)$(EF eq 1)=1+(eint0(cnt)-1)/(card(step)-1)*(ord(step)-1);

display cint,eint,r_taxc;

*o.        Application of counterfactuals

time=time+1;

display P_S;

         PU.FX("CY")=1;


* Technology Adjustment
* here the data from the scenario Platform is transformed in the final parameters for the model

         loop((cnt, sec),
                 temp(cnt,sec)$(ES eq 1) = sum( com$(sum(pass,newshare(cnt,sec,com,pass))), IOZ(cnt,com,sec)  )+KZ(cnt,sec)$(selected(cnt,sec));
                 T_adj(cnt, sec, com)$(ES eq 1 and sum(pass,newshare(cnt,sec,com,pass))) = newshare( cnt, sec, com, step)*temp(cnt,sec) - IOZ(cnt,com,sec);
                 T_adj(cnt, sec, "pH2")$(ES eq 1) = newshare( cnt, sec, "pH2", step)*temp(cnt,sec);
                 );
         loop((cnt, sec),
                 tempH(cnt)$(HS eq 1) = sum( com$(sum(pass,newshare(cnt,"HOUS",com,pass))), CZ(cnt,com) );
                 T_adj(cnt, "Hous", com)$(HS eq 1 and sum(pass,newshare(cnt,"HOUS",com,pass))) = newshare( cnt, "HOUS", com, step)*tempH(cnt) - CZ(cnt,com);
                 T_adj(cnt, "Hous", "pH2")$(HS eq 1) = newshare( cnt, "Hous", "pH2", step)*tempH(cnt);
                 );

* This holds for all sectors except for iELC, whose techchange is managed by newshare and natural resource sectors, which keep buying their resource.
$ontext
         loop((cnt,sec),

                 T_adj(cnt, sec, "pIND")$(IOZ(cnt,"pIND",sec) and CE eq 1 and ord(step) gt 5)= IOZ(cnt,"pIND",sec)*(1+(Circular(cnt)-1)/(card(step)-1)*(ord(step)-1))-IOZ(cnt,"pIND",sec);
                 T_adj(cnt, sec, "pALU")$(IOZ(cnt,"pALU",sec) and CE eq 1 and ord(step) gt 5)= IOZ(cnt,"pALU",sec)*(1+(Circular(cnt)-1)/(card(step)-1)*(ord(step)-1))-IOZ(cnt,"pALU",sec);

                 T_adj(cnt, sec, "pSER")$((IOZ(cnt,"pIND",sec) or IOZ(cnt,"pALU",sec)) and CE eq 1 and ord(step) gt 5)= (IOZ(cnt,"pIND",sec)+IOZ(cnt,"pALU",sec))*(-(Circular(cnt)-1)/(card(step)-1)*(ord(step)-1));
                 );
$offtext
*$ontext
* ===== CIRCULAR ECONOMY, REMOVE FROM INDUSTRIES AND ADD TO EACH SECTOR PROPORTIONALLY
* factor used in the transition
shiftfac(cnt)$(CE = 1 and ord(step) > 5) = (Circular(cnt) - 1) / (card(step) - 1) * (ord(step) - 1);

* total service base used for proportional allocation
servtot(cnt,sec)$(CE = 1 and ord(step) > 5) = sum(sercoms$IOZ(cnt,sercoms,sec), IOZ(cnt,sercoms,sec));

* total amount removed from industrial commodities
indtotrem(cnt,sec)$(CE = 1 and ord(step) > 5 and servtot(cnt,sec) > 0) = sum(indcoms$IOZ(cnt,indcoms,sec), IOZ(cnt,indcoms,sec) * shiftfac(cnt));

* optional: clear previous values before reassignment
T_adj(cnt,sec,indcoms) = 0;
T_adj(cnt,sec,sercoms) = 0;

* remove proportionally from each industrial commodity
T_adj(cnt,sec,indcoms)$(CE = 1 and ord(step) > 5 and servtot(cnt,sec) > 0 and IOZ(cnt,indcoms,sec))
=  IOZ(cnt,indcoms,sec) * shiftfac(cnt);

* add to services in proportion to their IOZ size
T_adj(cnt,sec,sercoms)$(CE = 1 and ord(step) > 5 and servtot(cnt,sec) > 0 and IOZ(cnt,sercoms,sec))
         = - indtotrem(cnt,sec)* IOZ(cnt,sercoms,sec)/ servtot(cnt,sec);
*$offtext
display T_adj;

*Feb26

GG(cnt,sec)$(GDPt eq 0 and ord(step) gt 1)=GG(cnt,sec)*(1+CFac(cnt) + TotFacProd(cnt,sec));
* Maybe use OECD as ordinal values (rating)

display GG;


* THESE PARAMETERS GO RIGHT INTO THE MODEL

*Caculate the unadjusted total of sectors and consumer's inputs
pathway_unadj_total(cnt, sec, com)       = IOZ(cnt, com, sec);
pathway_unadj_total(cnt, "Hous", com)    = CZ(cnt, com);
pathway_unadj_total(cnt, "Govt", com)    = CGLZ(cnt, com);


*calculate the pathway adjustment
Pathway_adj(cnt, adjust_sec, com)        =  T_adj(cnt, adjust_sec, com);
Pathway_adj(cnt, adjust_sec, "pH2")      =  T_adj(cnt, adjust_sec, "pH2");
Pathway_adj(cnt,  "Hous", com)           =  T_adj(cnt,  "Hous", com);
Pathway_adj(cnt,  "Hous", "pH2")         =  T_adj(cnt,  "Hous", "pH2");


*Calculate the adjustment total
pathway_adj_total(cnt, sec, com) = IOZ(cnt, com, sec) + Pathway_adj(cnt, sec, com);
pathway_adj_total(cnt, "Hous", com) = CZ(cnt, com) + Pathway_adj(cnt, "Hous", com);
pathway_adj_total(cnt, "Govt", com) = CGLZ(cnt, com) + Pathway_adj(cnt, "Govt", com);

*calculate the new total coefficient
loop((cnt, adjust_sec), Pathway_total(cnt, adjust_sec) = sum(adjust_com,  pathway_adj_total(cnt, adjust_sec, adjust_com) - pathway_unadj_total(cnt, adjust_sec, adjust_com)));

* THE TOTAL INCREASE IN OTHER MATERIALS DECREASES THE USAGE OF CAPITAL
* calculate the capital increase per sector

* only if there is a change in shares (temp is non zero)
Pathway_adj_cap(cnt, sec) = KZ(cnt,sec);
Pathway_adj_cap(cnt, sec)$(ES eq 1 and selected(cnt,sec))=temp(cnt,sec)*KZshare(cnt,sec,step)$(temp(cnt,sec));
*KZ(cnt,sec) - pathway_total(cnt, sec)$(pathway_total(cnt, sec)<0);

* reassign the total capital of electricity sector depending on the amount of CCS
Pathway_adj_cap(cnt, 'iELC')=Pathway_adj_cap(cnt, 'iELC')*(fosE(cnt,step)+CCSE(cnt,step)*1.08+renE(cnt,step));
* in case of CCS redefine the emission factors depending on the percentage of CCS with respect to fossils
CO2r(cnt,com,'iELC')=(1-SelCCS(cnt,step))*CO2r(cnt,com,'iELC')+SelCCS(cnt,step)*0.2*CO2r(cnt,com,'iELC');
* CAREFUL! This is redefining the definition of CO2 budget!!!!



display pathway_unadj_total, pathway_adj_total, pathway_total, pathway_adj_cap;


loop((cnt, adjust_sec, com), Pathway_adjusted(step, cnt,  sec, com) = Pathway_adj(cnt, sec, com););


check(cnt, com, "CZ")$(FID(com)>0 and FID(com)<3) =  CZ(cnt, com);
check(cnt, com, "T_adj")$(FID(com)>0 and FID(com)<3) = T_adj(cnt, "Hous", com);
check(cnt, "Hous", "CZ - T_adj") =  sum( com$(FID(com)>0 and FID(com)<3),CZ(cnt, com)) - (sum( com$(FID(com)>0 and FID(com)<3),T_adj(cnt, "hous",  com)) + T_adj(cnt, "Hous", "pH2"));

display check;

NRS(cnt,sec,com,step)$(FID(com)>0 and FID(com)<3)=IOZ(cnt,com,sec)+Pathway_adj(cnt, sec, com);



*=====================Re-Solve============
*option Savepoint = 1;

execute_unload "shocks.gdx" Pathway_adj, Pathway_adj_cap, KZ,pathway_adj_total, Pathway_total, gdp_p,growth_p,T_adj,temp,newshare,ty,PRC, Rp, OGR,AOGR,CR,ACR,NGR,ANGR,gdp_p,eint,cint,ROWd;

*
*PCO2.L(cnt)=0;
CO2P(cnt,com,sec)$(FF(com) eq 1 )     = (IOZ(cnt,com,sec))*CO2rs(cnt,com,sec);
CO2H(cnt,com)$(FF(com) eq 1 )         = (CZ(cnt,com))*CO2r(cnt,com,"HOUS");
CO2G(cnt,com)$(FF(com) eq 1 )         = (CGLZ(cnt,com))*CO2r(cnt,com,"GOVT");
CO2I(cnt,com)$(FF(com) eq 1 )         = IZ(cnt,com)*CO2r(cnt,com,"INV");


* ================ CPD - COUNTERFACTUAL POLICY DEFINITION =====================
* Here we define the CO2 budget
CO2B(cnt) = (1+(finCO2(cnt)-1)/(card(step)-1)*(step.val-1))*(sum((com,sec)$(FF(com) eq 1),(IOZ(cnt,com,sec))*CO2rs(cnt,com,sec))
         +sum(com$(FF(com) eq 1),(CZ(cnt,com))*CO2r(cnt,com,"HOUS")
         +IZ(cnt,com)*CO2r(cnt,com,"INV")
         +(CGLZ(cnt,com))*CO2r(cnt,com,"GOVT")
         +TMXZ(cnt,com)*CO2r(cnt,com,"tmarg")));

* this needs to be the same for all the countries until 2025 under ANY scenario
CO2B(cnt)$(ord(step) le 5) = (1+(0.43-1)/(card(step)-1)*(step.val-1))*(sum((com,sec)$(FF(com) eq 1),(IOZ(cnt,com,sec))*CO2rs(cnt,com,sec))
         +sum(com$(FF(com) eq 1),(CZ(cnt,com))*CO2r(cnt,com,"HOUS")
         +IZ(cnt,com)*CO2r(cnt,com,"INV")
         +(CGLZ(cnt,com))*CO2r(cnt,com,"GOVT")
         +TMXZ(cnt,com)*CO2r(cnt,com,"tmarg")));


* Visegrad stop cooperating after 2020 in case of exit from the deal.
*CO2B(visegrad)$(coop=0 and ord(step) gt 5)=0;
CO2B(cnt)$(GHGred eq 0)=0;

* ---- In plain words ----------------------------------------------------------------------
* Here the pollution caps of this model year are switched on. Where a country has a cap,
* the government hands out that many permits, and polluters must hold permits for what
* they emit. Without a cap, no permits are needed.
* -------------------------------------------------------------------------------------------
* Air pollutant thresholds (Gg) of this step: permit market PAP(cnt,pol) is active where APB > 0
*   threshold of this step from AirPollutantThresholds.gms, only if the cap switch is on
APB(cnt,pol) = APthr(cnt,pol,step)$(APcap eq 1);

*   with the switch off, no permit market anywhere (redundant with the line above, kept as a safeguard)
APB(cnt,pol)$(APcap eq 0) = 0;
* ---- In plain words ----------------------------------------------------------------------
* Here, at every model year, each country is checked: if biofuel pollution is switched on
* and the country has a pollution cap this year, its biofuel gets its own box with the
* pollution permits. Countries without a cap keep the model exactly as before.
* -------------------------------------------------------------------------------------------
*   APbioOn(cnt) = 1 when APbio = 1 and the country has a threshold APB on at least one pollutant
*   for which the bio fuel has a factor APr (any user); read by the conditions in REMES_MPSGE_alt.gms
APbioOn(cnt) = 1$(APbio eq 1 and sum((pol,com)$APbiocom(com), APB(cnt,pol)*sum(apmu, APr(cnt,pol,com,apmu))));

* set to 1 to test for the MIWAG growth
SR(cnt)=1;
*SR(cnt)=SavRatGr(cnt,step);
* ==============================================================================
*effects of unemployment
bin=unp;


*p.        Solution of the n-th iteration
execute_loadpoint "ARROW_DEBREU_p.gdx";
* ---- In plain words ----------------------------------------------------------------------
* Here the solver gets a small starting guess for the price of pollution permits that
* appear for the first time in this year, so that it can start its search.
* -------------------------------------------------------------------------------------------
* starting point for permit prices that become active in this step
*   permit prices that are new in this step (level 0 after the loadpoint) start at 1e-3
*PAP.L(cnt,pol)$(APB(cnt,pol) and PAP.L(cnt,pol) eq 0) = 1e-3;
Arrow_Debreu.iterlim = 999999;
ARROW_DEBREU.Savepoint = 1;
ARROW_DEBREU.optfile = 1;
$INCLUDE ARROW_DEBREU.GEN
Solve ARROW_DEBREU using mcp;

*q.        Output definition
finaldemand(cnt,com,step)$(ord(step) gt 1)=HOUS_DEM.l(cnt,com)+GOVT_DEM.l(cnt,com)+INVB_DEM.l(cnt,com);
production(cnt,sec,com,step)$(ord(step) gt 1)=R_PD_XD.l(cnt, sec, com);

UNEMPLOYMENT(cnt,step)=ROUND(UR.L(cnt)*10000)/100;

EneDem(cnt,sec,step)$(IOZ(cnt, "pELE", sec))=(R_P_XD.L(cnt, sec, "pELE"));
EneDem(cnt,"iH2S",step)$(InputCom("iH2S","pELE"))=(R_P_XD.L(cnt, "iH2S", "pELE"));
EneDem(cnt,"iH2C",step)$(InputCom("iH2C","pELE"))=(R_P_XD.L(cnt, "iH2C", "pELE"));
EneDem(cnt,"iH2E",step)$(InputCom("iH2E","pELE"))=(R_P_XD.L(cnt, "iH2E", "pELE"));
EneDem(cnt,"CONS",step)$(CZ(cnt,"pELE")
                 +CGLZ(cnt,"pELE")
                 +IZ(cnt,"pELE"))=(HOUS_DEM.L(cnt,"pELE")
                 +GOVT_DEM.L(cnt,"pELE")
                 +INVB_DEM.L(cnt,"pELE"));

EneDemTot(cnt,step)=sum(sec,EneDem(cnt,sec,step))+EneDem(cnt,"CONS",step);

* This is multiplied by the total energy demand in a country in 2010 and give the relative consumption in the other years
* for all sectors and final consumption
EneDemTWh(cnt,sec,step)=EneDem(cnt,sec,step)/EneDemTot(cnt,"2");
EneDemTWh(cnt,"CONS",step)=EneDem(cnt,"CONS",step)/EneDemTot(cnt,"2");

PriceCO2(step)$(sum(cnt,CO2B(cnt)))=sum(cnt,PCO2.l(cnt)*CO2B(cnt))/sum(cnt,CO2B(cnt));
CO2Pr(cnt,step)$(CO2B(cnt))=PCO2.l(cnt);
ElPrice(cnt,step)=P.l(cnt,"pELE")/PU.l(cnt);

FFdem(cnt,energy,step)=sum(sec,R_P_XD.l(cnt, sec, energy))+HOUS_DEM.l(cnt,energy)+GOVT_DEM.l(cnt,energy)+INVB_DEM.l(cnt,energy);
EEdem(cnt,sec,step)=sum((fosfuels),R_P_XD.l(cnt, sec, fosfuels)*CO2r(cnt,fosfuels,sec)*cint(cnt,sec));

EEdem(cnt,"iH2S",step)=sum((fosfuels),R_P_XD.l(cnt, "iH2S", fosfuels)*CO2r(cnt,fosfuels,"iNG")*cint(cnt,"iH2S"));
EEdem(cnt,"iH2E",step)=sum((fosfuels),R_P_XD.l(cnt, "iH2E", fosfuels)*CO2r(cnt,fosfuels,"iNG")*cint(cnt,"iH2E"));
* set to zero the emissions from non-polluting sectors
EEdem(cnt,sec,step)$nonpoll(sec)=0;
EEdem(cnt,"HOUS",step)=sum(fosfuels,HOUS_DEM.l(cnt,fosfuels)*CO2r(cnt,fosfuels,"HOUS")*cint(cnt,"iSER"));
EEdem(cnt,"GOVT",step)=sum(fosfuels,GOVT_DEM.l(cnt,fosfuels)*CO2r(cnt,fosfuels,"GOVT")*cint(cnt,"iSER"));
EEdem(cnt,"INV",step)=sum(fosfuels,INVB_DEM.l(cnt,fosfuels)*CO2r(cnt,fosfuels,"INV")*cint(cnt,"iSER"));
EEdem(cnt,"tmarg",step)= sum(fosfuels,TMout.L(fosfuels,cnt)*CO2r(cnt,fosfuels,"tmarg")*cint(cnt,"iSER"));

demand(cnt,sec,com,step)=R_P_XD.L(cnt, sec, com);
demand(cnt,"HOUS",com,step)=HOUS_DEM.L(cnt,com);
demand(cnt,"GOVT",com,step)=GOVT_DEM.L(cnt,com);
demand(cnt,"INVB",com,step)=INVB_DEM.L(cnt,com);
demand(cnt,"Exports",com,step)=REP_EXPout.l(cnt,com)+REP_EXP_EU.L(cnt, com);
demand(cnt,"stocks",com,step)=max(0,SVZ(cnt,com)*R_SV.L(cnt,com));

cdem(cnt,com,step)=sum(sec,demand(cnt,sec,com,step))+demand(cnt,"HOUS",com,step)+demand(cnt,"GOVT",com,step)+demand(cnt,"INVB",com,step)+demand(cnt,"Exports",com,step)+demand(cnt,"stocks",com,step);



*===== SOCIAL ACCOUNTING MATRIX OUTPUT ======
SAMout(cnt,com,sec,step)=REP_SEC_IN.L(cnt,sec,com)*P.L(cnt, com)/PU.l(cnt)*(1+taxc(cnt,com));
SAMout(cnt,sec,com,step)$(XDDZ(cnt,sec,com))=REP_SEC_OUT.L(cnt, sec, com)*PD.L(cnt, sec, com)/PU.l(cnt);
SAMout(cnt,"iH2S","pH2",step)=REP_SEC_OUT.L(cnt, "iH2S","pH2")*PD.L(cnt, "iH2S","pH2")/PU.l(cnt);
SAMout(cnt,"iH2C","pH2",step)=REP_SEC_OUT.L(cnt, "iH2C","pH2")*PD.L(cnt, "iH2C","pH2")/PU.l(cnt);
SAMout(cnt,"iH2E","pH2",step)=REP_SEC_OUT.L(cnt, "iH2E","pH2")*PD.L(cnt, "iH2E","pH2")/PU.l(cnt);
SAMout(cnt,"Capital",sec,step)=REP_Capital.L(cnt, sec)*RKC.L(cnt)/PU.l(cnt)+POG.L(cnt)*AOGR(cnt)$(sameas(sec,"iCOI"))/PU.L(cnt)+PCL.L(cnt)*ACR(cnt)$(sameas(sec,"iCOA"))/PU.L(cnt)+PNG.L(cnt)*ANGR(cnt)$(sameas(sec,"iNG"))/PU.L(cnt);
SAMout(cnt,"Labour",sec,step)=REP_Labour.L(cnt, sec)*PL.L(cnt)/PU.l(cnt);
SAMout(cnt,"tax_sec",sec,step)=taxp(cnt,sec)*sum(com,REP_SEC_OUT.L(cnt, sec, com)*PD.L(cnt, sec, com)/PU.l(cnt));
SAMout(cnt,com,"HOUS",step)=HOUS_DEM.l(cnt,com)*P.l(cnt,com)/PU.l(cnt)*(1+taxc(cnt,com));
SAMout(cnt,com,"GOVT",step)=GOVT_DEM.l(cnt,com)*P.l(cnt,com)/PU.l(cnt)*(1+taxc(cnt,com));
SAMout(cnt,com,"INV",step)=INVB_DEM.l(cnt,com)*P.l(cnt,com)/PU.l(cnt)*(1+taxc(cnt,com));
SAMout(cnt,com,"STOCKS",step)=P.l(cnt,com)/PU.l(cnt)*SVZ(cnt,com)*gdp_p(cnt)*X.l(cnt,com);
SAMout(cnt,"HOUS","Capital",step)=RKC.L(cnt)/PU.l(cnt)*KSZ0(cnt)*(1-ty(cnt))*gdp_p(cnt)+POG.L(cnt)*AOGR(cnt)/PU.L(cnt)+PCL.L(cnt)*ACR(cnt)/PU.L(cnt)+PNG.L(cnt)*ANGR(cnt)/PU.L(cnt);
SAMout(cnt,"GOVT","Capital",step)=-RKC.L(cnt)/PU.l(cnt)*sum(sec,pathway_total(cnt, sec))*gdp_p(cnt);
SAMout(cnt,"HOUS","Labour",step)=sum(sec,REP_Labour.L(cnt, sec)*PL.L(cnt)/PU.l(cnt));
SAMout(cnt,"INV","HOUS",step)=SHZ(cnt)*gdp_p(cnt)*PS.L(cnt)/PU.l(cnt)*R_SH.L(cnt);
SAMout(cnt,"HOUS","trade",step)=max(0, (TRHROWZ(cnt)*gdp_p(cnt))*ERext.L/PU.l(cnt));
SAMout(cnt,"trade","HOUS",step)=max(0,-(TRHROWZ(cnt)*gdp_p(cnt))*ERext.L/PU.l(cnt));
SAMout(cnt,"GOVT","tax_sec",step)=sum(sec,taxp(cnt,sec)*sum(com,REP_SEC_OUT.L(cnt, sec, com)*PD.L(cnt, sec, com)/PU.l(cnt)));
SAMout(cnt,"GOVT","tax_com",step)=sum(com,sum(sec,REP_SEC_IN.L(cnt,sec,com))*P.L(cnt, com)/PU.l(cnt)*taxc(cnt,com)+(HOUS_DEM.l(cnt,com)+GOVT_DEM.l(cnt,com)+INVB_DEM.l(cnt,com))*P.l(cnt,com)/PU.l(cnt)*taxc(cnt,com));
SAMout(cnt,"tax_sec",sec,step)=taxp(cnt,sec)*sum(com,REP_SEC_OUT.L(cnt, sec, com)*PD.L(cnt, sec, com)/PU.l(cnt));
SAMout(cnt,"tax_com",com,step)=sum(sec,REP_SEC_IN.L(cnt,sec,com))*P.L(cnt, com)/PU.l(cnt)*taxc(cnt,com)+(HOUS_DEM.l(cnt,com)+GOVT_DEM.l(cnt,com)+INVB_DEM.l(cnt,com))*P.l(cnt,com)/PU.l(cnt)*taxc(cnt,com);
SAMout(cnt,"STOCKS","INV",step)=sum(com,P.l(cnt,com)/PU.l(cnt)*SVZ(cnt,com)*gdp_p(cnt)*X.l(cnt,com));
SAMout(cnt,com,"tmarg",step)= P.l(cnt,com)/PU.l(cnt)*TMout.L(com,cnt);
SAMout(cnt,"tmarg",com,step)= sum(cntt,PTM.L(cnt,cntt)/PU.l(cnt)*TMin.L(com,cnt,cntt)) ;
SAMout(cnt,com,"trade",step)= ERext.L/PU.l(cnt)*(REP_EXPout.l(cnt,com))+ERint.L/PU.l(cnt)*(REP_EXP_EU.l(cnt,com));
SAMout(cnt,"trade",com,step)=ERext.L/PU.l(cnt)*REP_IMPout.L(cnt, com)+ ERint.L/PU.l(cnt)*REP_IMP_EU.L(cnt,com);
SAMout(cnt,"GOVT","trade",step)= ERext.L/PU.l(cnt)*TRROWZ(cnt)*gdp_p(cnt);
SAMout(cnt,"CO2allow",sec,step)=PCO2.L(cnt)/PU.l(cnt)*CO2S_dem.L(cnt,sec);
SAMout(cnt,"CO2allow","HOUS",step)=PCO2.L(cnt)/PU.l(cnt)*CO2H_dem.l(cnt);
SAMout(cnt,"CO2allow","GOVT",step)=PCO2.L(cnt)/PU.l(cnt)*CO2G_dem.l(cnt);
SAMout(cnt,"CO2allow","INV",step) =PCO2.L(cnt)/PU.l(cnt)*CO2I_dem.l(cnt);
SAMout(cnt,"CO2allow","tmarg",step)=PCO2.L(cnt)/PU.l(cnt)*CO2T_dem.l(cnt);
*SAMout(cnt,"GOVT","CO2allow",step)=PCO2.L(cnt)/PU.l(cnt)*sum(fosfuels,sum(sec,CO2r(cnt,fosfuels,sec)*REP_SEC_IN.L(cnt, sec, fosfuels))+CO2r(cnt,fosfuels,"HOUS")*HOUS_DEM.L(cnt,fosfuels)+CO2r(cnt,fosfuels,"GOVT")*GOVT_DEM.L(cnt,fosfuels)+CO2r(cnt,fosfuels,"INV")*INVB_DEM.L(cnt,fosfuels));
SAMout(cnt,"GOVT","CO2allow",step)=PCO2.l(cnt)/PU.l(cnt)*(sum(sec,CO2S_dem.l(cnt,sec))+CO2H_dem.l(cnt)+CO2G_dem.l(cnt)+CO2I_dem.l(cnt)+CO2T_dem.l(cnt));
* ---- In plain words ----------------------------------------------------------------------
* Here the money paid for pollution permits is added to the output accounting tables:
* what each industry, households, government, investment and transport services pay for
* permits, and what the government receives. Without a cap these entries are zero.
* -------------------------------------------------------------------------------------------
*   permits used in this step, only where a permit market exists (APB > 0); every permit line is
*   Leontief with its fuel or output, so use = factor x solved fuel use (+ activity factor x output)
APuse(cnt,pol,apmu) = 0;
*   sectors: combustion permits (fuels in apcom) plus activity permits; nonpoll sectors (iH2C) have no permit line
APuse(cnt,pol,sec)$(APB(cnt,pol) and not nonpoll(sec)) = sum(com$apcom(com), APr(cnt,pol,com,sec)*REP_SEC_IN.L(cnt,sec,com))
                                                       + EFact(cnt,pol,sec)*sum(com,REP_SEC_OUT.L(cnt,sec,com));
*   households, local government, investment and transport margins: combustion permits
APuse(cnt,pol,"HOUS")$APB(cnt,pol)  = sum(com$apcom(com), APr(cnt,pol,com,"HOUS")*HOUS_DEM.L(cnt,com));
APuse(cnt,pol,"GOVT")$APB(cnt,pol)  = sum(com$apcom(com), APr(cnt,pol,com,"GOVT")*GOVT_DEM.L(cnt,com));
APuse(cnt,pol,"INV")$APB(cnt,pol)   = sum(com$apcom(com), APr(cnt,pol,com,"INV")*INVB_DEM.L(cnt,com));
APuse(cnt,pol,"tmarg")$APB(cnt,pol) = sum(com$apcom(com), APr(cnt,pol,com,"tmarg")*TMout.L(com,cnt));
*   permit payments of each sector: permit price x permits used (APuse), deflated by PU
*SAMout(cnt,"APallow",sec,step)=sum(pol,PAP.L(cnt,pol)*APuse(cnt,pol,sec))/PU.l(cnt);
*   permit payments of households
*SAMout(cnt,"APallow","HOUS",step)=sum(pol,PAP.L(cnt,pol)*APuse(cnt,pol,"HOUS"))/PU.l(cnt);
*   permit payments of the local government
*SAMout(cnt,"APallow","GOVT",step)=sum(pol,PAP.L(cnt,pol)*APuse(cnt,pol,"GOVT"))/PU.l(cnt);
*   permit payments of investment
*SAMout(cnt,"APallow","INV",step) =sum(pol,PAP.L(cnt,pol)*APuse(cnt,pol,"INV"))/PU.l(cnt);
*   permit payments of transport margins
*SAMout(cnt,"APallow","tmarg",step)=sum(pol,PAP.L(cnt,pol)*APuse(cnt,pol,"tmarg"))/PU.l(cnt);
*   permit revenue of the local government: price x permits handed out (APB), as for CO2allow
*SAMout(cnt,"GOVT","APallow",step)=sum(pol,PAP.L(cnt,pol)*APB(cnt,pol))/PU.l(cnt);

* air pollutant emissions, computed from fuel use and output so they are reported also when untaxed
* (nonpoll sectors, i.e. iH2C, have no permit line - their gas use is not counted, consistently with the permit market)
* ---- In plain words ----------------------------------------------------------------------
* Here the pollution of each year is computed from how much of each fuel every buyer used
* in that year, times the pollution per unit of fuel. Biofuel is now counted too, and its
* part is also reported separately ("comb_bio").
* -------------------------------------------------------------------------------------------
*   combustion emissions of the step: factor APr x solved fuel quantity, over all fuels in apcom
*   (fossil fuels and, with APbio = 1, pBIO); first the sectors (report variable REP_SEC_IN)
APemis(cnt,pol,"comb",step) = sum(com$apcom(com), sum(sec$(not nonpoll(sec)),APr(cnt,pol,com,sec)*REP_SEC_IN.L(cnt,sec,com))
*   (continuation) households (HOUS_DEM) and local government (GOVT_DEM)
                              +APr(cnt,pol,com,"HOUS")*HOUS_DEM.L(cnt,com)+APr(cnt,pol,com,"GOVT")*GOVT_DEM.L(cnt,com)
*   (continuation) investment (INVB_DEM) and transport margins (TMout)
                              +APr(cnt,pol,com,"INV")*INVB_DEM.L(cnt,com)+APr(cnt,pol,com,"tmarg")*TMout.L(com,cnt));
* of which from the bio fuel (APbio = 1)
*   same sum restricted to the bio fuel (APbiocom); sectors first
APemis(cnt,pol,"comb_bio",step)  = sum(com$(apcom(com) and APbiocom(com)), sum(sec$(not nonpoll(sec)),APr(cnt,pol,com,sec)*REP_SEC_IN.L(cnt,sec,com))
*   (continuation) households and local government
                              +APr(cnt,pol,com,"HOUS")*HOUS_DEM.L(cnt,com)+APr(cnt,pol,com,"GOVT")*GOVT_DEM.L(cnt,com)
*   (continuation) investment; no transport margins, as the SAM has no C-BIO in tmarg (checked by an abort)
                              +APr(cnt,pol,com,"INV")*INVB_DEM.L(cnt,com));
* ---- In plain words ----------------------------------------------------------------------
* Here the pollution not caused by burning fuels is computed from what each industry
* produced this year, then added to the fuel-burning pollution. Finally the pollution tax
* of each capped pollutant and the money it raises are recorded.
* -------------------------------------------------------------------------------------------
*   activity emissions of the step: activity factor x solved output of each sector (REP_SEC_OUT)
APemis(cnt,pol,"act",step)  = sum(sec, EFact(cnt,pol,sec)*sum(com,REP_SEC_OUT.L(cnt,sec,com)));
*   total emissions of the step = combustion + activity
APemis(cnt,pol,"total",step)= APemis(cnt,pol,"comb",step)+APemis(cnt,pol,"act",step);
*   tax per Gg where a threshold is active: permit price deflated by PU
*APtax(cnt,pol,step)$APB(cnt,pol) = PAP.L(cnt,pol)/PU.l(cnt);
*   total permit revenue of the country (all pollutants), deflated by PU
*APrev(cnt,step) = sum(pol,PAP.L(cnt,pol)*APB(cnt,pol))/PU.l(cnt);


ConsExp("HOUS",cnt,step)=sum((com),SAMout(cnt,com,"HOUS",step))+SAMout(cnt,"trade","HOUS",step);
ConsExp("GOVT",cnt,step)=sum((com),SAMout(cnt,com,"GOVT",step));
ConsExp("INV",cnt,step)=sum((com),SAMout(cnt,com,"INV",step));


IOanalysis('input',cnt,sec,com,step)$(ord(step)>1)=SAMout(cnt,com,sec,step);
IOanalysis('input',cnt,sec,"Labour",step)$(ord(step)>1)=SAMout(cnt,"Labour",sec,step);
IOanalysis('input',cnt,sec,"Capital",step)$(ord(step)>1)=SAMout(cnt,"Capital",sec,step);
IOanalysis('input',cnt,sec,"tax_sec",step)$(ord(step)>1)=SAMout(cnt,"tax_sec",sec,step);
IOanalysis('input',cnt,"demand",com,step)$(ord(step)>1)=SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step);
IOanalysis('input',cnt,"demand","CO2allow",step)$(ord(step)>1)=PCO2.l(cnt)/PU.l(cnt)*(CO2H_dem.l(cnt)+CO2G_dem.l(cnt)+CO2I_dem.l(cnt));
IOanalysis('input',cnt,"stocks",com,step)$(ord(step)>1)=SAMout(cnt,com,"STOCKS",step);
IOanalysis('input',cnt,"tmarg",com,step)$(ord(step)>1)=SAMout(cnt,com,"tmarg",step);
IOanalysis('input',cnt,"exportsROW",com,step)$(ord(step)>1)=SAMout(cnt,com,"trade",step);

IOanalysis('input',cnt,sec,"CO2allow",step)$(ord(step)>1)=PCO2.l(cnt)/PU.l(cnt)*CO2S_dem.l(cnt,sec);
* ---- In plain words ----------------------------------------------------------------------
* Here the permit payments are also copied into the input-output tables: per industry,
* and in total for final buyers (households, government, investment).
* -------------------------------------------------------------------------------------------
*   permit payments of each sector as an input row of the IO table (from SAMout)
IOanalysis('input',cnt,sec,"APallow",step)$(ord(step)>1)=SAMout(cnt,"APallow",sec,step);
*   permit payments of final demand: households + local government + investment
IOanalysis('input',cnt,"demand","APallow",step)$(ord(step)>1)=SAMout(cnt,"APallow","HOUS",step)+SAMout(cnt,"APallow","GOVT",step)+SAMout(cnt,"APallow","INV",step);

IOanalysis('output',cnt,sec,com,step)$(ord(step)>1)=SAMout(cnt,sec,com,step);
IOanalysis('output',cnt,"tax_com",com,step)$(ord(step)>1)=SAMout(cnt,"tax_com",com,step);
IOanalysis('output',cnt,"tmarg",com,step)$(ord(step)>1)=SAMout(cnt,"tmarg",com,step);
IOanalysis('output',cnt,"importsROW",com,step)$(ord(step)>1)=SAMout(cnt,"trade",com,step);


VA(cnt,sec,step)=SAMout(cnt,"Capital",sec,step)+SAMout(cnt,"Labour",sec,step)+SAMout(cnt,"tax_sec",sec,step)+SAMout(cnt,sec,"CO2allow",step);
GDPout(cnt,step)=sum(sec,VA(cnt,sec,step));


Quantity(cnt,com,sec,step)=REP_SEC_IN.L(cnt,sec,com);
Quantity(cnt,sec,com,step)$(XDDZ(cnt,sec,com))=REP_SEC_OUT.L(cnt, sec, com);
Quantity(cnt,"iH2S","pH2",step)=REP_SEC_OUT.L(cnt, "iH2S","pH2");
Quantity(cnt,"iH2C","pH2",step)=REP_SEC_OUT.L(cnt, "iH2C","pH2");
Quantity(cnt,"iH2E","pH2",step)=REP_SEC_OUT.L(cnt, "iH2E","pH2");
Quantity(cnt,"Capital",sec,step)=REP_Capital.L(cnt, sec)+AOGR(cnt)$(sameas(sec,"iCOI"))+ACR(cnt)$(sameas(sec,"iCOA"))+ANGR(cnt)$(sameas(sec,"iNG"));
Quantity(cnt,"Labour",sec,step)=REP_Labour.L(cnt, sec);
Quantity(cnt,com,"HOUS",step)=HOUS_DEM.l(cnt,com);
Quantity(cnt,com,"GOVT",step)=GOVT_DEM.l(cnt,com);
Quantity(cnt,com,"INV",step)=INVB_DEM.l(cnt,com);
Quantity(cnt,com,"STOCKS",step)=SVZ(cnt,com)*gdp_p(cnt)*X.l(cnt,com);
Quantity(cnt,"HOUS","Capital",step)=KSZ0(cnt)*(1-ty(cnt))*gdp_p(cnt)+AOGR(cnt)+ACR(cnt)+ANGR(cnt);
Quantity(cnt,"GOVT","Capital",step)=-sum(sec,pathway_total(cnt, sec))*gdp_p(cnt);
Quantity(cnt,"HOUS","Labour",step)=sum(sec,REP_Labour.L(cnt, sec));
Quantity(cnt,"INV","HOUS",step)=SHZ(cnt)*gdp_p(cnt)*R_SH.L(cnt);
Quantity(cnt,"HOUS","trade",step)=max(0, (TRHROWZ(cnt)*gdp_p(cnt)));
Quantity(cnt,"trade","HOUS",step)=max(0,-(TRHROWZ(cnt)*gdp_p(cnt)));
Quantity(cnt,"STOCKS","INV",step)=sum(com,SVZ(cnt,com)*gdp_p(cnt)*X.l(cnt,com));
Quantity(cnt,com,"tmarg",step)= TMout.L(com,cnt);
Quantity(cnt,"tmarg",com,step)= sum(cntt,TMin.L(com,cnt,cntt)) ;
Quantity(cnt,com,"trade",step)= REP_EXPout.l(cnt,com)+REP_EXP_EU.l(cnt,com);
Quantity(cnt,"trade",com,step)=REP_IMPout.L(cnt, com)+ REP_IMP_EU.L(cnt,com);
Quantity(cnt,"GOVT","trade",step)=TRROWZ(cnt)*gdp_p(cnt);
Quantity(cnt,"CO2allow",sec,step)=sum(fosfuels,CO2r(cnt,fosfuels,sec)*REP_SEC_IN.L(cnt, sec, fosfuels));
Quantity(cnt,"CO2allow","HOUS",step)=sum(fosfuels,CO2r(cnt,fosfuels,"HOUS")*HOUS_DEM.L(cnt,fosfuels));
Quantity(cnt,"CO2allow","GOVT",step)=sum(fosfuels,CO2r(cnt,fosfuels,"GOVT")*GOVT_DEM.L(cnt,fosfuels));
Quantity(cnt,"CO2allow","INV",step) =sum(fosfuels,CO2r(cnt,fosfuels,"INV")*INVB_DEM.L(cnt,fosfuels));
Quantity(cnt,"GOVT","CO2allow",step)=sum(fosfuels,sum(sec,CO2r(cnt,fosfuels,sec)*REP_SEC_IN.L(cnt, sec, fosfuels))+CO2r(cnt,fosfuels,"HOUS")*HOUS_DEM.L(cnt,fosfuels)+CO2r(cnt,fosfuels,"GOVT")*GOVT_DEM.L(cnt,fosfuels)+CO2r(cnt,fosfuels,"INV")*INVB_DEM.L(cnt,fosfuels));

* Guard against div-by-zero: a sector may collapse (sum_g Quantity = 0)
* at corner equilibria; in that case FtPrt is left at 0 instead of triggering
* an execution error that would skip subsequent solves.
FtPrt(cnt,sec,com,step)$(XDDZ(cnt,sec,com) and sum(g,Quantity(cnt,sec,g,step)))
    = Quantity(cnt,sec,com,step)/sum(g,Quantity(cnt,sec,g,step))*EEdem(cnt,sec,step);

* air pollutant footprint per product of the step, same rule as FtPrt (and as APemis for the sector emissions)
*   sector emissions: combustion of the solved fuel use (nonpoll sectors excluded, as in APemis) plus activity
APsecE(cnt,pol,sec,step) = sum(com$apcom(com), APr(cnt,pol,com,sec)*REP_SEC_IN.L(cnt,sec,com))$(not nonpoll(sec))
*   (continuation) activity emissions: activity factor x solved output of the sector
                         + EFact(cnt,pol,sec)*sum(com,REP_SEC_OUT.L(cnt,sec,com));
*   product share: emissions of the sector x share of the product in the sector's output (0 if the sector collapses)
FtPrtAP(cnt,pol,sec,com,step)$(XDDZ(cnt,sec,com) and sum(g,Quantity(cnt,sec,g,step)))
*   (continuation) the output share of the product, times the sector's emissions
    = Quantity(cnt,sec,com,step)/sum(g,Quantity(cnt,sec,g,step))*APsecE(cnt,pol,sec,step);

*$ontext
QQQ(cnt,com,sec,step)$SAM(cnt,com,sec)=REP_SEC_IN.L(cnt,sec,com)/SAM(cnt,com,sec)-1;
QQQ(cnt,sec,com,step)$SAM(cnt,sec,com)=REP_SEC_OUT.L(cnt, sec, com)/SAM(cnt,sec,com)-1;
*QQQ(cnt,"Capital",sec,step)$SAM(cnt,"Capital",sec)=REP_Capital.L(cnt, sec)/SAM(cnt,"Capital",sec)-1;
QQQ(cnt,"Capital",sec,step)$SAM(cnt,"Capital",sec)=(REP_Capital.L(cnt, sec)+AOGR(cnt)$(sameas(sec,"iCOI"))+ACR(cnt)$(sameas(sec,"iCOA"))+ANGR(cnt)$(sameas(sec,"iNG")))/SAM(cnt,"Capital",sec)-1;
QQQ(cnt,"Labour",sec,step)$SAM(cnt,"Labour",sec)=REP_Labour.L(cnt, sec)/SAM(cnt,"Labour",sec)-1;
QQQ(cnt,"tax_sec",sec,step)$SAM(cnt,"tax_sec",sec)=sum(com,REP_SEC_OUT.L(cnt, sec, com)*PD.L(cnt, sec, com))/SAM(cnt,"tax_sec",sec)-1;
QQQ(cnt,com,"HOUS",step)$SAM(cnt,com,"HOUS")=HOUS_DEM.l(cnt,com)/SAM(cnt,com,"HOUS")-1;
QQQ(cnt,com,"GOVT",step)$SAM(cnt,com,"GOVT")=GOVT_DEM.l(cnt,com)/SAM(cnt,com,"GOVT")-1;
QQQ(cnt,com,"INV",step)$SAM(cnt,com,"INV")=INVB_DEM.l(cnt,com)/SAM(cnt,com,"INV")-1;
QQQ(cnt,com,"STOCKS",step)$SAM(cnt,com,"STOCKS")=SVZ(cnt,com)*gdp_p(cnt)*X.l(cnt,com)/SAM(cnt,com,"STOCKS")-1;
QQQ(cnt,"HOUS","Capital",step)$SAM(cnt,"HOUS","Capital")=KSZ0(cnt)*(1-ty(cnt))*gdp_p(cnt)/SAM(cnt,"HOUS","Capital")-1;
QQQ(cnt,"GOVT","Capital",step)$SAM(cnt,"GOVT","Capital")=-sum(sec,pathway_total(cnt, sec))*gdp_p(cnt)/SAM(cnt,"GOVT","Capital")-1;
QQQ(cnt,"HOUS","Labour",step)$SAM(cnt,"HOUS","Labour")=sum(sec,REP_Labour.L(cnt, sec))/SAM(cnt,"HOUS","Labour")-1;
QQQ(cnt,"INV","HOUS",step)$SAM(cnt,"INV","HOUS")=SHZ(cnt)*gdp_p(cnt)*R_SH.L(cnt)/SAM(cnt,"INV","HOUS")-1;
QQQ(cnt,"HOUS","trade",step)$SAM(cnt,"HOUS","trade")=max(0, (TRHROWZ(cnt)*gdp_p(cnt)))/SAM(cnt,"HOUS","trade")-1;
QQQ(cnt,"trade","HOUS",step)$SAM(cnt,"trade","HOUS")=max(0,-(TRHROWZ(cnt)*gdp_p(cnt)))/SAM(cnt,"trade","HOUS")-1;
QQQ(cnt,"GOVT","tax_sec",step)=0;
QQQ(cnt,"GOVT","tax_com",step)=0;
QQQ(cnt,"tax_sec",sec,step)$SAM(cnt,"tax_sec",sec)=sum(com,REP_SEC_OUT.L(cnt, sec, com)*PD.L(cnt, sec, com))/SAM(cnt,"tax_sec",sec)-1;
QQQ(cnt,"tax_com",com,step)$SAM(cnt,"tax_com",com)=(sum(sec,REP_SEC_IN.L(cnt,sec,com))*P.L(cnt, com)+(HOUS_DEM.l(cnt,com)+GOVT_DEM.l(cnt,com)+INVB_DEM.l(cnt,com))*P.l(cnt,com))/SAM(cnt,"tax_com",com)-1;
QQQ(cnt,"STOCKS","INV",step)=0;
QQQ(cnt,com,"tmarg",step)$SAM(cnt,com,"tmarg")= TMout.L(com,cnt)/SAM(cnt,com,"tmarg")-1;
QQQ(cnt,"tmarg",com,step)= 0;
QQQ(cnt,com,"trade",step)$SAM(cnt,com,"trade")=(REP_EXPout.l(cnt,com)+REP_EXP_EU.l(cnt,com))/SAM(cnt,com,"trade")-1;

QQQ(cnt,"trade",com,step)$SAM(cnt,"trade",com)=(REP_IMPout.L(cnt, com)+ REP_IMP_EU.L(cnt,com))/SAM(cnt,"trade",com)-1;
QQQ(cnt,"GOVT","trade",step)$SAM(cnt,"GOVT","trade")=TRROWZ(cnt)*gdp_p(cnt)/SAM(cnt,"GOVT","trade")-1;
QQQ(cnt,"CO2allow",sec,step)=sum(fosfuels,CO2r(cnt,fosfuels,sec)*REP_SEC_IN.L(cnt, sec, fosfuels));
QQQ(cnt,"CO2allow","HOUS",step)=sum(fosfuels,CO2r(cnt,fosfuels,"HOUS")*HOUS_DEM.L(cnt,fosfuels));
QQQ(cnt,"CO2allow","GOVT",step)=sum(fosfuels,CO2r(cnt,fosfuels,"GOVT")*GOVT_DEM.L(cnt,fosfuels));
QQQ(cnt,"CO2allow","INV",step) =sum(fosfuels,CO2r(cnt,fosfuels,"INV")*INVB_DEM.L(cnt,fosfuels));
QQQ(cnt,"GOVT","CO2allow",step)=sum(fosfuels,sum(sec,CO2r(cnt,fosfuels,sec)*REP_SEC_IN.L(cnt, sec, fosfuels))+CO2r(cnt,fosfuels,"HOUS")*HOUS_DEM.L(cnt,fosfuels)+CO2r(cnt,fosfuels,"GOVT")*GOVT_DEM.L(cnt,fosfuels)+CO2r(cnt,fosfuels,"INV")*INVB_DEM.L(cnt,fosfuels));


PPP(cnt,com,sec,step)=P.L(cnt, com)/PU.l(cnt)*(1+taxc(cnt,com));
PPP(cnt,sec,com,step)$(XDDZ(cnt,sec,com))=PD.L(cnt, sec, com)/PU.l(cnt);
*PPP(cnt,"Capital",sec,step)=RKC.L(cnt)/PU.l(cnt);
* capital might contain specific capital for some sectors. Then we consider an average price for general and specific capital for those sectors.
*                               (TotalValue/Q)/CPI)
PPP(cnt,"Capital",sec,step)$SAM(cnt,"Capital",sec)=SAMout(cnt,"Capital",sec,step)/(REP_Capital.L(cnt, sec)+AOGR(cnt)$(sameas(sec,"iCOI"))+ACR(cnt)$(sameas(sec,"iCOA"))+ANGR(cnt)$(sameas(sec,"iNG")));
PPP(cnt,"Labour",sec,step)=PL.L(cnt)/PU.l(cnt);
PPP(cnt,"tax_sec",sec,step)=taxp(cnt,sec);
PPP(cnt,com,"HOUS",step)=P.l(cnt,com)/PU.l(cnt)*(1+taxc(cnt,com));
PPP(cnt,com,"GOVT",step)=P.l(cnt,com)/PU.l(cnt)*(1+taxc(cnt,com));
PPP(cnt,com,"INV",step)=P.l(cnt,com)/PU.l(cnt)*(1+taxc(cnt,com));
PPP(cnt,com,"STOCKS",step)=P.l(cnt,com)/PU.l(cnt);
PPP(cnt,"HOUS","Capital",step)=RKC.L(cnt)/PU.l(cnt);
PPP(cnt,"GOVT","Capital",step)=RKC.L(cnt)/PU.l(cnt);
PPP(cnt,"HOUS","Labour",step)=PL.L(cnt)/PU.l(cnt);
PPP(cnt,"INV","HOUS",step)=PS.L(cnt)/PU.l(cnt);
PPP(cnt,"HOUS","trade",step)=ERext.L/PU.l(cnt);
PPP(cnt,"trade","HOUS",step)=ERext.L/PU.l(cnt);
PPP(cnt,"GOVT","tax_sec",step)=sum(sec,taxp(cnt,sec)*sum(com,REP_SEC_OUT.L(cnt, sec, com)*PD.L(cnt, sec, com)/PU.l(cnt)));
PPP(cnt,"GOVT","tax_com",step)=sum(com,sum(sec,REP_SEC_IN.L(cnt,sec,com))*P.L(cnt, com)/PU.l(cnt)*taxc(cnt,com)+(HOUS_DEM.l(cnt,com)+GOVT_DEM.l(cnt,com)+INVB_DEM.l(cnt,com))*P.l(cnt,com)/PU.l(cnt)*taxc(cnt,com));
PPP(cnt,"tax_sec",sec,step)=taxp(cnt,sec);
PPP(cnt,"tax_com",com,step)=taxc(cnt,com);
PPP(cnt,"STOCKS","INV",step)=sum(com,P.l(cnt,com)/PU.l(cnt)*SVZ(cnt,com)*gdp_p(cnt)*X.l(cnt,com));
PPP(cnt,com,"tmarg",step)= P.l(cnt,com)/PU.l(cnt);
PPP(cnt,"tmarg",com,step)= sum(cntt,PTM.L(cnt,cntt)/PU.l(cnt)*TMin.L(com,cnt,cntt));
PPP(cnt,com,"trade",step)= ERext.L/PU.l(cnt);
PPP(cnt,"trade",com,step)=ERext.L/PU.l(cnt);
PPP(cnt,"GOVT","trade",step)=ERext.L/PU.l(cnt);
PPP(cnt,"CO2allow",sec,step)=PCO2.L(cnt)/PU.l(cnt);
PPP(cnt,"CO2allow","HOUS",step)=PCO2.L(cnt)/PU.l(cnt);
PPP(cnt,"CO2allow","GOVT",step)=PCO2.L(cnt)/PU.l(cnt);
PPP(cnt,"CO2allow","INV",step) =PCO2.L(cnt)/PU.l(cnt);
PPP(cnt,"GOVT","CO2allow",step)=PCO2.L(cnt)/PU.l(cnt);


EUIMP(cnt,com,step)=ERint.L/PU.l(cnt)*REP_IMP_EU.L(cnt,com);
EUEXP(cnt,com,step)=ERint.L/PU.l(cnt)*(REP_EXP_EU.l(cnt,com));


* Price of fossil fuels
FuelPrice(cnt,fosfuels,step)=P.l(cnt,fosfuels)/PU.l(cnt);

* monetary value of the CO2 budget.
MCO2B(cnt,step)=PCO2.L(cnt)*CO2B(cnt);

display SHZ,gdp,PS.L,R_SH.L;

Capital(cnt,step)=Kap(cnt);
Investments(cnt,step)=II.l(cnt)*5;
* report gdp in percentage
gdptest(cnt,step)$(ord(step) ge 3)=sum(sec,VA(cnt,sec,step))/sum(sec,VA(cnt,sec,"3"));
* ================= Recoursive Capital Adjustment ==============================
* We multiply investments by 5 because even if all the projection parameters are for 5
* years the data is always based on yearly values. Therefore by projecting the closure
* parameters 5 years ahead we would get the YEARLY SAM after 5 years.
* But we need the cumulated effects of 5 years of investments. That is why we multiply
* the investments by 5.
Kap(cnt)=(Kap(cnt)*(1-depr(cnt))+II.l(cnt)*5);
KSZ(cnt)=Kap(cnt)*ror(cnt);
* update natural resources extraction (this could be used in a counterfactual)
* period 4 is 2020
if (ord(step) le 5,
* Renewable power productivity grows in the first four periods
Rp(cnt)=Rp(cnt);
AOGR(cnt)=AOGR(cnt)*(1+grow(cnt));
ACR(cnt)=ACR(cnt)*(1+grow(cnt));
ANGR(cnt)=ANGR(cnt)*(1+grow(cnt));

else
* ================ CPD - COUNTERFACTUAL POLICY DEFINITION =====================
* Counterfactual point 7

* Renewable power productivity grows
* if reference case everything grows following "grow"

* increase in productivity for power sector
* THIS MUST BE FIXED - WHEN THERE IS A CUT IN RESOURCES EXTRACTION THERE SHOULD NOT BE A DIRECT CONNECTION TO PRODUCTIVITY OF POWER SECTOR
Rp(cnt)$(CUT eq 1)=Rp(cnt)+prdR;
*
CPD(cnt)$(CCE eq 1)=(1+CPD(cnt))*(1+lpd(cnt))-1;
* all the countries cut their fossil extractions
AOGR(cnt)$(inVis(cnt) eq 0 and CUT eq 1)=AOGR(cnt)*rescut;
ACR(cnt)$(inVis(cnt) eq 0 and  CUT eq 1)=ACR(cnt)*rescut;
* we do not phase out Natural Gas (under Gradual Development)
ANGR(cnt)$(inVis(cnt) eq 0 and CUT eq 1)=ANGR(cnt)*rescut;

AOGR(cnt)$(inVis(cnt) eq 0 and  CUT eq 0)=AOGR(cnt)*(1+grow(cnt));
ACR(cnt)$(inVis(cnt) eq 0 and  CUT eq 0)=ACR(cnt)*(1+grow(cnt));
ANGR(cnt)$(inVis(cnt) eq 0 and  CUT eq 0)=ANGR(cnt)*(1+grow(cnt));

* if there is cooperation, the Visegrad countries will cut their fossil extractions
AOGR(visegrad)$(coop=1 and CUT eq 1)=AOGR(visegrad)*rescut;
ACR(visegrad)$(coop=1 and  CUT eq 1)=ACR(visegrad)*rescut;
ANGR(visegrad)$(coop=1 and  CUT eq 1)=ANGR(visegrad)*rescut;

AOGR(visegrad)$(coop=1 and  CUT eq 0)=AOGR(visegrad)*(1+grow(visegrad));
ACR(visegrad)$(coop=1 and  CUT eq 0)=ACR(visegrad)*(1+grow(visegrad));
ANGR(visegrad)$(coop=1 and  CUT eq 0)=ANGR(visegrad)*(1+grow(visegrad));

* if there is no cooperation, the visegrad countries will keep increasing their fossil resources
AOGR(visegrad)$(coop=0 and CUT eq 1)=AOGR(visegrad)*(1+grow(visegrad));
ACR(visegrad)$(coop=0 and CUT eq 1)=ACR(visegrad)*(1+grow(visegrad));
ANGR(visegrad)$(coop=0 and CUT eq 1)=ANGR(visegrad)*(1+grow(visegrad));

ROWc$(ROWco eq 1)=(1+ROWc)*0.9-1;

* =============================================================================
);
* close the main loop
outLab(cnt,sec,step)=REP_Labour.L(cnt,sec);
* for old sectors
outAct(cnt,sec,step)$(XDZ(cnt,sec))=XD.L(cnt,sec)*XDZ(cnt,sec);
* for new sectors
outAct(cnt,sec,step)$(XDZ(cnt,sec)=0)=XD.L(cnt,sec);
outPrice(cnt,com,step)=P.L(cnt,com)/PU.L(cnt);
outWages(cnt,step)=PL.L(cnt)/PU.L(cnt);
outKap(cnt,step)=RKC.L(cnt)/PU.L(cnt);
PriceIndex(cnt,step)=PU.L(cnt);
);

* =====================================================================
* =========== GDP CALIBRATION LOOP - UPDATE CFac ================
* =====================================================================
* Compute the deviation between the realised cumulative GDP at step 10
* (gdptest(cnt,'10')) and the target gdp(cnt). Update CFac(cnt)
* using a sign-aware multiplicative rule with damping.
*
* Why sign-aware?
*   The plain rule  TFP <- TFP*(1 + (gdp/gdptest('10') - 1)*damping)
*   only works when TFP > 0. If TFP < 0, multiplying it by a factor > 1
*   makes it MORE negative, which REDUCES growth - the opposite of what
*   we want. Reversing the ratio (gdptest('10')/gdp - 1) flips the sign
*   of the correction so that, for negative TFP, a multiplier < 1 pushes
*   TFP toward zero (less negative -> more growth) when undershooting,
*   and a multiplier > 1 pushes it further negative when overshooting.
*   When TFP = 0 the multiplicative rule is degenerate; we apply a small
*   sign-aware additive nudge (+epsTFP / -epsTFP) so the next iteration
*   can resume the multiplicative update.
*
*   TFP > 0:   TFP <- TFP * ( 1 + ( gdp(cnt)/gdptest(cnt,'10') - 1 ) * damping )
*   TFP < 0:   TFP <- TFP * ( 1 + ( gdptest(cnt,'10')/gdp(cnt) - 1 ) * damping )
*   TFP = 0:   TFP <- +epsTFP  if gdptest(cnt,'10') < gdp(cnt)
*              TFP <- -epsTFP  if gdptest(cnt,'10') > gdp(cnt)
*
* If CalGDP=0 the update block is skipped and the outer while exits.

* --- Convergence metric (sign-agnostic, independent of TFP sign) ---
  CalDev(cnt) = 0;
  CalDev(cnt)$(gdptest(cnt,"12") gt 0) = gdp(cnt)/gdptest(cnt,"12") - 1;
  CalErr = smax(cnt, abs(CalDev(cnt)));

* --- Update direction (sign-aware) ---
* CalUpd(cnt) is the correction term that multiplies damping in the
* multiplicative update. It is set to the original ratio when TFP > 0,
* and to the inverted ratio when TFP < 0. For TFP = 0 it stays at 0
* (the additive nudge is handled separately below).
  CalUpd(cnt) = 0;
  CalUpd(cnt)$(CFac(cnt) gt 0 and gdptest(cnt,"12") gt 0) = gdp(cnt)/gdptest(cnt,"12") - 1;
  CalUpd(cnt)$(CFac(cnt) lt 0 and gdp(cnt)             gt 0) = gdptest(cnt,"12")/gdp(cnt) - 1;

* log diagnostics for inspection (indexed by citer). GG is logged at its
* end-of-iteration value (i.e. GG after the step loop has reached step 10);
* the next outer iteration will restore it to GG_save before re-running.
  CFac_log(cnt,citer)$(ord(citer) eq CalIter) = CFac(cnt);
  gdptest_log(cnt,citer)$(ord(citer) eq CalIter)    = gdptest(cnt,"12");
  GG_log(cnt,sec,citer)$(ord(citer) eq CalIter)     = GG(cnt,sec);
  CalErr_log(citer)$(ord(citer) eq CalIter)         = CalErr;

  if(CalGDP eq 1,
*   1) Multiplicative update for TFP != 0
    CFac(cnt)$(CFac(cnt) gt epsTFP or CFac(cnt) lt -epsTFP) = CFac(cnt)*(1 + CalUpd(cnt)*damping);

*   2) Additive nudge when TFP is exactly zero. Order matters: the two
*      assignments below operate on entries that ARE still zero after
*      step 1 (step 1 left them untouched).
*        If CFac is getting too close to zero from below, then skip towards positive
    CFac(cnt)$(CFac(cnt) le 0 and CFac(cnt) ge -epsTFP and gdptest(cnt,"12") lt gdp(cnt)) =  epsTFP;
*        If CFac is getting too close to zero from above, then skip towards negative
    CFac(cnt)$(CFac(cnt) ge 0 and CFac(cnt) le epsTFP and gdptest(cnt,"12") gt gdp(cnt)) = -epsTFP;

    display "==== CalGDP iteration =====", CalIter, CalErr, CalDev, CalUpd, CFac, gdp, gdptest;
  else
    display "CalGDP disabled: single run only", CalIter, CalErr;
  );

);
* end of outer calibration while loop

if(CalGDP eq 1,
  display "===== GDP CALIBRATION COMPLETED =====",
          CalIter, CalErr, CalTol,
          CFac, gdp, gdptest,
          CFac_log, gdptest_log, GG_log, CalErr_log;

* Dump the calibrated CFac and all calibration diagnostics to a
* dedicated GDX file. Open "CFac_calibrated.gdx" in GAMS Studio
* (or via gdxdump) to inspect/copy the converged values back into
* InputParameters.gms.
  execute_unload "CFac_calibrated.gdx"
      CFac, CFac_save,
      GG, GG_save, TotFacProd,
      gdp, gdptest,
      CalIter, CalErr, CalTol, damping, epsTFP,
      CalDev, CalUpd,
      CFac_log, gdptest_log, GG_log, CalErr_log;
);
* =====================================================================
* =========== GDP CALIBRATION LOOP - END ==============================
* =====================================================================

parameter qKLEM(*,cnt,sec,step) quantities aggregated by type of input;
parameter pKLEM(*,cnt,sec,step) prices aggregated by type of input;
parameter fKLEM(*,cnt,sec,step) flows aggregated by type of input;

qKLEM('K',cnt,sec,step)=Quantity(cnt,"Capital",sec,step);
qKLEM('L',cnt,sec,step)=Quantity(cnt,"Labour",sec,step);
qKLEM('E',cnt,sec,step)=sum(energy,Quantity(cnt,energy,sec,step));
qKLEM('M',cnt,sec,step)=sum(materials,Quantity(cnt,materials,sec,step));


* Guards: pKLEM is a price = SAMout / Quantity; skip when the factor
* quantity is zero (collapsed sector) to avoid division-by-zero errors.
pKLEM('K',cnt,sec,step)$Quantity(cnt,"Capital",sec,step)
    = SAMout(cnt,"Capital",sec,step)/Quantity(cnt,"Capital",sec,step);
pKLEM('L',cnt,sec,step)$Quantity(cnt,"Labour",sec,step)
    = SAMout(cnt,"Labour",sec,step)/Quantity(cnt,"Labour",sec,step);
pKLEM('E',cnt,sec,step)$sum(energy,Quantity(cnt,energy,sec,step))
    = sum(energy,SAMout(cnt,energy,sec,step))/sum(energy,Quantity(cnt,energy,sec,step));
pKLEM('M',cnt,sec,step)$sum(materials,Quantity(cnt,materials,sec,step))
    = sum(materials,SAMout(cnt,materials,sec,step))/sum(materials,Quantity(cnt,materials,sec,step));

fKLEM('K',cnt,sec,step)=SAMout(cnt,"Capital",sec,step);
fKLEM('L',cnt,sec,step)=SAMout(cnt,"Labour",sec,step);
fKLEM('E',cnt,sec,step)=sum(energy,SAMout(cnt,energy,sec,step));
fKLEM('M',cnt,sec,step)=sum(materials,SAMout(cnt,materials,sec,step));


parameter EneDemM(cnt,step) monetary energy expenditure;
EneDemM(cnt,step)=ElPrice(cnt,step)*(sum(sec,EneDem(cnt,sec,step))+EneDem(cnt,"CONS",step));

EneDem(cnt,sec,step)$(EneDem(cnt,sec,"2"))=EneDem(cnt,sec,step)/EneDem(cnt,sec,"2");
EneDem(cnt,"CONS",step)$EneDem(cnt,"CONS","2")=EneDem(cnt,"CONS",step)/EneDem(cnt,"CONS","2");
EneDemTot(cnt,step)=EneDemTot(cnt,step)/EneDemTot(cnt,"3");
ElPrice(cnt,step)$(ElPrice(cnt,"2"))=ElPrice(cnt,step)/ElPrice(cnt,"2");

parameter EneDemP(cnt,*,step),EneDemTotP(cnt,step),ElPriceP(cnt,step);
EneDemP(cnt,sec,step)$(EneDem(cnt,sec,"2"))=(EneDem(cnt,sec,step)-1)*100;
EneDemP(cnt,"CONS",step)$(EneDem(cnt,"CONS","2"))=(EneDem(cnt,"CONS",step)-1)*100;
EneDemTotP(cnt,step)$(EneDemTot(cnt,"2"))=(EneDemTot(cnt,step)-1)*100;
ElPriceP(cnt,step)$(ElPrice(cnt,"2"))=(ElPrice(cnt,step)-1)*100;

DISPLAY PL.L, LS.L, LSZ;

parameter PriceOut(cnt,com,step),LabPriceOut(cnt,step),CapPriceOut(cnt,step);
PriceOut(cnt,com,step)=smax(sec,PPP(cnt,com,sec,step)/(1+taxc(cnt,com)))/smax(sec,PPP(cnt,com,sec,'2')/(1+taxc(cnt,com)));
LabPriceOut(cnt,step)=smax(sec,PPP(cnt,"Labour",sec,step))/smax(sec,PPP(cnt,"Labour",sec,'2'));
CapPriceOut(cnt,step)=smax(sec,PPP(cnt,"Capital",sec,step))/smax(sec,PPP(cnt,"Capital",sec,'2'));

*=====================Report any variables desired ============

* Normalize CO2 price to second period (2012)
*PriceCO2(step)=PriceCO2(step)/PriceCO2("2");
ElPrice(cnt,step)=ElPrice(cnt,step)/ElPrice(cnt,"2");
demand(cnt,sec,com,step)$(demand(cnt,sec,com,"2") and not sameas('iH2S',sec) and not sameas('iH2C',sec) and not sameas('iH2E',sec))=demand(cnt,sec,com,step)/demand(cnt,sec,com,"2");
demand(cnt,'iH2S',com,step)=demand(cnt,'iH2S',com,step);
demand(cnt,'iH2C',com,step)=demand(cnt,'iH2C',com,step);
demand(cnt,'iH2E',com,step)=demand(cnt,'iH2E',com,step);
demand(cnt,"HOUS",com,step)$demand(cnt,"HOUS",com,"2")=demand(cnt,"HOUS",com,step)/demand(cnt,"HOUS",com,"2");
demand(cnt,"GOVT",com,step)$demand(cnt,"GOVT",com,"2")=demand(cnt,"GOVT",com,step)/demand(cnt,"GOVT",com,"2");
demand(cnt,"INVB",com,step)$demand(cnt,"INVB",com,"2")=demand(cnt,"INVB",com,step)/demand(cnt,"INVB",com,"2");
demand(cnt,"Exports",com,step)$demand(cnt,"Exports",com,"2")=demand(cnt,"Exports",com,step)/demand(cnt,"Exports",com,"2");
demand(cnt,"stocks",com,step)$demand(cnt,"stocks",com,"2")=demand(cnt,"stocks",com,step)/demand(cnt,"stocks",com,"2");

* percentage change from period 2
*cdem(cnt,com,step)$(cdem(cnt,com,"2"))=cdem(cnt,com,step)/cdem(cnt,com,"2");

Parameter SectorGrowth(cnt,sec,step);
SectorGrowth(cnt,sec,"1")$(sum(com,SAM(cnt,sec,com)))=sum(com,SAMout(cnt,sec,com,"1"))/sum(com,SAM(cnt,sec,com))-1;
SectorGrowth(cnt,sec,step)$(ord(step) gt 1 and sum(com,SAMout(cnt,sec,com,step-1)) gt 0 and ord(step) le STEPS and sum(com,SAM(cnt,sec,com)))=sum(com,SAMout(cnt,sec,com,step))/sum(com,SAMout(cnt,sec,com,step-1))-1;

GDPout(cnt,step)=GDPout(cnt,step);


*execute_unload "REMES2GeneSys.gdx" EneDem,demand,PriceCO2,FuelPrice,SectorGrowth,EneDemTWh;

*display R_GDP, R_P_OIL;
parameter changeTech(cnt,com,sec);
changeTech(cnt,com,sec)$IOZ(cnt,com,sec)=R_P_XD.L(cnt, sec, com)/IOZ(cnt,com,sec);

*execute_unload "checkXDDZ", XDDZ,REP_SEC_OUT.l;


display IZ;
*execute_unload "Results_.gdx" UNEMPLOYMENT,IOanalysis,Pco2.l,EneDem,ElPrice,PriceCO2,FFdem,EEdem,demand,cdem,SAM,SAMout,QQQ,PPP,Quantity,VA,gdp,GDPout,GDPtest,PU.l;
*execute_unload "Sectoral_structure.gdx" XDDZ, taxpz, IOZ, Pathway_adj, taxcz, LZ, Pathway_adj_cap, KZ, pathway_total, INVZ;

*execute_unload "counterfactuals.gdx" Pathway_adj,Pathway_adj_cap, KZ, Pathway_total,tfp,AOGR,OGR,ACR,CR,ANGR,NGR,ALR,LR,KSZ,KSZ0,growth_p,LSZ0,CO2B;

parameter price(cnt,com,sec);
price(cnt,com,sec)=(IOZ(cnt,com,sec)*(1+taxcz(cnt,com)));
display price;


parameter testCO(cnt,com,sec);
testCO(cnt,com,sec)=0;
testCO(cnt,com,sec)$(PID(com) = 1 and CO2P(cnt,com,sec) and FF(com)=1 and CO2B(cnt))=1


*execute_unload "capital&invest.gdx" Kap, Capital, Investments, II.l;



*################# OUTPUT IN IIASA FORMAT ######################

*data from Genesys-Mod input files (external share files)
parameter initalEnergy(cnt) total consumption in EJ in 2015 /
AT        0.03404676
BE        0.035619157
BG        0.016812262
CY        0.005
CZ        0.028219254
DE        0.220972355
DK        0.014283732
EE        0.005339188
ES        0.148829094
FI        0.060185507
FR        0.283266301
GR        0.032590675
HU        0.021487256
IE        0.013399807
IT        0.183377262
LT        0.005900408
LU        0.005728847
LV        0.004759128
MT        0.005
NL        0.039075664
PL        0.065141595
PT        0.024279845
RO        0.019243935
SE        0.064723738
SI        0.007728384
SK        0.01054307
GB        0.043981143
CH        0.013390213
NO        0.007045151
/;


scalar meanER2010 /1.33/;
scalar kWh2Gj /0.0036/;
* https://ec.europa.eu/eurostat/statistics-explained/index.php?title=File:Half-yearly_electricity_and_gas_prices_-_including_taxes_(EUR).png
parameter elp0(cnt) electricity price in 2010 in euro per kWh
/
AT        0.18
BE        0.20
BG        0.08
CY        0.13
CZ        0.13
DE        0.24
DK        0.27
EE        0.08
ES        0.16
FI        0.16
FR        0.12
GR        0.12
HU        0.15
IE        0.18
IT        0.21
LT        0.12
LU        0.17
LV        0.08
MT        0.17
NL        0.17
PL        0.13
PT        0.16
RO        0.10
SE        0.18
SI        0.14
SK        0.15
GB        0.14
CH        0.21
NO        0.20
/;


Acronym
Austria
Belgium
Bulgaria
Cyprus
CzechRepublic
Germany
Denmark
Estonia
Spain
Finland
France
Greece
Hungary
Ireland
Italy
Lithuania
Luxembourg
Latvia
Malta
TheNetherlands
Poland
Portugal
Romania
Sweden
Slovenia
Slovakia
UnitedKingdom
Switzerland
Norway;

parameter country(cnt) /
AT Austria
BE Belgium
BG Bulgaria
CY Cyprus
CZ CzechRepublic
DE Germany
DK Denmark
EE Estonia
ES Spain
FI Finland
FR France
GR Greece
HU Hungary
IE Ireland
IT Italy
LT Lithuania
LU Luxembourg
LV Latvia
MT Malta
NL TheNetherlands
PL Poland
PT Portugal
RO Romania
SE Sweden
SI Slovenia
SK Slovakia
GB UnitedKingdom
CH Switzerland
NO Norway
/;



display country;

parameter eneConsum(cnt,step);
eneConsum(cnt,step)= initalEnergy(cnt)*EneDemTot(cnt,step);

parameter elpriceP1(cnt,step);
* el price in Gj USD2010
elp0(cnt)=elp0(cnt)/kWh2Gj;
*meanER2010;
ElPriceP1(cnt,step)=elp0(cnt)*(1+ElPriceP(cnt,step)/100);
*set 2020 as base year with price 30
* a little adjusting is needed because our data starts in 2007
* and if we set 2020 as first period with fixed price at 30 we end up having
* a final CO2 price in 2050 higher in case with carbon intensity than
* in case without. Considering our data starting in 2007 we use 2007
* as base period for all the cases, then we overwrite the data for the
* first four period and then we make sure that the remaining periods do
* not exceed 30, which is the price reported for 2020.
PriceCO2(step)=PriceCO2(step)/PriceCO2("1");
CO2pr(cnt,step)=CO2pr(cnt,step)/CO2pr(cnt,"1");
*PriceCO2(step)$(PriceCO2(step) lt 30) = 30;
*PriceCO2("1")=1;
*PriceCO2("2")=10;
*PriceCO2("3")=15;
*PriceCO2("4")=30;

* if production >0 and imports>exports --> percIMP=(imports-exports)/production
parameter IntConsDom(cnt,com) internal cosumption of domestic production;
parameter percDOM(cnt,com,step),percIMP(cnt,com,step) percentuals of domestic and imported per commodity;
IntConsDom(cnt,com)=PDD.L(cnt,com)*DPDM.L(cnt,com);
percIMP(cnt,com,step)=0;
percIMP(cnt,com,step)$(IntConsDom(cnt,com))=SAMout(cnt,"trade",com,step)/(SAMout(cnt,"trade",com,step)+IntConsDom(cnt,com));
percDOM(cnt,com,step)= 1-percIMP(cnt,com,step);

display percIMP,percDOM;

* set price 30 in 2020 and convert to USD
*PriceCO2(step)=PriceCO2(step)*30*meanER2010;


* Convert monetary values in Billion USD2010
GDPout(cnt,step)=GDPout(cnt, step);
*meanER2010/1000;
EneDemM(cnt,step)=EneDemM(cnt,step);
*meanER2010/1000;

* ========== Value added re-expressed in original sectors =====================
VAos(cnt,sec0,step)=sum(secc$maps(sec0,secc),VA(cnt,secc,step))*sum(sec$maps(sec0,sec),WVA(cnt,sec0,sec));
VAps(cnt,Psecs,step)=sum(sec0,VAos(cnt,sec0,step)*P2R(cnt,sec0,Psecs));

*=================== CONVERSIONS =========================
* Convert SAM into Billion Euros 2020
*SAMout(cnt,*,*,step)=1/1000*PriceIndex(cnt,'4')*SAMout(cnt,*,*,step);


* output for openENTRANCE platform
File remesoe2 /REMESOE2.csv/;
remesoe2.tf=0;
put remesoe2;
remesoe2.nd = 6;
put 'model,scenario,region,variable,unit,subannual,2010,2015,2020,2025,2030,2035,2040,2045,2050,2055,2060', put /;

$ifthen %CaseStudy%==1

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com$mapc2(com,comout),PriceOut(cnt,com,step))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption Tax Rate|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),r_taxc(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption Tax Rate|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com$mapc2(com,comout),r_taxc(cnt,com,step))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption Tax Rate|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),r_taxc(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption Tax Rate|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),r_taxc(cnt,com,step)))  put /;);

* The consumption is with prices fixed at 2015
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
*europe
put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step)))))) put /;

* The consumption is with prices fixed at 2015
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
*europe
put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"HOUS",step)))))) put /;


* The expenditure is monetary with prices of the year
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Expenditure|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,step)*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Expenditure|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,step)*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Expenditure|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,step)*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Expenditure|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,step)*(sum(com,SAMout(cnt,com,"HOUS",step))))) put /;);
*europe
put 'REMES:EU 1.0,Reference,', put "Europe", put ',Expenditure|Households,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,step)*(sum(com,SAMout(cnt,com,"HOUS",step)))))) put /;


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Government,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Government,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Government,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Government,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"GOVT",step))))) put /;);
*europe
put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Government,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"GOVT",step)))))) put /;


*$ontext
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Gross Capital Formation,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Gross Capital Formation,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Gross Capital Formation,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Gross Capital Formation,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"INV",step))))) put /;);
*europe
put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Gross Capital Formation,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*(sum(com,SAMout(cnt,com,"INV",step)))))) put /;


*$offtext

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Industry,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((com,sec),SAMout(cnt,com,sec,step)))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Industry,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((com,sec),SAMout(cnt,com,sec,step)))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Industry,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((com,sec),SAMout(cnt,com,sec,step)))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Industry,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((com,sec),SAMout(cnt,com,sec,step)))) put /;);
*europe
put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Industry,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum((com,sec),SAMout(cnt,com,sec,step))))) put /;



loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Households|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Households|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);



loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Households|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Households|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Households|', put comout.tl:0, put '|Total,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl:0, put '|Total,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl:0, put '|Total,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl:0, put '|Total,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),SAMout(cnt,com,"HOUS",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Households', put comout.tl:0, put '|Total,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),SAMout(cnt,com,"HOUS",step))))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Government|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Government|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);



loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Government|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Government|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step)))))) put /;);



loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Gross Capital Formation|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step)))))) put /;);



loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Industry|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Industry|', put comout.tl:0, put '|Domestic,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Consumption|Industry|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Consumption|Industry|', put comout.tl:0, put '|Imported,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*(sum((com,sec)$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Output|Product|', put comout.tl:0, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Output|Product|', put comout.tl:0, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Output|Product|', put comout.tl:0, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Output|Product|', put comout.tl:0, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Output|Product|', put comout.tl:0, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))) put /;);


*############# CARBON FOOTPRINT PER PRODUCT #############
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Output|Emissions|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put (sum((sec,com)$mapc2(com,comout),FtPrt(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Output|Emissions|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((sec,com)$mapc2(com,comout),FtPrt(cnt,sec,com,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Output|Emissions|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put (sum((sec,com)$mapc2(com,comout),FtPrt(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Output|Emissions|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put (sum((sec,com)$mapc2(com,comout),FtPrt(cnt,sec,com,step))))  put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Output|Product|', put comout.tl:0, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(sum((sec,com)$mapc2(com,comout),FtPrt(cnt,sec,com,step))))) put /;);


*############# AIR POLLUTANT FOOTPRINT PER PRODUCT #############
* FtPrtAP is in Gg (= kt): divided by 1000 to million Tonnes; 9 decimals (1 kg), as small footprints round to 0 with 6
remesoe2.nd = 9;
loop((cnt,pol,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Output|Pollutants|', put pol.tl:0, put '|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*sum((sec,com)$mapc2(com,comout),FtPrtAP(cnt,pol,sec,com,step))))  put /;);
loop((cnt,pol,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Output|Pollutants|', put pol.tl:0, put '|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*sum((sec,com)$mapc2(com,comout),FtPrtAP(cnt,pol,sec,com,step)))) put /;);
loop((cnt,pol,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Output|Pollutants|', put pol.tl:0, put '|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*sum((sec,com)$mapc2(com,comout),FtPrtAP(cnt,pol,sec,com,step))))  put /;);
loop((cnt,pol,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Output|Pollutants|', put pol.tl:0, put '|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*sum((sec,com)$mapc2(com,comout),FtPrtAP(cnt,pol,sec,com,step))))  put /;);
*europe
loop((pol,comout),put 'REMES:EU 1.0,Reference,', put "Europe", put ',Output|Pollutants|', put pol.tl:0, put '|', put comout.tl:0, put ',million Tonnes,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*sum((sec,com)$mapc2(com,comout),FtPrtAP(cnt,pol,sec,com,step))))) put /;);
*   back to the 6 decimals of the other blocks
remesoe2.nd = 6;


loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Output|Industry|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Output|Industry|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Output|Industry|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Output|Industry|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
*europe
loop(secout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Output|Industry|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))) put /;);


* Value Added for PRIMES
loop((cnt,Psecs)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Value Added|', put Psecs.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*VAps(cnt,Psecs,step)))  put /;);
loop((cnt,Psecs)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Value Added|', put Psecs.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*VAps(cnt,Psecs,step)))  put /;);
loop((cnt,Psecs)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Value Added|', put Psecs.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*VAps(cnt,Psecs,step)))  put /;);
loop((cnt,Psecs)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Value Added|', put Psecs.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*VAps(cnt,Psecs,step)))  put /;);
*europe
loop(Psecs,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Value Added|', put Psecs.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,1/1000*PriceIndex(cnt,'3')*VAps(cnt,Psecs,step))) put /;);


loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Capital|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Capital|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Capital|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Capital|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
*europe
loop(secout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Capital|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))) put /;);



loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Labor|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Labor|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Labor|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Labor|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
*europe
loop(secout,put 'REMES:EU 1.0,Reference,', put "Europe", put ',Labor|', put secout.tl, put ',billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'3')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))) put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);



loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);

*loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
*         loop(step$(ord(step) gt 1), put',', put ElPriceP1(cnt,step)) put /;);
*loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
*         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
*loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
*         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
*loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
*         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put country(cnt):0, put ',GDP|PPP,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'3')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Reference,', put 'Czech Republic', put ',GDP|PPP,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Reference,', put 'United Kingdom', put ',GDP|PPP,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Reference,', put 'The Netherlands', put ',GDP|PPP,billion EUR_2015/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'3')*GDPout(cnt,step))) put /;);

*put 'REMES:EU 1.0,Reference,', put 'Europe', put ',Consumption,billion EUR_2015/yr,Year',
*loop(step$(ord(step) gt 1), put',', put sum(cnt,EneDemM(cnt,step))) put /;

put 'REMES:EU 1.0,Reference,', put 'Europe', put ',Final Energy|Electricity,EJ/yr,Year',
loop(step$(ord(step) gt 1), put',', put sum(cnt,eneConsum(cnt,step))) put /;

put 'REMES:EU 1.0,Reference,', put 'Europe', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,ElPriceP1(cnt,step)*eneConsum(cnt,step))/sum(cnt,eneConsum(cnt,step))) ) put /;

put 'REMES:EU 1.0,Reference,', put 'Europe', put ',GDP|PPP,billion EUR_2015/yr,Year',
loop(step$(ord(step) gt 1), put',', put sum(cnt,1/1000*PriceIndex(cnt,'3')*GDPout(cnt,step))) put /;

put 'REMES:EU 1.0,Reference,', put 'Europe', put ',Price|Carbon,EUR_2015/t CO2,Year',
loop(step$(ord(step) gt 1), put',', put PriceCO2(step)) put /;
$endif


$ifthen %CaseStudy%==2
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Product Price Index|', put comout.tl:0, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Product Price Index|', put comout.tl:0, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com$mapc2(com,comout),PriceOut(cnt,com,step))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Product Price Index|', put comout.tl:0, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Product Price Index|', put comout.tl:0, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
*europe
put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step)))))) put /;

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
*europe
put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com,SAMout(cnt,com,"HOUS",step)))))) put /;

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
*europe
put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com,SAMout(cnt,com,"GOVT",step)))))) put /;
*$ontext
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
*europe
put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com,SAMout(cnt,com,"INV",step)))))) put /;

*$offtext

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
*europe
put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Industry,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum((com,sec),SAMout(cnt,com,sec,step))))) put /;


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);



loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step)))))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step)))))) put /;);
*$ontext
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum((com,sec)$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum((com,sec)$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))))) put /;);
*$offtext

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))) put /;);


loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
*europe
loop(secout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))) put /;);

loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
*europe
loop(secout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))) put /;);

loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
*europe
loop(secout,put 'REMES:EU 1.0,Gradual Development,', put "Europe", put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put country(cnt), put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Gradual Development,', put 'Czech Republic', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Gradual Development,', put 'United Kingdom', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Gradual Development,', put 'The Netherlands', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);

*put 'REMES:EU 1.0,Gradual Development,', put 'Europe', put ',Consumption,billion EUR_2020/yr,Year',
*loop(step$(ord(step) gt 1), put',', put sum(cnt,EneDemM(cnt,step))) put /;

put 'REMES:EU 1.0,Gradual Development,', put 'Europe', put ',Final Energy|Electricity,EJ/yr,Year',
loop(step$(ord(step) gt 1), put',', put sum(cnt,eneConsum(cnt,step))) put /;

put 'REMES:EU 1.0,Gradual Development,', put 'Europe', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,ElPriceP1(cnt,step)*eneConsum(cnt,step))/sum(cnt,eneConsum(cnt,step))) ) put /;

put 'REMES:EU 1.0,Gradual Development,', put 'Europe', put ',GDP|PPP,billion EUR_2020/yr,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step)))) put /;

put 'REMES:EU 1.0,Gradual Development,', put 'Europe', put ',Price|Carbon,EUR_2020/t CO2,Year',
loop(step$(ord(step) gt 1), put',', put PriceCO2(step)) put /;
$endif

$ifthen %CaseStudy%==3
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com$mapc2(com,comout),PriceOut(cnt,com,step))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
*europe
put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step)))))) put /;

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
*europe
put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com,SAMout(cnt,com,"HOUS",step)))))) put /;

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
*europe
put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com,SAMout(cnt,com,"GOVT",step)))))) put /;


*$ontext
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
*europe
put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com,SAMout(cnt,com,"INV",step)))))) put /;

*$offtext

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step)))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step)))))) put /;);

*$ontext
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
*europe
put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Industry,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*sum((com,sec),SAMout(cnt,com,sec,step))))) put /;



loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
*$offtext

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum((com,sec)$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))))) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
*europe
loop(comout,put 'REMES:EU 1.0,Techno-Friendly,', put "Europe", put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(cnt,(1/1000*PriceIndex(cnt,'5')*(sum((com,sec)$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))))) put /;);


loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);

loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);



loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);


loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);



loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put country(cnt), put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'Czech Republic', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'United Kingdom', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Techno-Friendly,', put 'The Netherlands', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);

*put 'REMES:EU 1.0,Techno-Friendly,', put 'Europe', put ',Consumption,billion EUR_2020/yr,Year',
*loop(step$(ord(step) gt 1), put',', put sum(cnt,EneDemM(cnt,step))) put /;

put 'REMES:EU 1.0,Techno-Friendly,', put 'Europe', put ',Final Energy|Electricity,EJ/yr,Year',
loop(step$(ord(step) gt 1), put',', put sum(cnt,eneConsum(cnt,step))) put /;

put 'REMES:EU 1.0,Techno-Friendly,', put 'Europe', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,ElPriceP1(cnt,step)*eneConsum(cnt,step))/sum(cnt,eneConsum(cnt,step))) ) put /;

put 'REMES:EU 1.0,Techno-Friendly,', put 'Europe', put ',GDP|PPP,billion EUR_2020/yr,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step)))) put /;

put 'REMES:EU 1.0,Techno-Friendly,', put 'Europe', put ',Price|Carbon,EUR_2020/t CO2,Year',
loop(step$(ord(step) gt 1), put',', put PriceCO2(step)) put /;
$endif


$ifthen %CaseStudy%==4
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com$mapc2(com,comout),PriceOut(cnt,com,step))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);

*$ontext
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
*$offtext

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*$ontext
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
*$offtext

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);

loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);



loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);


loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);



loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put country(cnt), put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Societal Commitment,', put 'Czech Republic', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Societal Commitment,', put 'United Kingdom', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Societal Commitment,', put 'The Netherlands', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);

*put 'REMES:EU 1.0,Societal Commitment,', put 'Europe', put ',Consumption,billion EUR_2020/yr,Year',
*loop(step$(ord(step) gt 1), put',', put sum(cnt,EneDemM(cnt,step))) put /;

put 'REMES:EU 1.0,Societal Commitment,', put 'Europe', put ',Final Energy|Electricity,EJ/yr,Year',
loop(step$(ord(step) gt 1), put',', put sum(cnt,eneConsum(cnt,step))) put /;

put 'REMES:EU 1.0,Societal Commitment,', put 'Europe', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,ElPriceP1(cnt,step)*eneConsum(cnt,step))/sum(cnt,eneConsum(cnt,step))) ) put /;

put 'REMES:EU 1.0,Societal Commitment,', put 'Europe', put ',GDP|PPP,billion EUR_2020/yr,Year',
loop(step$(ord(step) gt 1), put',', put  (sum(cnt,1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step)))) put /;

put 'REMES:EU 1.0,Societal Commitment,', put 'Europe', put ',Price|Carbon,EUR_2020/t CO2,Year',
loop(step$(ord(step) gt 1), put',', put PriceCO2(step)) put /;
$endif


$ifthen %CaseStudy%==5
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com$mapc2(com,comout),PriceOut(cnt,com,step))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Product Price Index|', put comout.tl, put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put sum(com$mapc2(com,comout),PriceOut(cnt,com,step)))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com,SAMout(cnt,com,"HOUS",step)+SAMout(cnt,com,"GOVT",step)+SAMout(cnt,com,"INV",step)+sum(sec,SAMout(cnt,com,sec,step))))) put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Households,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step))))) put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Government,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com,percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step))))) put /;);

*$ontext
loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Gross Capital Formation,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum(com,1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))) put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Industry|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Industry|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  sum((com,sec),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step))) put /;);
*$offtext

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Households|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"HOUS",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Government|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"GOVT",step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percDOM(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Gross Capital Formation|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*(sum(com$mapc2(com,comout),percIMP(cnt,com,step)*SAMout(cnt,com,"INV",step))))) put /;);
*$ontext
loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Domestic,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percDOM(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Consumption|Industry|', put comout.tl, put '|Imported,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (sum((com,sec)$mapc2(com,comout),1/1000*PriceIndex(cnt,'5')*percIMP(cnt,com,step)*SAMout(cnt,com,sec,step)))) put /;);
*$offtext

loop((cnt,comout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,comout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,comout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Output|Product|', put comout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$mapc2(com,comout),SAMout(cnt,sec,com,step))))  put /;);

loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Output|Industry|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,sec,com,step))))  put /;);



loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Capital|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Capital",sec,step))))  put /;);


loop((cnt,secout)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step)))) put /;);
loop((cnt,secout)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);
loop((cnt,secout)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Labor|', put secout.tl, put ',billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*sum((sec,com)$maps2(sec,secout),SAMout(cnt,"Labour",sec,step))))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Capital Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put CapPriceOut(cnt,step))  put /;);



loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Labor Price Index|', put ',index,Year',
         loop(step$(ord(step) gt 1), put',', put LabPriceOut(cnt,step))  put /;);


loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Final Energy|Electricity,EJ/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  eneConsum(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
         loop(step$(ord(step) gt 1), put',', put  ElPriceP1(cnt,step)) put /;);

loop((cnt)$(not (sameas(cnt,'CZ') or sameas(cnt,'GB') or sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put country(cnt), put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'CZ'))), put 'REMES:EU 1.0,Directed Transition,', put 'Czech Republic', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'GB'))), put 'REMES:EU 1.0,Directed Transition,', put 'United Kingdom', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);
loop((cnt)$((sameas(cnt,'NL'))), put 'REMES:EU 1.0,Directed Transition,', put 'The Netherlands', put ',GDP|PPP,billion EUR_2020/yr,Year',
         loop(step$(ord(step) gt 1), put',', put  (1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step))) put /;);

*put 'REMES:EU 1.0,Directed Transition,', put 'Europe', put ',Consumption,billion EUR_2020/yr,Year',
*loop(step$(ord(step) gt 1), put',', put sum(cnt,EneDemM(cnt,step))) put /;

put 'REMES:EU 1.0,Directed Transition,', put 'Europe', put ',Final Energy|Electricity,EJ/yr,Year',
loop(step$(ord(step) gt 1), put',', put sum(cnt,eneConsum(cnt,step))) put /;

put 'REMES:EU 1.0,Directed Transition,', put 'Europe', put ',Price|Final Energy|Residential|Electricity,USD_2010/GJ,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,ElPriceP1(cnt,step)*eneConsum(cnt,step))/sum(cnt,eneConsum(cnt,step))) ) put /;

put 'REMES:EU 1.0,Directed Transition,', put 'Europe', put ',GDP|PPP,billion EUR_2020/yr,Year',
loop(step$(ord(step) gt 1), put',', put (sum(cnt,1/1000*PriceIndex(cnt,'5')*GDPout(cnt,step)))) put /;

put 'REMES:EU 1.0,Directed Transition,', put 'Europe', put ',Price|Carbon,EUR_2020/t CO2,Year',
loop(step$(ord(step) gt 1), put',', put PriceCO2(step)) put /;
$endif



putclose remesoe2;

parameter testgrow(cnt);
testgrow(cnt)=((AOGR(cnt)+ANGR(cnt))/(OGR(cnt)+NGR(cnt)));
display testgrow;

parameter apptc(cnt,com),apptp(cnt,sec),TOGR(cnt),TCR(cnt),TNGR(cnt);
apptp(cnt,sec)=taxp(cnt,sec)-taxpz(cnt,sec);
apptc(cnt,com)=taxc(cnt,com)-taxcz(cnt,com);
TOGR(cnt)=OGR(cnt)-AOGR(cnt);
TCR(cnt)=CR(cnt)-ACR(cnt);
TNGR(cnt)=NGR(cnt)-ANGR(cnt);
parameter TotCons(cnt,step);

TotCons(cnt,step)=sum(com,Quantity(cnt,com,"HOUS",step))/sum(com,Quantity(cnt,com,"HOUS",'4'));

execute_unload 'applied counterfactuals.gdx' PRC,apptc,apptp,pathway_adj,prdR,InputCom,TOGR,TCR,TNGR,gdp_p,eint,cint,Pathway_adj_cap,KZ,open,CO2B;

execute_unload 'TestTNO' outAct,CO2Pr,gdptest,TotCons,PriceIndex,outLab,outPrice,outWages,outKap,gdp,PriceCO2;


* Final output
execute_unload "outputREMES.gdx" outAct,GDPout,VA,UNEMPLOYMENT,IOanalysis,SAM,SAMout,PPP,Quantity,FtPrt,PriceCO2,gdptest,gdp,EEdem,qKLEM,pKLEM,fKLEM,EUIMP,EUEXP,ConsExp,growth_lf,
* ---- In plain words ----------------------------------------------------------------------
* The pollution results are saved in the main output file too: yearly pollution, taxes,
* revenues, caps, 2007 pollution and the pollution factors.
* -------------------------------------------------------------------------------------------
*   (continuation of execute_unload) air pollutant reports, thresholds, EDGAR 2007 totals, factors and footprints per product
                                 APemis,APtax,APrev,APthr,APbase07,APr,EFact,APsecE,FtPrtAP;



PARAMETER Gout(step),OIVa(secout,step),OIVo(secout,step),OEVa(comout,step),OEVo(comout,step),OEnVa(comout,step),OEnVo(comout,step),Emis(step);
Gout(step)=sum(cnt$(EU27(cnt)),GDPout(cnt,step));
OIVo(secout,step)=sum((cnt,com,sec)$(maps2(sec,secout) and EU27(cnt)),Quantity(cnt,sec,com,step));
OIVa(secout,step)=sum((cnt,com,sec)$(maps2(sec,secout) and EU27(cnt)),SAMout(cnt,sec,com,step));
OEVo(comout,step)$sameas(comout,"pELEC")=sum((cnt,com,sec)$(mapc2(com,comout) and EU27(cnt)),Quantity(cnt,sec,com,step));
OEVa(comout,step)$sameas(comout,"pELEC")=sum((cnt,com,sec)$(mapc2(com,comout) and EU27(cnt)),SAMout(cnt,sec,com,step));
OEnVo(comout,step)$(ENC(comout) eq 1)=sum((cnt,com,sec)$(mapc2(com,comout) and EU27(cnt)),Quantity(cnt,sec,com,step));
OEnVa(comout,step)$(ENC(comout) eq 1)=sum((cnt,com,sec)$(mapc2(com,comout) and EU27(cnt)),SAMout(cnt,sec,com,step));
Emis(step)=sum(cnt$(EU27(cnt)),sum(sec,EEdem(cnt,sec,step))+EEdem(cnt,"HOUS",step)+EEdem(cnt,"GOVT",step)+EEdem(cnt,"INV",step)+EEdem(cnt,"tmarg",step));


parameter
KPI_E overall electricity demand change,
KPI_O oil demand change,
KPI_G gas demand change,
KPI_Coa coal demand change,
KPI_Bio biofuels demand change,
KPI_Ful fuels demand change,
KPI_Dsl diesel demand change,
KPI_Gsl gasoline demand change,
KPI_H2E Hydrogen 2 Electricity ratio in 2050,
KPI_GDP overall gdp change,
KPI_Cons Consumption of manufactory in 2050;
KPI_E=OEVo("pELEC",'10')/OEVo("pELEC",'5');
KPI_O=OEnVo("pOIL",'10')/OEnVo("pOIL",'5');
KPI_G=OEnVo("pNG",'10')/OEnVo("pNG",'5');
KPI_Coa=OEnVo("pNG",'10')/OEnVo("pNG",'5');
*KPI_Bio=OEnVo("pBIO",'10')/OEnVo("pBIO",'5');
KPI_Ful=OEnVo("pFUL",'10')/OEnVo("pFUL",'5');
*KPI_Dsl=OEnVo("pDSL",'10')/OEnVo("pDSL",'5');
*KPI_Gsl=OEnVo("pGSL",'10')/OEnVo("pGSL",'5');
KPI_H2E$OEnVo("pH2",'10')=OEVo("pELEC",'10')/OEnVo("pH2",'10');
KPI_GDP=Gout('10')/Gout('5');
KPI_Cons=sum(cnt,Quantity(cnt,'pIND',"HOUS",'10'))+sum(cnt,Quantity(cnt,'pIND',"GOVT",'10'));

execute_unload "compareREMESEXIOMOD.gdx" Gout,OIVo,OIVa,OEVo,OEVa,OEnVo,OEnVa,PriceCO2,Emis;

*execute_unload "KPIs.gdx"  KPI_E,KPI_O,KPI_G,KPI_Coa,KPI_Bio,KPI_Ful,KPI_Dsl,KPI_Gsl,KPI_H2E,KPI_GDP,cint,KPI_Cons;

