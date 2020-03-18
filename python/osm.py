# Original python unzipping of .osm.bz2 files script

import bz2, arcpy, os, sys
from arcpy import env


# Default location for download of OSM Tool
osmtoolbox = r"c:\program files (x86)\arcgis\desktop10.6\ArcToolbox\Toolboxes\OpenStreetMap Toolbox.tbx"

# marylandtestbz = r"C:\Users\acc-s\Documents\School\_UTK_Masters\_Thesis\GIS\Geodatabases_Shapefiles\osm\maryland-latest.osm.bz2"
# marylandtestosm = r"C:\Users\acc-s\Documents\School\_UTK_Masters\_Thesis\GIS\Geodatabases_Shapefiles\osm\maryland-latest.osm"
osm_gdb = r"C:\Users\acc-s\Documents\School\_UTK_Masters\_Thesis\GIS\Geodatabases_Shapefiles\osm.gdb"
osm_folder = r'C:\Users\acc-s\Documents\School\_UTK_Masters\_Thesis\GIS\Geodatabases_Shapefiles\osm'


def OsmToTempGdb(osmfile):  # MAKE SURE I KNOW WHAT THE GEODATABASE HERE IS REFERRING TO # allpopfcs
    """ _ """
    # print "workspace:", env.workspace
    # env.workspace = holdinggeodatabase
    # print "new workspace", env.workspace

    # Use "Load OM File" tool to convert OSM toolbox to .gdb feature class
    #   Find this tool at <https://www.arcgis.com/home/item.html?id=c18d3d0d5c62465db60f89225fdd2698>
    # OSMGPFileLoader_osmtools
    # (in_osmFile, in_conserveMemory, out_targetdataset, out_osmPoints, out_osmLines, out_osmPolygons)
    #should I clear scratchGDB here?
    validname = (os.path.basename(osmfile[:len(osmfile)-4]))
    validatedTableName = arcpy.ValidateTableName(validname)
    nameOfTargetDataset = arcpy.os.path.join(osm_gdb, validatedTableName)
    # unvalidatedNameOfTargetDataset = os.path.join(holdinggeodatabase, FeatureDatasetName)

    osmLineFC = os.path.join(osm_gdb, validatedTableName, (validatedTableName + "_osm_ln"))
    osmPointFC = os.path.join(osm_gdb, validatedTableName, (validatedTableName + "_osm_pt"))
    osmPolygonFC = os.path.join(osm_gdb, validatedTableName, (validatedTableName + "_osm_ply"))
    allthree = [osmLineFC, osmPointFC, osmPolygonFC]
    keystoadd = "name;addr:street;addr:city;addr:state;addr:postcode"
    print nameOfTargetDataset
    print osmPolygonFC
    print osmLineFC
    print osmPointFC
    arcpy.ImportToolbox(osmtoolbox)
    # Use toolbox to import the 3 FCs of OSM data for target country into scratchGDB
    try:
        arcpy.OSMGPFileLoader_osmtools(in_osmFile=osmfile, in_conserveMemory="CONSERVE_MEMORY",
                                       in_attributeselect=keystoadd, out_targetdataset=nameOfTargetDataset,
                                       out_osmPoints=osmPointFC, out_osmLines=osmLineFC, out_osmPolygons=osmPolygonFC)
    except Exception:
        print "an exception error was thrown during the OSM file loading process. Check if osm polygon was created"

    # May need to do another osmtools geoprocessing step.
    for fc in allthree:
        arcpy.OSMGPAttributeSelector_osmtools(in_osmfeatureclass=fc, in_attributeselect=keystoadd)

    # Potentially an sql query after this to select out the relevant fields.
    # select * From fc WHERE lower(osm_name) LIKE '%dixie%'  # for example


    # # Copy feature to its own new osm gdb
    # if arcpy.Exists(osmPolygonToolOutputFC):  # if an osm polygon feature is in the temporary .gdb:
    #     print osm_poly, "has been created in temp gdb as", osmPolygonToolOutputFC
    #     # Copy only the OSM polygon to output gdb.
    #     arcpy.FeatureClassToFeatureClass_conversion(osmPolygonToolOutputFC, osm_gdb, osm_poly)
    #     # arcpy.CopyFeatures_management(osmPolygonToolOutputFC, os.path.join(outgdb, osm_poly)) #use FC2FC function
    #     print "OSM Polygon now in", osm_gdb
    # else:
    #     print osm_ply_toolname, "won't copy b/c it does not exist in the form of", osmPolygonToolOutputFC

    # del env.workspace

