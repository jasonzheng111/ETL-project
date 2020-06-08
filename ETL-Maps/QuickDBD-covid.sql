-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ObcTlJ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "covid" (
    "state" varchar   NOT NULL,
    "country_region" varchar   NOT NULL,
    "last_update" int   NOT NULL,
    "lat" int   NOT NULL,
    "long" int   NOT NULL,
    "confirmed" int   NOT NULL,
    "deaths" int   NOT NULL,
    "Recovered" int   NOT NULL,
    "Active" int   NOT NULL,
    "FIPS" int   NOT NULL,
    "incident_Rate" int   NOT NULL,
    "people_tested" int   NOT NULL,
    "people_hospitalized" int   NOT NULL,
    "Mortality_rate" int   NOT NULL,
    "UID" int   NOT NULL,
    "1S03" varchar   NOT NULL,
    "Testing_Rate" int   NOT NULL,
    "hopitalization_rate" int   NOT NULL,
    "Telemed_2019" int   NOT NULL,
    "Telemed_2020" int   NOT NULL,
    "code" varcha   NOT NULL,
    "covid_level" varchar   NOT NULL,
    "text" VARCHAR   NOT NULL,
    CONSTRAINT "pk_covid" PRIMARY KEY (
        "state"
     )
);

CREATE TABLE "telemedicine" (
    "id" INT   NOT NULL,
    "state" varchar   NOT NULL,
    "Telemedicine_2019" INT   NOT NULL,
    "Telemedicine_covid" INT   NOT NULL,
    CONSTRAINT "pk_telemedicine" PRIMARY KEY (
        "Telemedicine_2019","Telemedicine_covid"
     )
);

ALTER TABLE "covid" ADD CONSTRAINT "fk_covid_Telemed_2019_Telemed_2020" FOREIGN KEY("Telemed_2019", "Telemed_2020")
REFERENCES "telemedicine" ("Telemedicine_2019", "Telemedicine_covid");

ALTER TABLE "telemedicine" ADD CONSTRAINT "fk_telemedicine_state" FOREIGN KEY("state")
REFERENCES "covid" ("state");

