* =============== Guidebook emission factors for fuel combustion ===============
* ---- In plain words ----------------------------------------------------------------------
* This file holds the European emission guidebook figures: how much of each pollutant a
* fuel emits per unit of energy, depending on where it is burnt (power plant, factory, car,
* lorry, ship, plane, home stove, office boiler...). The model does not use these figures as
* absolute amounts: the amounts come from EDGAR. It uses them only to compare fuels and
* technologies, so that dirtier ones get a bigger share of each country's pollution.
* The file also says which technology each buyer of fuel uses.
* -------------------------------------------------------------------------------------------
* Source: EEA (2023a). EMEP/EEA air pollutant emission inventory guidebook 2023,
* Tier 1 default emission factors (road transport: Update 2026 of chapter 1.A.3.b).
* Edited by hand; see README_AirPollutants.md.
*
* The factors are used only as RELATIVE emission intensities (the phi of the linear
* system  sum_f X_f e_f = E,  e_f = phi_f e_ref): within each EDGAR combustion source
* group the EDGAR emissions of a country are split across the fuel uses of the SAM in
* proportion to energy use x Guidebook factor. The absolute level of a factor never
* reaches the model; only ratios between fuels and users inside one group matter.
*
* Users and fuels are the granular SAM accounts (sec0, com0, final demand), so this
* file works with any aggregation in InputParameters*.gms.
* Requires: pol, apsrc (AirPollutants2007.gms).

