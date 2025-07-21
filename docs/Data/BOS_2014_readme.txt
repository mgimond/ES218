The  BOS_2014.csv file  was downloaded from the Bureau of Transportation Statistics (http://www.transtats.bts.gov). It lists all commercial flights departing from and arriving to Logan airport (Boston, MA) for the year 2014.  It also lists various departure/arrival statistics. A description of each field follows:

YEAR:           Year
MONTH:	        Month
DAY_OF_MONTH:	Scheduled departure day of month
CARRIER:	Two letter airline  abbreviation code 
TAIL_NUM:	Airplane tail number
FL_NUM:	         Flight number
ORIGIN:	          Airport origin (three letter code)
ORIGIN_CITY_NAME: Airport origin city affiliation
DEST:	        Airport destination (three letter code)
DEST_CITY_NAME:	Airport destination city affiliation
CRS_DEP_TIME:	Scheduled departure time from origin
DEP_TIME:	Actual departure time from origin
DEP_DELAY:      Departure delay in minutes
CRS_ARR_TIME:	Scheduled arrival time to destination
ARR_TIME:	Actual arrival time to destination
ARR_DELAY:      Arrival delay in minutes
CANCELLED:	Cancelation indicator (yes = 1, no = 0)
CANCELLATION_CODE:	Cancellation code (A=Carrier,  B=Weather, C = National Air System) 
CRS_ELAPSED_TIME:	Scheduled flight time (minutes)
ACTUAL_ELAPSED_TIME:	Actual flight time (minutes)
DISTANCE:	Distance flown (miles)

Missing data are coded as "NA"

src: Data downloaded from http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=236