# arcpy.OSMGPFileLoader_osmtools(in_osmFile="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm/maryland-latest.osm",
#                                in_conserveMemory="CONSERVE_MEMORY", in_attributeselect="",
#                                out_targetdataset="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/maryland_latestt",
#                                out_osmPoints="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/maryland_latestt/maryland_latestt_osm_pt",
#                                out_osmLines="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/maryland_latestt/maryland_latestt_osm_ln",
#                                out_osmPolygons="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/maryland_latestt/maryland_latestt_osm_ply")
#
# arcpy.OSMGPFileLoader_osmtools(in_osmFile="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm/delaware-latest.osm",
#                                in_conserveMemory="CONSERVE_MEMORY", in_attributeselect="name;addr:street;addr:city;addr:state;addr:postcode",
#                                out_targetdataset="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/delaware_latestt",
#                                out_osmPoints="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/delaware_latestt/delaware_latestt_osm_pt",
#                                out_osmLines="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/delaware_latestt/delaware_latestt_osm_ln",
#                                out_osmPolygons="C:/Users/acc-s/Documents/School/_UTK_Masters/_Thesis/GIS/Geodatabases_Shapefiles/osm.gdb/delaware_latestt/delaware_latestt_osm_ply")

# # Update added attribute fields - code sample
# # Replace a layer/table view name with a path to a dataset (which can be a layer file) or create the layer/table view within the script
# # The following inputs are layers or table views: "delaware_latestt\delaware_latestt_osm_pt"
# arcpy.OSMGPAttributeSelector_osmtools(in_osmfeatureclass="delaware_latestt\delaware_latestt_osm_pt", in_attributeselect="name")
# # Update multiple attribute fields code sample
# # Replace a layer/table view name with a path to a dataset (which can be a layer file) or create the layer/table view within the script
# # The following inputs are layers or table views: "delaware_latestt\delaware_latestt_osm_ply"
# arcpy.OSMGPAttributeSelector_osmtools(in_osmfeatureclass="delaware_latestt\delaware_latestt_osm_ply",
#                                       in_attributeselect="name;addr:city;addr:street;addr:state;addr:postcode")



# Pull OSM file into weight_sources from the raw .bz2 download from geofabrik
def OsmExtract(aoi):  # , intermediategdb, outputgdb):
    """ If it does not already exist, add osm_poly to weight_sources by decripting geofabrik's .bz2 download file """
    downloadfilepath = os.path.join(osm_folder, (aoi.lower() + "-latest.osm.bz2"))
    outputosmfilepath = downloadfilepath[:len(downloadfilepath)-4]
    aoifinalpointfc = os.path.join(osm_gdb,
                                   ((os.path.basename(outputosmfilepath[:len(outputosmfilepath)-4]) +
                                     "_openstreet_line")))

    # Does osm_poly already exist in weight sources? If so, exit function.
    if arcpy.Exists(aoifinalpointfc) is False:  # if osm_point_lu is not in osm_gdb:
        # Import osm polygon from downloads folder
        if not os.path.exists(outputosmfilepath):  # if the country's .osm file is not in the downloads folder:
            # "No output osm file exists by the name of", outputosmfilepath; "decript bz2 file to make this happen.
            if os.path.exists(downloadfilepath):  # if the country's encriped .osm.bz2 file exists:
                # Decript .bz2 downloaded OSM file
                # Same as "bzip2 -dk file.bz2" in Linux command line
                with open(outputosmfilepath, "wb") as new_file, open(downloadfilepath, "rb") as file:
                    decompressor = bz2.BZ2Decompressor()
                    for data in iter(lambda: file.read(100 * 1024), b""):
                        new_file.write(decompressor.decompress(data))
                # Decripted OSM file will exist in downloads folder
                # Convert OSM file to intermediate gdb (allpopFCs)
                # and copy features into output gdb
                OsmToTempGdb(outputosmfilepath)
                # FC to FC conversion temp gdbto wegiht sources # may not need if copy features works fine.
            else:
                print "no output file exists by the name of", downloadfilepath, "; commence decription"
                print "Download bz2 file for", aoi, "at <http://download.geofabrik.de/>"
        else:
            OsmToTempGdb(outputosmfilepath)
        print outputosmfilepath, "exists already; go straight to converting the .osm file"

    else:
        print "OSM Polygon is already in weight_sources.gdb"