* ---- In plain words ----------------------------------------------------------------------
* Here the kinds of equipment that burn fuel are listed (the guidebook's chapters), and
* how they are grouped. Each group is handled separately, so pollution never moves
* between, say, power plants and road traffic.
* -------------------------------------------------------------------------------------------
* Source of the elements: EMEP/EEA Guidebook 2023, Part B, list of the 1.A Combustion chapters
*   (web page, not a PDF); the NFR codes are on page 1 (title box) of each chapter PDF:
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion
*   The merged 1A1bc and 1A4c elements are a grouping of these chapters made for this model.
*   Guidebook combustion technologies (one per chapter or sub-chapter); text = NFR codes
set aptech Guidebook combustion technologies /
    1A1a    'public electricity and heat production (1.A.1.a)'
    1A1bc   'refining, solid fuel manufacture, other energy industries (1.A.1.b-c)'
    1A2     'manufacturing industries and construction (1.A.2)'
    1A3a    'aviation (1.A.3.a)'
    1A3b    'road transport exhaust (1.A.3.b)'
    1A3c    'railways (1.A.3.c)'
    1A3d    'navigation (1.A.3.d)'
    1A3e    'pipeline transport (1.A.3.e)'
    1A4r    'residential (1.A.4.b)'
    1A4c    'commercial, institutional, agriculture, other stationary (1.A.4.a, 1.A.4.c, 1.A.5)'
*   end of the list
/;

* Source of the elements: EDGAR v8.1 Global Air Pollutant Emissions, IPCC source codes of the
*   sector tables (web page, not a PDF); the grouping itself is a choice made for this model:
*   https://edgar.jrc.ec.europa.eu/dataset_ap81
*   source groups: EDGAR combustion emissions are split within each group only
set apblk EDGAR combustion source groups that are split separately /
*   power and heat, energy industries, industry, the four transport modes, pipelines, small combustion
    1A1a, 1A1bc, 1A2, 1A3a, 1A3b, 1A3c, 1A3d, 1A3e, 1A4
*   end of the list
/;

* Source of the elements: no external source (mapping made for this model). Residential and
*   commercial share one group because EDGAR reports them together as 1.A.4 (web page, not a PDF):
*   https://edgar.jrc.ec.europa.eu/dataset_ap81
*   group of each technology (residential and commercial share the group 1A4, as in EDGAR)
set mapblk(aptech,apblk) source group of each technology /
*   one group per technology
    1A1a.1A1a, 1A1bc.1A1bc, 1A2.1A2, 1A3a.1A3a, 1A3b.1A3b, 1A3c.1A3c, 1A3d.1A3d, 1A3e.1A3e
*   residential and commercial/agriculture together
    (1A4r,1A4c).1A4
*   end of the list
/;

* Source of the elements: EDGAR v8.1 source codes (set apsrc, AirPollutants2007.gms, built from
*   REMES-EU_air_pollutant_emissions_EDGAR_fossil_bio_2007_2015_2022.xlsx); dataset page (not a PDF):
*   https://edgar.jrc.ec.europa.eu/dataset_ap81
*   EDGAR combustion sources (apcomb, apmix) in each group
set mapsrcblk(apsrc,apblk) EDGAR combustion sources in each source group /
*   public electricity and heat
    '1.A.1.a'.1A1a
*   refining and other energy industries
    '1.A.1.bc'.1A1bc
*   manufacturing and construction
    '1.A.2'.1A2
*   aviation
    '1.A.3.a'.1A3a
*   road transport exhaust (resuspended road dust 1.A.3.b_RES is an activity source)
    '1.A.3.b_noRES'.1A3b
*   railways
    '1.A.3.c'.1A3c
*   navigation
    '1.A.3.d'.1A3d
*   pipelines and other transport
    '1.A.3.e'.1A3e
*   small combustion (residential, commercial, agriculture) and other stationary
    ('1.A.4','1.A.5').1A4
*   end of the list
/;

* ---------------------------------------------------------------- fuels -------
* ---- In plain words ----------------------------------------------------------------------
* Here each detailed fuel of the economic accounts is given a guidebook fuel type (coal,
* gas, heavy oil, gas oil, petrol, jet fuel), and its CO2 per unit of energy. The CO2 figure
* is used to turn the money spent on a fuel into energy, using the model's own CO2 data.
* -------------------------------------------------------------------------------------------
* Source of the elements: fuel types of the Tier 1 tables of the EMEP/EEA Guidebook 2023:
*   1.A.1 Energy industries (PDF), p. 15 Table 3-2 (hard coal), p. 17 Table 3-4 (natural gas),
*   p. 18 Table 3-6 (heavy fuel oil), p. 19 Table 3-7 (gas oil):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-1-energy-industries-2023/@@download/file
*   1.A.3.b Road transport, Update 2026 (PDF), p. 20 Table 3-5 (petrol, diesel):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-b-i/@@download/file
*   1.A.3.a Aviation (PDF), p. 20 Table 3-3 (aviation gasoline), p. 22 Table 3-4 (jet kerosene):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-a-aviation-2023/@@download/file
*   Guidebook fuel classes
set apfc Guidebook fuel classes /
    coal      'hard coal, brown coal, coke'
    gas       'natural gas, gas works gas'
    hfo       'residual fuel oil, crude oil'
    gasoil    'gas oil, diesel, kerosene, naphtha'
    gasoline  'motor and aviation gasoline'
    jet       'jet kerosene'
*   end of the list
/;

* granular SAM fuels (com0) burned in the model; C-BIO has no CO2 factor and is not covered.
* C-OIL-GSL is a small refinery product of unclear content, treated as gas oil.
* Source of the elements: no external source (mapping made for this model). The fuels are the
*   granular SAM accounts (com0) of EuroSAMMF2.gdx; the classes are those of set apfc above.
*   fuel class of each granular fossil fuel of the SAM (C-BIO is handled in the biomass section)
set apfc0(*,apfc) Guidebook fuel class of each granular SAM fuel /
*   coal
    'C-COAL'.coal
*   natural gas and gas works gas
    ('C-NG','C-GASE').gas
*   C-CRUDE-OIL, C-COIL and the heavy distillates C-OIL-HDI
    ('C-CRUDE-OIL','C-COIL','C-OIL-HDI').hfo
*   diesel, kerosene, C-OIL-LDSF and the small refinery product C-OIL-GSL
    ('C-OIL-DSL','C-OIL-KER','C-OIL-LDSF','C-OIL-GSL').gasoil
*   motor gasoline
    'C-MOTO'.gasoline
*   jet kerosene
    'C-OIL-JET'.jet
*   end of the list
/;

* IPCC (2006) default CO2 emission factors, t CO2/TJ (NCV). Used with CO2Fuel to turn
* SAM expenditure into energy: GJ = CO2 / (CO2 per GJ).

*The EMEP/EEA Guidebook gives pollutant factors in g/GJ, but the SAM records fuel use as expenditure.
* To weight each granular fuel use by �energy � Guidebook factor�, each purchase needs an energy content.
*   IPCC (2006) CO2 per unit of energy of each granular fossil fuel
* they turn the model�s existing CO2 back into energy, so that air pollutants can be spread across fuel uses.
* Source of the values: 2006 IPCC Guidelines, Vol. 2 Energy, Chapter 1 Introduction (PDF),
*   Table 1.4 "Default CO2 emission factors for combustion", default value column (given in
*   kg CO2/TJ: 94 600 kg/TJ = 94.6 t/TJ): p. 1.23 (crude oil, motor gasoline, jet kerosene,
*   other kerosene, gas/diesel oil, residual fuel oil, other bituminous coal) and p. 1.24,
*   Table 1.4 continued (natural gas):
*   https://www.ipcc-nggip.iges.or.jp/public/2006gl/pdf/2_Volume2/V2_1_Ch1_Introduction.pdf
*   C-GASE, C-COIL, C-OIL-LDSF and C-OIL-GSL take the value of a similar fuel (see the comments).

* How much CO2 does one TJ of pollutant produces.
parameter APco2f(*) CO2 emission factor of each granular SAM fuel (t CO2 per TJ) /
*   coal (other bituminous)
    'C-COAL'       94.6
*   natural gas
    'C-NG'         56.1
*   gas works gas, as natural gas
    'C-GASE'       56.1
*   crude oil
    'C-CRUDE-OIL'  73.3
*   C-COIL, as crude oil
    'C-COIL'       73.3
*   residual fuel oil
    'C-OIL-HDI'    77.4
*   gas oil / diesel
    'C-OIL-DSL'    74.1
*   other kerosene
    'C-OIL-KER'    71.9
*   C-OIL-LDSF, as crude oil
    'C-OIL-LDSF'   73.3
*   small refinery product, as gas oil
    'C-OIL-GSL'    74.1
*   jet kerosene
    'C-OIL-JET'    71.5
*   motor gasoline
    'C-MOTO'       69.3
*   end of the list
/;

* ---------------------------------------------------------------- users -------
* ---- In plain words ----------------------------------------------------------------------
* Here each buyer of fuel in the economic accounts is given the equipment it burns fuel in:
* power plants, refineries, factories, planes, lorries, trains, ships, pipelines, homes,
* and offices/farms. Petrol and diesel are an exception: EDGAR counts every road vehicle as
* road transport, whoever owns it, so they count as road fuel for almost every buyer.
* -------------------------------------------------------------------------------------------
* Source of the elements: no external source (mapping made for this model). The users are the
*   granular SAM accounts of EuroSAMMF2.gdx; each is matched to the NFR scope of a Guidebook
*   chapter, listed on the 1.A Combustion page (web page, not a PDF):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion
* technology of each granular user (SAM sector or final demand)
set aptechU(aptech,*) Guidebook technology of each fuel user /
*   power, transmission and heat sectors of the SAM
    1A1a.(POWF, POWR, POWT, LTH)
*   refineries, coal and gas industries
    1A1bc.(COIL, COAL, NG)
*   manufacturing, mining, construction and the SAM sector BIO
    1A2.(IMIN, IRES, IALA, IFB, IFURS, IRECO, IMACH, ITRUC, IFURN, CCON, BIO)
*   air transport
    1A3a.C_TAIR
*   land transport
    1A3b.C_TLND
*   rail transport
    1A3c.C_TRAI
*   sea and inland water transport
    1A3d.(C_TWAS, C_TWAI)
*   pipeline transport and the transport margins (gas transport)
    1A3e.(C_TPIP, tmarg)
*   households
    1A4r.HOUS
*   agriculture, fishing, services, waste, government and investment
    1A4c.(AAGR, FISH, COTH, CWSR, CHOTL, COFF, CFIN, CRESER, CEDU, CHEA, Waste, GOVT, INV)
*   end of the list
/;

* EDGAR 1.A.3.b covers all road vehicles, also those owned by non-transport sectors and
* households. Gasoline and diesel are therefore road fuels for every user except energy
* industries, the other transport modes and the non-road machinery of agriculture,
* fishing and construction.
* Source of the elements of aproad0 and apnoroad: no external source (assumption made for this
*   model), based on the EDGAR sector definition of road transport (1A3b), on the dataset page
*   (web page, not a PDF): https://edgar.jrc.ec.europa.eu/dataset_ap81
*   The users are granular SAM accounts of EuroSAMMF2.gdx.
*   granular fuels that count as road fuels
set aproad0(*) granular road fuels / 'C-MOTO', 'C-OIL-DSL' /;
*   users whose gasoline and diesel keep their own technology (not road transport)
set apnoroad(*) users whose gasoline and diesel are not road transport /
*   energy industries, the non-road transport modes, pipelines and margins
    POWF, POWR, POWT, LTH, COIL, COAL, NG, C_TAIR, C_TRAI, C_TWAS, C_TWAI, C_TPIP, tmarg,
*   off-road machinery of agriculture, fishing and construction
    AAGR, FISH, CCON
*   end of the list
/;

* ------------------------------------------------- stationary combustion -----
* ---- In plain words ----------------------------------------------------------------------
* Here are the guidebook figures for fixed equipment (power plants, factories, homes,
* offices): pollution per unit of energy for each fuel type. Where the guidebook gives
* one figure for all liquid fuels, it is used for each of them.
* -------------------------------------------------------------------------------------------
* Source of the values: EMEP/EEA Guidebook 2023, Tier 1 tables (page and table on each row below):
*   1.A.1 Energy industries (PDF):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-1-energy-industries-2023/@@download/file
*   1.A.2 Manufacturing industries and construction (PDF):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-2-combustion-in/@@download/file
*   1.A.3.e.i Pipeline transport (PDF):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-e-i/@@download/file
*   1.A.4 Small combustion (PDF):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-4-small-combustion-2023/@@download/file
* g/GJ; BCsh = BC in % of PM2.5
table APstat(aptech,apfc,*) Tier 1 factors for stationary combustion (g per GJ)
*   columns: pollutants (as in pol) and BCsh = black carbon in % of PM2.5
                  NOx       CO    NMVOC       SO2      PM10      PM25     BCsh
*   power and heat, hard coal (1.A.1 PDF p. 15, Table 3-2)
1A1a.coal         209      8.7      1.0       820       7.7       3.4      2.2
*   power and heat, natural gas (1.A.1 PDF p. 17, Table 3-4; BC share borrowed from 1.A.2 PDF p. 16, Table 3-3)
1A1a.gas           89       39      2.6     0.244      0.14      0.14      4.0
*   power and heat, heavy fuel oil (1.A.1 PDF p. 18, Table 3-6)
1A1a.hfo          142     15.1      2.3       495      25.2      19.3      5.6
*   power and heat, gas oil (1.A.1 PDF p. 19, Table 3-7)
1A1a.gasoil        65     16.2      0.8      46.5       3.2       0.8     33.5
*   energy industries, coal (1.A.1 PDF p. 56, Table 5-1; BC share of p. 15, Table 3-2)
1A1bc.coal         21        6      0.8        91        79        55      2.2
*   industry, solid fuels (1.A.2 PDF p. 15, Table 3-2)
1A2.coal          173      931     88.8       900       117       108      6.4
*   industry, natural gas (1.A.2 PDF p. 16, Table 3-3)
1A2.gas            74       29       23      0.67      0.78      0.78      4.0
*   industry, liquid fuels (1.A.2 PDF p. 17, Table 3-4)
1A2.hfo           513       66       25        47        20        20       56
*   pipelines, gas turbines (1.A.3.e.i PDF p. 2, Table 2-1; SOx and PM not relevant)
1A3e.gas          175       45      1.6         0         0         0        0
*   residential, hard and brown coal (1.A.4 PDF p. 32, Table 3-3)
1A4r.coal         110     4600      484       900       404       398      6.4
*   residential, gaseous fuels (1.A.4 PDF p. 33, Table 3-4)
1A4r.gas           51       26      1.9       0.3       1.2       1.2      5.4
*   residential, liquid fuels (1.A.4 PDF p. 34, Table 3-5)
1A4r.hfo           51       57     0.69        70       1.9       1.9      8.5
*   commercial/agriculture, hard and brown coal (1.A.4 PDF p. 36, Table 3-7)
1A4c.coal         173      931     88.8       900       117       108      6.4
*   commercial/agriculture, gaseous fuels (1.A.4 PDF p. 37, Table 3-8)
1A4c.gas           74       29       23      0.67      0.78      0.78      4.0
*   commercial/agriculture, liquid fuels (1.A.4 PDF p. 38, Table 3-9)
1A4c.hfo          306       93       20        94        21        18       56
*   end of table
;
* Sources (chapter, table):
*  1A1a  1.A.1 T3-2 hard coal, T3-4 natural gas (SOx EU region; BC not estimated, share of
*        1.A.2 gas T3-3), T3-6 heavy fuel oil, T3-7 gas oil
*  1A1bc 1.A.1 T5-1 coal (1.A.1.c; BC not estimated, share of T3-2); other fuels as 1A1a
*        (the 1.A.1.b refinery factor T4-2 is per tonne of crude input, not per fuel)
*  1A2   1.A.2 T3-2 solid fuels, T3-3 natural gas, T3-4 liquid fuels
*  1A3e  1.A.3.e.i T2-1 gas turbines (SOx and PM not relevant); engines on liquid fuels
*        as 1A1a gas oil, as the chapter suggests
*  1A4r  1.A.4 T3-3 hard and brown coal, T3-4 gaseous fuels, T3-5 liquid fuels
*  1A4c  1.A.4 T3-7 hard and brown coal, T3-8 gaseous fuels, T3-9 liquid fuels

* Source of the elements: no external source. apscol lists the column headers of APstat (the
*   pollutant rows of the Guidebook tables linked above); aplq picks the liquid classes of apfc.
*   columns of APstat, and the liquid fuel classes
set apscol columns of APstat / NOx, CO, NMVOC, SO2, PM10, PM25, BCsh /
*   liquid classes that share one Guidebook table where the chapter does not distinguish them
    aplq(apfc) liquid fuel classes / hfo, gasoil, gasoline, jet /;

* Liquid-fuel tables that do not distinguish fuels apply to every liquid class
*   power and heat: gasoline and jet as gas oil
APstat('1A1a',apfc,apscol)$(sameas(apfc,'gasoline') or sameas(apfc,'jet')) = APstat('1A1a','gasoil',apscol);
*   energy industries: all fuels except coal as in power and heat
APstat('1A1bc',apfc,apscol)$(not sameas(apfc,'coal')) = APstat('1A1a',apfc,apscol);
*   industry: all liquids as the single liquid-fuel table (stored under hfo)
APstat('1A2',apfc,apscol)$(aplq(apfc) and not sameas(apfc,'hfo'))  = APstat('1A2','hfo',apscol);
*   pipelines: coal (negligible) as industry coal
APstat('1A3e','coal',apscol)       = APstat('1A2','coal',apscol);
*   pipelines: engines on liquid fuels as power-plant gas oil, as the chapter suggests
APstat('1A3e',apfc,apscol)$aplq(apfc) = APstat('1A1a','gasoil',apscol);
*   residential: all liquids as the single liquid-fuel table
APstat('1A4r',apfc,apscol)$(aplq(apfc) and not sameas(apfc,'hfo')) = APstat('1A4r','hfo',apscol);
*   commercial/agriculture: all liquids as the single liquid-fuel table
APstat('1A4c',apfc,apscol)$(aplq(apfc) and not sameas(apfc,'hfo')) = APstat('1A4c','hfo',apscol);
* coal and gas used by aviation, railways and navigation (negligible) as small stationary plants
*   coal in aviation, rail and ships as commercial coal
APstat(aptech,'coal',apscol)$(sameas(aptech,'1A3a') or sameas(aptech,'1A3c') or sameas(aptech,'1A3d'))
*   (continuation) the source values
    = APstat('1A4c','coal',apscol);
*   gas in aviation and rail as industrial gas
APstat(aptech,'gas',apscol)$(sameas(aptech,'1A3a') or sameas(aptech,'1A3c'))
*   (continuation) the source values
    = APstat('1A2','gas',apscol);

* ------------------------------------------------------ mobile sources -------
* ---- In plain words ----------------------------------------------------------------------
* Here are the guidebook figures for vehicles, trains, ships and planes. They are given per
* kilogram of fuel and are turned into figures per unit of energy below. For road traffic,
* the figures of cars, vans, motorbikes and lorries are mixed according to an assumed share
* of each in the use of petrol and diesel.
* -------------------------------------------------------------------------------------------
* Source of the elements: vehicle, engine and fuel types of the Tier 1 tables of the EMEP/EEA
*   Guidebook 2023 mobile chapters:
*   1.A.3.b Road transport, Update 2026 (PDF), p. 20 Table 3-5 and p. 21 Table 3-6 (PC, LCV,
*   HDV, L-category, CNG buses):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-b-i/@@download/file
*   1.A.3.c Railways (PDF), p. 8 Table 3-1:
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-c-railways-2023/@@download/file
*   1.A.3.d Navigation (PDF), p. 16 Table 3-1 (bunker fuel oil), p. 17 Table 3-2 (MDO/MGO),
*   p. 18 Table 3-3 (LNG) and Table 3-4 (gasoline):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-d-navigation/@@download/file
*   1.A.3.a Aviation (PDF), p. 20 Table 3-3 (aviation gasoline), p. 22 Table 3-4 (A320 LTO cycle):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-a-aviation-2023/@@download/file
*   vehicle and engine types of the Guidebook mobile chapters
set apmob mobile Guidebook factor sets /
    PCpet     'road: petrol passenger cars'
    LCVpet    'road: petrol light commercial vehicles'
    Lpet      'road: petrol L-category (mopeds, motorcycles)'
    PCdsl     'road: diesel passenger cars'
    LCVdsl    'road: diesel light commercial vehicles'
    HDVdsl    'road: diesel heavy-duty vehicles and buses'
    CNGbus    'road: CNG buses'
    rail      'railways, gas oil'
    shipHFO   'ships, bunker fuel oil'
    shipMDO   'ships, marine diesel oil and marine gas oil'
    shipLNG   'ships, LNG'
    shipPET   'ships, gasoline'
    jetLTO    'aviation, jet kerosene (A320 LTO cycle)'
    avgas     'aviation, aviation gasoline'
*   end of the list
/;

* Source of the values: EMEP/EEA Guidebook 2023 (page and table on each row below):
*   1.A.3.b Road transport, Update 2026 (PDF): p. 20 Table 3-5 (CO, NMVOC), p. 21 Table 3-6
*   (NOx, PM) and Table 3-7 (NH3), p. 22 Table 3-11 (f-BC), p. 24 Table 3-14 (sulphur content):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-b-i/@@download/file
*   1.A.3.c Railways (PDF), p. 8 Table 3-1 (f-BC in the note under the table):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-c-railways-2023/@@download/file
*   1.A.3.d Navigation (PDF), pp. 16-18 Tables 3-1 to 3-4:
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-d-navigation/@@download/file
*   1.A.3.a Aviation (PDF), p. 20 Table 3-3, p. 22 Table 3-4:
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-3-a-aviation-2023/@@download/file
*   1.A.1 Energy industries (PDF), p. 19 Table 3-7 (rail SO2 as gas oil):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-1-energy-industries-2023/@@download/file
*   NCV column: 2006 IPCC Guidelines, Vol. 2 Energy, Chapter 1 (PDF), p. 1.18, Table 1.2
*   "Default net calorific values (NCVs)":
*   https://www.ipcc-nggip.iges.or.jp/public/2006gl/pdf/2_Volume2/V2_1_Ch1_Introduction.pdf
* g per kg of fuel (= kg/t); fBC = BC as fraction of PM2.5; BC in g/kg; NCV in GJ/t
table APmobt(apmob,*) Tier 1 factors for mobile sources
*   columns: pollutants in g/kg, fBC (BC fraction of PM2.5), BC in g/kg where given directly, NCV in GJ/t
                 NOx        CO     NMVOC       NH3       SO2      PM10      PM25       fBC        BC       NCV
*   petrol passenger cars (1.A.3.b Tier 1, mean value; PDF pp. 20-22, Tables 3-5, 3-6, 3-7, 3-11)
PCpet           3.98     48.36      7.75      0.84      0.08      0.02      0.02      0.12                44.3
*   petrol light commercial vehicles (1.A.3.b Tier 1, mean value; PDF pp. 20-22, Tables 3-5, 3-6, 3-7, 3-11)
LCVpet          5.93     118.7      7.42      0.77      0.08      0.02      0.02      0.05                44.3
*   petrol mopeds and motorcycles (1.A.3.b Tier 1, mean value; PDF pp. 20-22, Tables 3-5, 3-6, 3-7, 3-11)
Lpet            7.23    244.88     92.74      0.05      0.08      0.51      0.51      0.11                44.3
*   diesel passenger cars (1.A.3.b Tier 1, mean value; PDF pp. 20-22, Tables 3-5, 3-6, 3-7, 3-11)
PCdsl          11.77      2.41      0.51      0.02      0.08      0.78      0.78      0.57                  43
*   diesel light commercial vehicles (1.A.3.b Tier 1, mean value; PDF pp. 20-22, Tables 3-5, 3-6, 3-7, 3-11)
LCVdsl         13.48      6.81      1.23      0.01      0.08      1.22      1.22      0.55                  43
*   diesel heavy-duty vehicles and buses (1.A.3.b Tier 1, mean value; PDF pp. 20-22, Tables 3-5, 3-6, 3-7, 3-11)
HDVdsl         25.95       6.1       0.9      0.02      0.08      0.55      0.55      0.53                  43
*   CNG buses (1.A.3.b Tier 1, PDF pp. 20-21, Tables 3-5, 3-6; NH3 as diesel heavy-duty vehicles, fBC as petrol cars)
CNGbus          17.1      3.98      0.14      0.02         0      0.02      0.02      0.12                  48
*   railways, gas oil (1.A.3.c PDF p. 8, Table 3-1; SO2 from 1.A.1 PDF p. 19, Table 3-7, gas oil)
rail            52.4      10.7      4.65     0.007         2      1.44      1.37      0.65                  43
*   ships, bunker fuel oil (1.A.3.d PDF p. 16, Table 3-1; PM2.5 set equal to PM10)
shipHFO         69.1      3.67      1.67                19.2       5.2       5.2              0.0903      40.4
*   ships, marine diesel/gas oil (1.A.3.d PDF p. 17, Table 3-2; PM2.5 set equal to PM10)
shipMDO         72.2      3.84      1.75                1.82      1.07      1.07              0.0483        43
*   ships, LNG (1.A.3.d PDF p. 18, Table 3-3)
shipLNG         4.92      13.8         2                   0   0.00124   0.00106            2.49e-05        48
*   ships, gasoline (1.A.3.d PDF p. 18, Table 3-4; fBC of petrol L-category)
shipPET          9.4     573.9     181.5                  20       9.5       9.5      0.11                44.3
*   aviation, jet kerosene, Airbus A320 landing and take-off cycle (1.A.3.a PDF p. 22, Table 3-4)
jetLTO         13.82     10.11      2.01               0.845    0.0858    0.0858      0.48                44.1
*   aviation gasoline (1.A.3.a PDF p. 20, Table 3-3; PM not estimated)
avgas              4      1200        19                   1                          0.15                44.3
*   end of table
;
* Sources (chapter, table) and assumptions:
*  road  1.A.3.b T3-5 to T3-7 mean values (PM = exhaust PM, all PM2.5), T3-11 f-BC;
*        SO2 = 2 x sulphur content, Fuel 2005 specification of 40 ppm (T3-14);
*        CNG buses: NH3 not available, set to diesel HDV; f-BC not available, set to petrol PC
*  rail  1.A.3.c T3-1 (f-BC 0.65 from its note); SOx not estimated: 1.A.1.a gas oil (46.5 g/GJ)
*  ships 1.A.3.d T3-1 to T3-4; PM2.5 not given for bunker oil and MDO/MGO, set equal to PM10;
*        BC not estimated for gasoline, f-BC of petrol L-category
*  jet   1.A.3.a T3-4, Airbus A320 LTO cycle (most common EU aircraft): emissions per kg of
*        fuel burnt (NOx 11.28, CO 8.25, HC 1.64, SOx 0.69, PM 0.07 kg per 816.17 kg fuel);
*        HC taken as NMVOC; f-BC 0.48 as suggested in the chapter for jet engines
*  avgas 1.A.3.a T3-3; PM not estimated; f-BC 0.15 from its note
*  NCV   IPCC (2006) defaults

* Source of the values: no external source (assumption made for this model, EU-27 2010 order of
*   magnitude); not taken from a document. The non-road weights of 1 only say which row of
*   APmobt each technology and fuel class uses.
* road fuel split by vehicle category (assumption, EU-27 2010 order of magnitude)
*   weight of each vehicle/engine type in a technology and fuel class (weights of a pair sum to 1)
parameter APmobw(aptech,apfc,apmob) share of each mobile factor set in a technology and fuel class /
*   road petrol: 93% cars, 4% vans, 3% mopeds and motorcycles
    1A3b.gasoline.PCpet    0.93
    1A3b.gasoline.LCVpet   0.04
    1A3b.gasoline.Lpet     0.03
*   road diesel: 40% cars, 15% vans, 45% lorries and buses
    1A3b.gasoil.PCdsl      0.40
    1A3b.gasoil.LCVdsl     0.15
    1A3b.gasoil.HDVdsl     0.45
*   road gas: CNG buses
    1A3b.gas.CNGbus        1
*   railways: all liquid fuels as gas oil locomotives
    1A3c.hfo.rail          1
    1A3c.gasoil.rail       1
    1A3c.gasoline.rail     1
    1A3c.jet.rail          1
*   ships: fuel oil, diesel/gas oil, gasoline and LNG engines
    1A3d.hfo.shipHFO       1
    1A3d.gasoil.shipMDO    1
    1A3d.jet.shipMDO       1
    1A3d.gasoline.shipPET  1
    1A3d.gas.shipLNG       1
*   aviation: jet engines for all liquid fuels except aviation gasoline
    1A3a.jet.jetLTO        1
    1A3a.gasoil.jetLTO     1
    1A3a.hfo.jetLTO        1
    1A3a.gasoline.avgas    1
*   end of the list
/;
* other liquids and coal in road vehicles are treated as diesel
*   road: every fuel class other than gasoline and gas takes the diesel vehicle mix
APmobw('1A3b',apfc,apmob)$(not sameas(apfc,'gasoline') and not sameas(apfc,'gas'))
*   (continuation) the diesel weights
    = APmobw('1A3b','gasoil',apmob);

* ------------------------------------------------- resulting factors ----------
* ---- In plain words ----------------------------------------------------------------------
* Here one figure per technology, fuel type and pollutant is built from the tables above:
* fixed equipment directly, vehicles after converting from per kilogram to per unit of
* energy. Black carbon is computed as a share of fine particles. Organic carbon has no
* guidebook figure and follows fine particles. Ammonia outside road traffic has no figure
* either, so all fuels count the same for it.
* -------------------------------------------------------------------------------------------
* Source of the values: no external source; computed below from APstat, APmobt and APmobw,
*   whose sources are given above them.
*   relative emission intensity per technology, fuel class and pollutant, g/GJ
parameter APgb(aptech,apfc,pol) Guidebook emission factor used as relative intensity (g per GJ);

* stationary
*   technology/fuel pairs without a mobile weight: values of the stationary table
APgb(aptech,apfc,pol)$(not sum(apmob,APmobw(aptech,apfc,apmob))) = APstat(aptech,apfc,pol);
*   stationary BC = BC share (%) x PM2.5
APgb(aptech,apfc,'BC')$(not sum(apmob,APmobw(aptech,apfc,apmob)))
*   (continuation) the BC formula
    = APstat(aptech,apfc,'BCsh')/100*APstat(aptech,apfc,'PM25');

* mobile: g/kg -> g/GJ
*   mobile pairs, all pollutants but BC: weighted mean of the vehicle types, g/kg x 1000 / NCV (GJ/t) = g/GJ
APgb(aptech,apfc,pol)$(sum(apmob,APmobw(aptech,apfc,apmob)) and not sameas(pol,'BC'))
*   (continuation) weighted sum over the vehicle types of the pair
    = sum(apmob$APmobw(aptech,apfc,apmob), APmobw(aptech,apfc,apmob)*APmobt(apmob,pol)*1000/APmobt(apmob,'NCV'));
*   mobile BC: fBC x PM2.5, or BC given directly (ships), converted to g/GJ and weighted
APgb(aptech,apfc,'BC')$sum(apmob,APmobw(aptech,apfc,apmob))
*   (continuation) weighted sum over the vehicle types of the pair
    = sum(apmob$APmobw(aptech,apfc,apmob), APmobw(aptech,apfc,apmob)
*   (continuation) BC per kg of fuel, then per GJ
          *(APmobt(apmob,'fBC')*APmobt(apmob,'PM25') + APmobt(apmob,'BC'))*1000/APmobt(apmob,'NCV'));

* OC: the Guidebook has no OC factors; OC is split like PM2.5
*   OC takes the PM2.5 values
APgb(aptech,apfc,'OC') = APgb(aptech,apfc,'PM25');
* NH3: not estimated for almost all non-road combustion; outside road transport NH3 is
* split in proportion to energy use (equal factor for every fuel)
*   NH3 outside road transport: the same value 1 for all fuels, i.e. split by energy
APgb(aptech,apfc,'NH3')$(not sameas(aptech,'1A3b')) = 1;

*   print the resulting factors in the listing
display APgb;

* ------------------------------------------------- biomass combustion ---------
* ---- In plain words ----------------------------------------------------------------------
* Here are the emission factors for burning wood and other solid biomass, taken from the
* European emission inventory guidebook. They say how much each pollutant a home stove and
* an office or farm boiler emit per unit of energy. The model uses them only to decide how
* biofuel pollution is shared between homes and other buyers: home stoves are much dirtier,
* so homes get a larger share. The total amount always comes from EDGAR.
* -------------------------------------------------------------------------------------------
* Used only with APbio = 1 (REMES_Base.gms), for the bio part of the EDGAR emissions
* (APsrcB07). The bio emissions of a source group are split over the C-BIO purchases of
* the group's users in proportion to C-BIO use x factor below. C-BIO is the only bio fuel,
* so a common price per country is assumed and expenditure stands for energy.
* Again only ratios inside a group matter. Within every group except 1.A.4 all C-BIO users
* have the same technology, so the factor cancels out (split by C-BIO use); in 1.A.4 the
* factor sets the split between households (stoves) and the other users (boilers).
* There is no road-fuel rule for C-BIO: only the purchases of C_TLND are road transport.
* Source of the elements: no external source; C-BIO is a granular SAM account of EuroSAMMF2.gdx.
*   granular SAM fuels that carry the bio emissions (only C-BIO, mapped to pBIO by mapc)
set apbio0(*) granular bio fuels / 'C-BIO' /;

* Source of the values: EMEP/EEA Guidebook 2023, 1.A.4 Small combustion (PDF), p. 35 Table 3-6
*   (residential, biomass) and p. 39 Table 3-10 (commercial/institutional, agriculture, other
*   stationary, solid biomass):
*   https://www.eea.europa.eu/en/analysis/publications/emep-eea-guidebook-2023/part-b-sectoral-guidance-chapters/1-energy/1-a-combustion/1-a-4-small-combustion-2023/@@download/file
*   Guidebook Tier 1 factors for solid biomass, g/GJ, by technology (rows) and pollutant (columns);
*   BCsh is black carbon as % of PM2.5
table APbiot(aptech,*) Tier 1 factors for solid biomass (g per GJ)
*   column headers: pollutants as in pol (OC is derived below), plus the BC share
                  NOx       CO    NMVOC       NH3       SO2      PM10      PM25     BCsh
*   residential plants, solid biomass: Guidebook 1.A.4 PDF p. 35, Table 3-6 (stoves, total particles)
1A4r               50     4000      600         8        11       760       740       10
*   commercial/institutional, agriculture, other stationary, solid biomass: 1.A.4 PDF p. 39, Table 3-10
1A4c               91      570      300         1        11       163       160       28
*   end of table
;
* Sources: EEA (2023a) 1.A.4 small combustion, T3-6 residential plants, solid biomass;
*          T3-10 commercial/institutional, agriculture, other stationary, solid biomass.
*          BCsh = BC in % of PM2.5 (total particles).

* ---- In plain words ----------------------------------------------------------------------
* Here the guidebook table is turned into one factor per technology and pollutant. Where the
* guidebook gives nothing (power plants, factories, vehicles), all biofuel buyers of that
* group count the same, so pollution is shared by how much biofuel they buy. Black carbon is
* computed as a share of fine particles, and organic carbon is shared like fine particles.
* -------------------------------------------------------------------------------------------
* Source of the values: no external source; computed below from APbiot, whose source is given
*   above it.
*   factor of solid biomass per technology and pollutant, used only as a relative weight
parameter APbiogb(aptech,pol) Guidebook factor of solid biomass used as relative intensity (g per GJ);
*   default 1 for every technology: within such a group the split follows C-BIO use (energy)
APbiogb(aptech,pol) = 1;
*   technologies with a row in APbiot (1A4r, 1A4c) take the Guidebook values of the pollutants in pol
APbiogb(aptech,pol)$sum(apscol, APbiot(aptech,apscol)) = APbiot(aptech,pol);
*   black carbon = BC share (%) x PM2.5 factor
APbiogb(aptech,'BC')$sum(apscol, APbiot(aptech,apscol))  = APbiot(aptech,'BCsh')/100*APbiot(aptech,'PM25');
*   organic carbon: no Guidebook factor, split like PM2.5 (as for fossil fuels)
APbiogb(aptech,'OC')$sum(apscol, APbiot(aptech,apscol))  = APbiot(aptech,'PM25');

*   print the resulting factors in the listing
display APbiogb;
