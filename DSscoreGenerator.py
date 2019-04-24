import arcpy, os, sys

# Basically This idea


def citycalc(dlayer, slayer, alayer):
    # Empry dict for all cities to go in
    bigdict = {}
    cityfield = "CITY"
    stateabvfield = "STATE"
    busnamefield = "CONAME"
    statewholefield = "STATE_NAME"

    sthn = "SOUTHERN"
    dxe = "DIXIE"
    amer = "AMERICAN"

    layerz = [dlayer, slayer, alayer]
    for layer in layerz:
        # CURSOR
        curse = arcpy.SearchCursor(layer)

        for row in curse:
            # Identitfy the city.
            city = row.getValue(cityfield)
            state = row.getValue(statewholefield)
            stateabv = row.getValue(stateabvfield)
            busname = row.getValue(busnamefield)

            # Create a unique string 'City, ST' to account for multiple cities with same name (ie Columbus GA & OH)
            citystate = city + ", " + stateabv
            # City in bigdict? If not, add.
            if citystate not in bigdict:
                bigdict[citystate] = [0, 0, 0, None, None, 0]  # D, S, A, Dscore, Sscore, serror

            # Clean Southern businesses for southern city or state businesses (ex: southern new york)
            ecsit = False
            if layer == slayer:
                scity = sthn + " " + city
                sstate = sthn + " " + state
                sstateabv = sthn + " " + stateabv
                cursortests = [scity, sstate, sstateabv]
                # # Also do these without the space inbetween? script this
                # for itemmm in cursortests:
                    # newitemm = itemmm.replace(" ", "")
                    # cursortests.append(newitemm)
                # If the business has these in them, exit. Else, continue on
                for newitemm in cursortests:
                    if newitemm in busname:
                        ecsit = True
                    else:
                        ecsit = False  # Already the case but just making sure

            # Can also clean for Winn Dixie values here instead of beforehand in SQL

            # Continue with qualifying business names:
            if ecsit is True:
                print busname, "is not a qualifying Southern business name. Thank you next."
                # S Error; count of how many businesses not qualifying per city
                bigdict[citystate][5] = bigdict[citystate][5] + 1
            elif ecsit is False:
                if layer == dlayer:
                    bigdict[citystate][0] = bigdict[citystate][0] + 1
                elif layer == slayer:
                    bigdict[citystate][1] = bigdict[citystate][1] + 1
                elif layer == alayer:
                    bigdict[citystate][2] = bigdict[citystate][2] + 1
                else:
                    print "MAJOR ERROR 1"

        print bigdict  # This should print thrice

    # Calculate D & S Scores
    for citie in bigdict:
        dcount = bigdict[citie][0]
        scount = bigdict[citie][1]
        acount = bigdict[citie][2]
        dscore = bigdict[citie][3]
        sscore = bigdict[citie][4]

        bigdict[citie][3] = round(float(float(dcount) / float(acount)), 4)
        bigdict[citie][4] = round(float(float(scount) / float(acount)), 4)

    print "---------------------------------------------------------------------"
    print bigdict  # One last time

    # After all the above works, insert these into a city point layer. Or construct in another function
    return bigdict


thebigdict = citycalc(r'EsriBusinessData\Reed Cities 3\Businesses_sqllike_dixie_notlikewinndixie_reedcities',
                      r'EsriBusinessData\Reed Cities 3\Businesses_sqllike_southern_reedcities_notcleaned',
                      r'EsriBusinessData\Reed Cities 3\Businesses_sqllike_american_reedcities')

for citiest in thebigdict:
    print citiest, thebigdict[citiest]

# Create raster
# This is an example of a specific case. Use this function to insert custom file paths and settings.
arcpy.gp.Idw_sa("C:/Users/acc-s/Documents/School/_UTK_Masters/__Thesis/GIS/Geodatabases_Shapefiles/JSReed.gdb/personalresults2018trial2",
                "sscore", "C:/Users/acc-s/Documents/School/_UTK_Masters/__Thesis/GIS/Geodatabases_Shapefiles/JSReed.gdb/SRatio_2018_JACooper_IdwInterp1_Trial",
                "0.0875298", "2", "VARIABLE 12", "")  # Cell size, power, Variable
