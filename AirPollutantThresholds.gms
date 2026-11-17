* ============================================================================
* ============ AIR POLLUTANT THRESHOLDS (used only when APcap = 1) ===========
* ============================================================================
* ---- In plain words ----------------------------------------------------------------------
* This is the file where you set the air pollution caps. For each country, pollutant and
* model year you can give a cap, as a share of the country's 2007 pollution (for example
* 0.8 = 20% less than in 2007). Where the model would exceed the cap, polluters must buy
* permits, which works like a tax on pollution; below the cap the tax is zero. A share of 0
* means no cap. The caps are used only if the switch APcap in REMES_Base.gms is set to 1.
* -------------------------------------------------------------------------------------------
* APthr(cnt,pol,step) is the emission threshold in Gg (= kt) for each country,
* pollutant and step. When APcap = 1 it becomes the endowment of permits PAP
* given to the local government and the model solves
*
*     0 <= APthr(cnt,pol,step) - emissions(cnt,pol)  _|_  PAP(cnt,pol) >= 0
*
* so the tax PAP is positive only where emissions would exceed the threshold.
* Entries with APthr = 0 are NOT capped (the permit market is switched off).
*
* Convention: APthr = APfrac * APbase07, i.e. a fraction of the EDGAR 2007
* emissions (APbase07, = benchmark emissions of the model). Edit APfrac below,
* or assign APthr directly in Gg after the default line.
* Steps: 1=2005, 2=2010, 3=2015, ..., 10=2050, 12=2060.

Parameter
*   cap as a fraction of the country's EDGAR 2007 emissions APbase07 (0 = no cap)
APfrac(cnt,pol,step)   threshold as a fraction of 2007 emissions
*   cap in Gg, used as APB in each step of the loop in REMES_Base.gms
APthr(cnt,pol,step)    air pollutant emission threshold (Gg);

* default: no cap anywhere
*   all fractions 0: no permit market in any country, pollutant or step
APfrac(cnt,pol,step) = 0;

* example - cap PM10 in Italy at 80% of its 2007 level from 2025 (step 5) on:
*APfrac("IT","PM10",step)$(ord(step) ge 5) = 0.8;

*   threshold in Gg = fraction x 2007 emissions; assign APthr directly below this line to override
APthr(cnt,pol,step) = APfrac(cnt,pol,step)*APbase07(cnt,pol);