def osm_tag_merge(fc):
    """ Create tags for each qualifying OSM feature and append that tag to the 'all_lu_tags' field in the link table.
    May be obsolete because of existing landscanhd.osmtagmerge.osm_tag_merge function.
    The functions execute identically """
    lu_tags = ('building', 'natural', 'waterway', 'amenity', 'landuse', 'place', 'railway',
               'power', 'leisure', 'man_made', 'shop', 'tourism', 'historic', 'aeroway',
               'aerialway', 'military', 'craft', 'office', 'construction', 'disused', 'water',
               'wood', 'harbour', 'sport', 'wetland')
    lu_tags = [tag for tag in lu_tags if tag in [f.name for f in arcpy.ListFields(fc)]]
    merge_field = 'all_lu_tags'
    if not merge_field in [f.name for f in arcpy.ListFields(fc)]:
        arcpy.management.AddField(fc, merge_field, 'TEXT', field_length=500)

    quoted = [t.join(("'", "'")) for t in lu_tags]
    exclaimed = [t.join(("!", "!")) for t in lu_tags]
    zipped_string = str(zip(lu_tags, exclaimed)).replace("'!", "!").replace("!'", "!")
    expression = "concat({0})".format(zipped_string)
    code_block = "\n".join([
        "def concat(fields):",
        "    not_null = [f for f in fields if f[1]]",
        "    return ','.join([':'.join((f)) for f in not_null])"
    ])
    arcpy.management.CalculateField(fc, merge_field, expression, 'PYTHON', code_block)


# OSM Tag Merge on the temp osm FC before running this function
def SelectAndCopyOSM(ingdb, outgdb, filledfield):
    """ Select only features that contain values in the filledfield
     and export them to the output gdb (like weight_sources.gdb) """

    tempOsmFC = DefineOSM_FC(ingdb)
    print tempOsmFC
    if arcpy.Exists(tempOsmFC):  # if an osm polygon feature is in the osm only:
        print osm_poly, "exits in", os.path.basename(ingdb), "as", tempOsmFC

        # Create the selection where only features in the designated field that aren't blank are selected
        if arcpy.Exists(osm_lyr):
            arcpy.Delete_management(osm_lyr)
        arcpy.MakeFeatureLayer_management(tempOsmFC, osm_lyr)  # Create a feature layer to prepare for selection
        rezult = arcpy.GetCount_management(osm_lyr)
        print rezult, "total features"

        # Select only non-blank features
        fieldDelimited = arcpy.AddFieldDelimiters(tempOsmFC, filledfield)
        if filledfield == OSM_LU_Tags:
            sqlexpression = """{0} <> {1}""".format(fieldDelimited, "''")
            outFCname = osm_poly_lu
        else:  # If fillfield == dayhectare
            sqlexpression = """{0} IS NOT {1}""".format(fieldDelimited, "NULL")
            outFCname = osmdensitypoly
        arcpy.SelectLayerByAttribute_management(osm_lyr, "NEW_SELECTION", sqlexpression)
        rezult2 = arcpy.GetCount_management(osm_lyr)
        print rezult2, "features selected with SQL expression: WHERE", sqlexpression

        # Check to see if an OSM FC exists in outgdb.
        #   When called as a part of weight_sources_prep function, this should be a redundant step
        if DefineOSM_FC(outgdb) is not None:
            arcpy.Delete_management(DefineOSM_FC(outgdb))
        # Copy only the OSM polygon featrues with TNTs to output gdb.
        arcpy.FeatureClassToFeatureClass_conversion(osm_lyr, outgdb, outFCname)
        # arcpy.CopyFeatures_management(osmPolygonToolOutputFC, os.path.join(outgdb, osm_poly)) #use FC2FC function
        print "OSM Polygon now in", outgdb
    else:
        print osm_poly, "won't copy b/c it does not exist in the form of", tempOsmFC


