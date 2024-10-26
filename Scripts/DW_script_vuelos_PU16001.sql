CREATE TABLE DimAirline(
    AirlineKey int PRIMARY KEY IDENTITY NOT NULL,
    AirlineCode Varchar (10) NOT NULL, --Llave de negocio
    [Description] Varchar (500) NOT NULL
)sortKey(airlineKey,airlineCode);

CREATE TABLE DimDate(
    DateKey int PRIMARY KEY distkey NOT NULL,
    FullDate Varchar(10) NOT NULL,
    [DayName] Varchar (25) NOT NULL,
	[WeekDay] int NOT NULL,
	MonthDayNum int NOT NULL,
    [Month] int NOT NULL,
	[MonthName] Varchar (25) NOT NULL,
    MonthWeekNum int NOT NULL,
    YearWeekNum int NOT NULL,
    [Quarter] int NOT NULL,
    [Year] int NOT NULL
)sortKey(DateKey, [MonthName], [Year]);

CREATE TABLE factvuelo(
    DateKey int NOT NULL,
    AirlineKey int NOT NULL,
    FlightNumberOperatingAirline int NOT NULL,
    --Datos de origen del vuelo
    OriginCityName varchar(100) NOT NULL,
    OriginStateName varchar(100) NOT NULL,
    --Datos del destino del vuelo
    DestCityName varchar(100) NOT NULL,
    DestStateName varchar(100) NOT NULL,
    CrsDepTime int NOT NULL,
    DepTime int NOT NULL,
    [Delayed] varchar(3) NOT NULL, --Retrasado
    DepDelayMinutes int NOT NULL,
    ArrDelayMinutes int NOT NULL,
    WheelsOff int NOT NULL,
    WheelsOn int NOT NULL,
    CrsArrTime int NOT NULL,
    ArrTime int NOT NULL,
    Canceled int NOT NULL, --Cancelado
    Diverted int NOT NULL, --Desviado
    CrsElapsedTime int NOT NULL,
    ActualElapsedTime int NOT NULL,
    Airtime int NOT NULL, --Tiempo en el aire
    CarrierDelay int NOT NULL, --Retraso por transportista
    WeatherDelay varchar(10) NOT NULL, --Retraso por clima
    NasDelay varchar(10) NOT NULL, --National Air System Delay
    SecurityDelay varchar(10) NOT NULL, --Retraso por seguridad
    LateAircraftDelay varchar(10) NOT NULL, --Retraso tardío de la aeronave
    DivAirportLandings int NOT NULL, --Numero de aterrizajes en aeropuertos dif
    DivReachedDest varchar(10) NOT NULL, --Vuelo desviado llego a su destino
    DivActualElapsedTime varchar(10) NOT NULL,
    DivArrDelay varchar(10) NOT NULL,
	FOREIGN KEY(AirlineKey) REFERENCES DimAirline(AirlineKey),
	FOREIGN KEY(DateKey) REFERENCES DimDate(DateKey)
)sortKey(AirlineKey, DateKey);