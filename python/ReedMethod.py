import os, sys, arcpy

# Variables
cityfccity = "PlaceName"
cityfcstate = r"RegionAbbr"
businessfccity = "CITY"
businessfcstate = "STATE"


def reed_func(infc, businessfc):
    """ _ """
    reedcitydict = {}
    businessbasename = str(arcpy.Describe(businessfc).baseName)

    citycursor = arcpy.SearchCursor(infc)
    for row in citycursor:
        individcity = row.getValue(cityfccity)
        indivstate = row.getValue(cityfcstate)
        if individcity not in reedcitydict:
            reedcitydict[individcity.upper()] = [indivstate.upper(), 0]
    # print reedcitydict

    #
    arcpy.AddField_management(infc, field_name=businessbasename, field_type="SHORT")

    # Find all businesses in the businessfc that are in the city specified by the reed list from 76
    businesscursor = arcpy.SearchCursor(businessfc)
    for buz in businesscursor:
        buzcity = buz.getValue(businessfccity)
        buzstate = buz.getValue(businessfcstate)
        if buzcity.upper() in reedcitydict:
            # if the state of the business city matches the state of the reed city
            if buzstate.upper() == reedcitydict[buzcity.upper()][0]:

