/* CSCI-UA.60-1
   Class Exercise: Using LOAD DATA with MySQL
   Data are from:
http://www.census.gov/geo/maps-data/data/gazetteer2010.html */

/* Data Description from the US Census:

Column  Label           Description
Column 1        USPS            United States Postal Service State Abbreviation
Column 2        GEOID   Geographic Identifier
Column 3        NAME            Name
Column 4        LOGRADE         Lowest Grade Provided
Column 5        HIGRADE         Highest Grade Provided
Column 6        POP10   2010 Census population count.
Column 7        HU10            2010 Census housing unit count.
Column 8        ALAND   Land Area (square meters)
Column 9        AWATER  Water Area (square meters)
Column 10       ALAND_SQMI Land Area (square miles)
Column 11       AWATER_SQMI Water Area (square miles)
Column 12       INTPTLAT        Latitude (decimal degrees)
Column 13       INTPTLONG       Longitude (decimal degrees)

Columns 12 and 13: First character is blank or "-" denoting East or West longitude respectively.
*/

DROP TABLE IF EXISTS sd;
CREATE TABLE sd (
  sd_state char(2),
  sd_geoid varchar(10),
  sd_name varchar(255),
  sd_lowestGrade varchar(4),
  sd_highestGrade varchar(4),
  sd_pop_2010 int,
  sd_hu_2010 int,
  sd_aland bigint,
  sd_awater bigint,
  sd_aland_sqmi double,
  sd_awater_sqmi double,
  sd_intptlat double,
  sd_intptlong decimal(20,8),
  PRIMARY KEY(sd_geoid)
  ) ;

/* FORMAT FOR TAB-DELIMITED FILES: */
  LOAD DATA LOCAL INFILE 'sd.txt'
  INTO TABLE sd;