def OsmWeightSourcesPrep(country, intermediategdb):
    """ Adds a land-use OSM FC to weight_sources by extracting all OSM FCs from a .osm file, assigning tags to the
     polygon FC, and exporting only those features with tags. """
    classinstance = CountryClass(country)
    outputgdb = classinstance.weightsources
    osm_gdb = classinstance.osm_gdb

    if DefineOSM_FC(outputgdb) is not None:
        #Delete in future postgres workflow; larger osm FC from osm.gdb is archived
        print "OSM Polygon is already in weight sources"
    else:
        #
        OsmExtract(country, intermediategdb, outputgdb)
        #
        # OsmToGdb(intermediategdb, outputgdb)  # will be included in OSM extract
        print "OSM Polygon has been extraced and placed in its own .gdb"
        #Ensure that if Osm Extract doesn't work (ie if no osm poly comes out of this) that the next functions don't run.
        tempOsmFc = DefineOSM_FC(osm_gdb)  # The OSM polygon FC in the OpenStreetMap GDB
        if arcpy.Exists(tempOsmFc):
            landscanhd.osmtagmerge.osm_tag_merge(tempOsmFc)
            # osm_tag_merge(tempOsmFc)  # equivalent function already in landscanhd module. Use for better updates.
            SelectAndCopyOSM(osm_gdb, outputgdb, OSM_LU_Tags)



def updateOsmlinktable(fc, linktable):  # rename this updateOsmlinktable if it works well with Russia
    """ Update the link table within the .gdb to include all 'all_lu_tags' values with old arcpy.SearchCursor """

    # Check to see if all linktablefieldsosm already exist within the table. If not, insert them.
    if OSM_LU_Tags not in quick.list_fields(linktable):
        # Add field to table
        arcpy.AddField_management(linktable, OSM_LU_Tags, "TEXT", field_length=500)

    if OsmPdt_Code not in quick.list_fields(linktable):
        arcpy.AddField_management(linktable, OsmPdt_Code, "TEXT", field_length=4)


    fc_cursor = arcpy.SearchCursor(fc)
    linktable_searchcursor = arcpy.SearchCursor(linktable)
    linktable_insertcursor = arcpy.InsertCursor(linktable)
    taglist = []
    # Place all unique tags existing in the linktable already in a list
    for ii in linktable_searchcursor:
        tag = encodeunicode(ii.getValue(OSM_LU_Tags))#Encoding issue with OMS Here
        if tag not in taglist:
            taglist.append(tag)
    # Compare all tags from the FC to the tags in the link table (via the list)
    #   If the fc tag is unique, append it to the list
    for row in fc_cursor:
        fctag = encodeunicode(row.getValue(OSM_LU_Tags))
        if fctag not in taglist:
            #deletethis print statement later
            # print fc, "tag that is not in but is to be inserted into the link table:", fctag
            insertitem = linktable_insertcursor.newRow()
            insertitem.setValue(OSM_LU_Tags, fctag)
            insertitem.setValue(OsmPdt_Code, "new")
            linktable_insertcursor.insertRow(insertitem)
            taglist.append(fctag)  # Append the new unique tag to the list so it is not added multiple times.
            #deletethisprintstatementlater
            print fctag, "added to osm link table with 'new' pdt code"


def PdtOsmCodeMatcher(OSM_FC):
    """ Set PDT_Code value within each FC's table based on previously assigned PDT codes in OSM Link Table """
    PdtOsmCodeDict = {}

    # Switch environments to link table .gdb
    arcpy.env.workspace = pdtgdb
    #  Import TNTs and their respective PDT Codes into a dictionary
    linkRows = arcpy.SearchCursor(osmlinktable)
    for row in linkRows:
        PdtOsmCodeDict[(row.getValue(OSM_LU_Tags))] = (row.getValue(OsmPdt_Code))

    # Restore working .gdb as environment
    arcpy.env.workspace = os.path.dirname(OSM_FC)
    #  Check to see if the PDT_Code field exist in the FCs' tables. If not, create and add it to the table.
    # The PDT_Code field should not exist; the createjoinfield function deletes this field if it exists
    FieldFormatting(OSM_FC, PDT_Code)

    # Fill the PDT_Code field in the FC based on the LSHD_PDT_JoinField
    rows = arcpy.UpdateCursor(OSM_FC)
    for row in rows:
        encodedTag = encodeunicode(row.getValue(OSM_LU_Tags))
        if encodedTag in PdtOsmCodeDict:
            insertvalue = PdtOsmCodeDict[encodedTag]
            # Parks Patch; PDT entry for parks no longer exists. Set all 0706 as simply 0700.
            # Delete this patch when issue is resolved.
            if insertvalue == "0706":
                row.setValue(PDT_Code, "0700")
                rows.updateRow(row)
            else:
                row.setValue(PDT_Code, insertvalue)
                rows.updateRow(row)


def cleanOSM(OSM_FC):
    """ Delete any Link Table Fields from the OSM feature class """
    DeleteField(OSM_FC, FloorsLSHD)
    DeleteField(OSM_FC, LSHD_PDT_JoinField)
    DeleteField(OSM_FC, SourceFC)


def OnlyOSM1stRun(country):
    """ Run this function if you only want to process the osm_poly FC into weight_sources and generate link tags.
     This function archives ~\openstreetmap.gdb\osm_poly """
    # Variables
    classisntance = CountryClass(country)
    weight_sources = classisntance.weightsources
    osm_gdb = classisntance.osm_gdb
    OsmFc = DefineOSM_FC(weight_sources)
    ListOsmFC = [OsmFc]

    # Functions
    archive.archiveOsm(country)
    # Extract .osm from .bz2, generate tags, and load tagged features as FC in weight_sources.gdb
    OsmWeightSourcesPrep(country, arcpy.env.scratchGDB)

    arcpy.env.workspace = weight_sources
    updateOsmlinktable(OsmFc, osmlinktable)  # Append those tags into the link table
    codefiller(osmlinktable)  # Second so it will work with an updated link table from the step before


def OnlyOSM2ndRun(country):
    """ Run this function after running OnlyOSM1stRun and updating the osm link table
    to move osm_poly FC into weight_stack_data """
    # Variables
    classinstance = CountryClass(country)
    weight_sources = classinstance.weightsources
    weight_stack_data = classinstance.weightstackdata
    OsmFc = DefineOSM_FC(weight_sources)
    ListOsmFC = [OsmFc]

    arcpy.env.workspace = weight_sources
    # Functions
    PdtOsmCodeMatcher(OsmFc)  # Set PDT_Code within FC's table based on previously assigned PDT codes in OSM Link Table
    DayAndNight(country, ListOsmFC)  # Link day and night hectares from pdtxml table to FC using the PDT Code
    cleanOSM(OsmFc)  # Ensures no extraneous BTZ/BOI specific fields have crept into the OSM FC

    # Select features from OSM FC with density and copy into weight_stack_data.gdb without deleting other FCs there
    SelectAndCopyOSM(weight_sources, weight_stack_data, day_hectare)
    # No link table transfer necessary here because the osm_link table is edited by hand directly.


