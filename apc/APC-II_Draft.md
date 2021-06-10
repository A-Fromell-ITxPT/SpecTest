---
title: S02- Onboard Architecture specification Part1X - APC-II
---

-   [<span class="toc-section-number">1</span> Concepts and
    Terminology](#concepts-and-terminology)
    -   [<span class="toc-section-number">1.1</span> ITxPT Data
        Dictionary Concepts](#itxpt-data-dictionary-concepts)
    -   [<span class="toc-section-number">1.2</span> Other
        Terminology](#other-terminology)
-   [<span class="toc-section-number">2</span> APC-II Solution
    description](#apc-ii-solution-description)
    -   [<span class="toc-section-number">2.1</span> Relation to ITxPT
        S02P07 APC
        Specification](#relation-to-itxpt-s02p07-apc-specification)
    -   [<span class="toc-section-number">2.2</span> Purpose of
        APC](#purpose-of-apc)
    -   [<span class="toc-section-number">2.3</span> High Level
        solution](#high-level-solution)
    -   [<span class="toc-section-number">2.4</span> What is not
        standardized](#what-is-not-standardized)
    -   [<span class="toc-section-number">2.5</span> PASSENGER
        SPACES](#passenger-spaces)
-   [<span class="toc-section-number">3</span> Conceptual Data
    Model](#conceptual-data-model)
-   [<span class="toc-section-number">4</span> Detailed Data
    Model](#detailed-data-model)
    -   [<span class="toc-section-number">4.1</span> Uniqueness of
        IDs](#uniqueness-of-ids)
    -   [<span class="toc-section-number">4.2</span>
        Entrances](#entrances)
        -   [<span class="toc-section-number">4.2.1</span> External
            entrances](#external-entrances)
    -   [<span class="toc-section-number">4.3</span> Relations of
        Spaces](#relations-of-spaces)
        -   [<span class="toc-section-number">4.3.1</span>
            Entrance-Entrance Mappings](#entrance-entrance-mappings)
    -   [<span class="toc-section-number">4.4</span> No Spaces
        defined](#no-spaces-defined)
-   [<span class="toc-section-number">5</span> Data Format
    JSON](#data-format-json)
    -   [<span class="toc-section-number">5.1</span> APC Static
        Data](#apc-static-data)
        -   [<span class="toc-section-number">5.1.1</span> SensorId to
            entranceId mapping](#sensorid-to-entranceid-mapping)
        -   [<span class="toc-section-number">5.1.2</span> PASSENGER
            SPACE CAPACITY](#passenger-space-capacity)
        -   [<span class="toc-section-number">5.1.3</span> PASSENGER
            SPACE](#passenger-space)
        -   [<span class="toc-section-number">5.1.4</span> ENTRANCE FOR
            PASSENGER SPACE](#entrance-for-passenger-space)
        -   [<span class="toc-section-number">5.1.5</span> Entrance
            Mapping](#entrance-mapping)
    -   [<span class="toc-section-number">5.2</span> APC Counting
        Data](#apc-counting-data)
        -   [<span class="toc-section-number">5.2.1</span> Time
            synchronization](#time-synchronization)
        -   [<span class="toc-section-number">5.2.2</span> APC
            objectCount structure](#apc-objectcount-structure)
        -   [<span class="toc-section-number">5.2.3</span> PASSENGER
            ENTRANCE COUNT](#passenger-entrance-count)
        -   [<span class="toc-section-number">5.2.4</span> Passenger
            Count Triggers](#passenger-count-triggers)
        -   [<span class="toc-section-number">5.2.5</span> PASSENGER
            SPACE OCCUPANCY COUNT](#passenger-space-occupancy-count)
        -   [<span class="toc-section-number">5.2.6</span> PASSENGER
            SPACE ENTRANCE COUNT](#passenger-space-entrance-count)
-   [<span class="toc-section-number">6</span> Transport MQTT using JSON
    format](#transport-mqtt-using-json-format)
    -   [<span class="toc-section-number">6.1</span> General
        Requirements](#general-requirements)
    -   [<span class="toc-section-number">6.2</span> Security
        Considerations](#security-considerations)
    -   [<span class="toc-section-number">6.3</span> Performance
        Considerations](#performance-considerations)
    -   [<span class="toc-section-number">6.4</span> Functional Group
        and Provider Names](#functional-group-and-provider-names)
    -   [<span class="toc-section-number">6.5</span> MQTT APC Topic
        tree](#mqtt-apc-topic-tree)
    -   [<span class="toc-section-number">6.6</span> `entrancecounts`
        Providers](#entrancecounts-providers)
        -   [<span class="toc-section-number">6.6.1</span>
            Inventory](#inventory)
    -   [<span class="toc-section-number">6.7</span> `spacecounts`
        Providers](#spacecounts-providers)
        -   [<span class="toc-section-number">6.7.1</span>
            Inventory](#inventory-1)
    -   [<span class="toc-section-number">6.8</span> `vehicledefine`
        Providers](#vehicledefine-providers)
        -   [<span class="toc-section-number">6.8.1</span>
            Inventory](#inventory-2)

<table style="width:99%;">
<colgroup>
<col style="width: 98%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;"><strong>Information Technology for Public Transport</strong> (ITxPT)<br />
Rue Sainte-Marie 6, B-1080 Brussels | Belgium<br />
Tel +32 (0)2 673 61 00 | Fax +32 (0)2 660 10 72<br />
<a href="mailto:info@itxpt.org" class="email">info@itxpt.org</a> | <a href="http://www.itxpt.org">www.itxpt.org</a></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">International non-profit making association (AISBL) incorporated by Royal Decree and the Belgian Ministry of Justice under Belgian law WL22/16.729 on 4<sup>th</sup> May 2016.</td>
</tr>
</tbody>
</table>

**Important notice**

The present document can be downloaded from
https://wiki.itxpt.org/index.php?title=ITxPT_Technical_Specifications.

The present document may be made available in electronic versions and/or
in print. The content of any electronic and/or print versions of the
present document shall not be modified without the prior written
authorization of ITxPT. In case of any existing or perceived difference
in contents between such versions and/or in print, the prevailing
version of an ITxPT deliverable is the one made publicly available in
PDF format at https://wiki.itxpt.org.

Users of the present document should be aware that the document may be
subject to revision or change of status. Information on the current
status of this and other ITxPT documents is available at
https://wiki.itxpt.org/index.php?title=Releases.

If you find errors in the present document, please send your comment to
the technical support https://itxpt.org/membership/contact-us.

**Copyright Notification**

All rights reserved. This document has been produced and approved by
ITxPT and represents the views of those members who participated.

The content of the PDF version shall not be modified. The copyright and
the foregoing restriction extend to reproduction in all media.

Users of the present document should be aware that the document may be
subject to revision or change of status. Information on the current
status of this and other ITxPT documents is available at
[wiki.txpt.org](https://itxptorg.sharepoint.com/sites/ITxPTTeam/Shared%20Documents/Specifications/2.%20Next%20release/2020%20v2.1.1/S02/Part04-%20FMStoIP/wiki.txpt.org)

© ITxPT 2021  
All rights reserved.

# Concepts and Terminology

## ITxPT Data Dictionary Concepts

Concepts from the ITxPT Data Dictionary is referred by UPPER CASE, when
the concept definition is important.

The following Concepts from the ITxPT Data Dictionary are used.

**COMPOUND TRAIN** - A VEHICLE TYPE composed of a sequence of more than
one vehicles of the type TRAIN.

**TRAIN** - A VEHICLE TYPE composed of TRAIN ELEMENTs in a certain
order, i.e. of wagons assembled together and propelled by a locomotive
or one of the wagons.

**TRAIN ELEMENT** - An elementary component of a TRAIN (e.g. wagon,
locomotive).

## Other Terminology

In addition the following terminology is used in the specification.

**APC:** Automatic Passenger Counting

**APC Aggregator:** A component/module/process/etc that generates APC
data based on inputs.

# APC-II Solution description

## Relation to ITxPT S02P07 APC Specification

The specification is broadly similar to S02P07, and in some aspects
*very* similar. However it also changes a number of things: - Modified
data structures to support Heavy Rail - Changed data format to JSON -
Changed Transport to MQTT

As such the old specification have been kept as a Legacy specification
to support existing equipment and consumers, and this specification has
been introduced as a new specification, APC-II

## Purpose of APC

Put some purpose here

## High Level solution

The APC specification specifies a few different things: - The
information from Entrance (Door) Sensors - The information aggregated
from Sensors (of any type) for PASSENGER SPACES - How to express how
Entrances relates to Spaces, and Spaces to other Spaces.

The specification specifies the Data being exchanged, not where or how
the Data is being processed or generated. In particular it does not
contain any requirements on what is done onboard and what is done in the
back office.

![Image Caption](highlevel.svg)

Above is a “traditional” setup using door sensors on the vehicle doors,
and similar sensors between carriages. For the defined PASSENGER SPACES,
in this case the entire Vehicle and the three Carriages, the Occupancy
and Entries/Exits are calculated.

This specification does not constrain what sources/data are used for
calculating the Data. A solution that uses Entrance Sensors for the
Vehicle Doors, and Video analysis for tracking internal movement between
Spaces is one possibility. Another would be Video analysis supported by
Axle load sensors, as shown below:

![Image Caption](highlevel_video-axle.svg)

Many other configurations are possible.

## What is not standardized

Currently the specification only standardizes the data from Entrance
(Door) sensors, not e.g. Axel Load sensors. And it does not standardize
any reports, e.g. Entry/exit per STOP PLACE.

## PASSENGER SPACES

PASSENGER SPACES will be described more formally below. But as it the
major addition compared to the S02P07 APC Specification, and the key
concept to support Heavy Rail Requirements, a bit of less formal
explanation is added here to aid the readability of the specification.

The simplest configuration is a Vehicle with one Space for the entire
vehicle, and one or more Entrances:

![Spaces - Simple Vehicle](spaces_bus.svg)

For a more complicated configuration there is still the Space for the
entire Vehicle, but there are also Spaces for parts of the Vehicle:

![Spaces - Bilevel Vehicle](spaces_ddbus.svg) In this Double Deck Bus,
APC data can be reported for the entire Vehicle (Space: Vehicle), but
also for the upper floor (Space: Upper floor) and the lower floor
(Space: Lower floor).

There is no limit in the specification how Spaces are nested, or how
many nested spaces there is.

![Spaces - Complex Vehicle](spaces_emu.svg)

In this three carriage EMU there is a Space for the entire Vehicle, one
Space for each of the three Carriages, and then one of the Carriages is
further divided in a 1st-Class Space and an Economy-Class Space. Here
are also the Entrances marked, both the external entrances (red,
into/out of the Vehicle) and the internal entrances (blue, between
Spaces).

And it does not stop there. The way this specification supports seat
occupancy reporting is by defining a Space for each seat, and reporting
the Occupancy on that.

# Conceptual Data Model

![Conceptual Data Model](Conceptual-data-model.svg)

PASSENGER SPACEs, PASSENGER SPACE CAPACITY and PASSENGER ENTRANCE are
all statically configured (they will not change during operation).

> ***NOTE:*** I added some additional text below, but it is mostly
> restating what is in the Concept Definitions, so I think it should be
> deleted.

A PASSENGER SPACE can both be part of another PASSENGER SPACE and
contain other PASSENGER SPACES.

A PASSENGER SPACE must have at least one PASSENGER ENTRANCE. If it
didn’t no one could enter it!

A PASSENGER ENTRANCE COUNT is the number of PASSENGERS (and other
objects) that have passed through the Entrance for some defined
duration.

A PASSENGER SPACE OCCUPANCY COUNT is the number of PASSENGERS (and other
objects) that are present in the PASSENGER SPACE at some defined point
in time.

A PASSENGER SPACE ENTRANCE COUNT is the number of PASSENGERS (and other
objects) that have entered and exited a PASSENGER SPACE.

# Detailed Data Model

The Conceptual Data Model above shows how the defined Concepts relates
to each other. But it does not provide enough details to be the basis of
a transmission format.

To do that additional details are provided.

![Detailed Data Model](detailed-data-model.svg)

A number of things have changed. Relationships between different objects
are now set by spaceId and entranceId.

PASSENGER ENTRANCE is not present as a separate class, as it did not
carry any information that needed stand-alone representation.

A SensorEntranceMapping class have been introduced. This allows the
sensors to not know their entranceId, as long as another actor supplies
that.

## Uniqueness of IDs

There is no namespaces for Space, Entrance and Sensor IDs. All IDs must
be unique within the Vehicle it is used.

It is *strongly* recommended that all sensor IDs be globally unique, so
that one sensor can never be mistaken for another.

The uniqueness of entrance and sensor IDs is not a problem for Vehicles
that are fixed, e.g. a bus. In these Vehicles entrance IDs can be be
“door1” and “door2”, space IDs “forward”, “middle”, and “rear” or
something else simple.

But in a Vehicle made up of potentially interchangeable elements,
typically a TRAIN made up of TRAIN ELEMENTS, it needs to be ensured that
entrance and space IDs are unique regardless of which TRAIN ELEMENTS
make up the the TRAIN.

It must either be ensured that the IDs are unique for all the possible
combinations of TRAIN ELEMENTS, *or* each TRAIN must set (new) unique
entrance and space IDs each time the makeup of the TRAIN changes.

## Entrances

One Entrance may belong to multiple Spaces. E.g. an external entrance,
Door7, may belong to the Vehicle Space, to the Carriage1 Space, and to
the Carriage1-SilentCompartment Space. When one passenger enters through
Door7 this is only one new passenger in the Vehicle, one new passenger
in Carriage1 and one new passenger in Carriage1-SilentCompartment.

### External entrances

An entrance of type EXTERNAL by definition leads into/out-of the
Vehicle. Because of this the Vehicle Space does not *need to* contain
any external entrances. Instead these can be found by looking that the
Spaces that the Vehicle Space contains. E.g. for a three car train, the
Vehicle Space may have an empty entrances list, while the external doors
found in the car1, car2 and car3 Spaces’ entrance lists.

## Relations of Spaces

Each Space that is not a Vehicle Space will be next to one or more other
spaces. Currently Spaces have no direct relations to each other. Which
spaces connects to which other spaces must be determined by looking at
the entrances each space have. Two spaces that contain the same entrance
connect to each other.

If the entrances are ALIGNED, then on entry a PASSENGER will be present
in both Spaces. If the entrances are REVERSED, then a PASSENGER will
enter one Space while exiting the others.

> ***NOTE:*** While not rocket science, the potential structure of
> Spaces could grow fairly complex. In ITxPT Labelling should we have
> different levels of supported complexity?

### Entrance-Entrance Mappings

In cases where two spaces are next to each other, but *don’t* have the
same entrance ID on what is the passage between them, this is resolved
by and Entrance-Entrance Mapping. This will then be used to determine
that e.g. the entrance “car123-rear” for space “car123” is now connected
to the entrance “car345-front” for space “car345”. Now a car123-rear
exit will be a car345-front entry, and vice versa.

A mapped entrance could have one Entrance Sensor, so that a PASSENGER
ENTRANCE COUNT will be generated with one of the entrance IDs, but not
the other. Or there could be a sensor for each of them, so that for each
PASSENGER entry/exit there will be a PASSENGER ENTRANCE COUNT generated
with each of the entrance IDs. The APC Aggregator needs to account for
this, and handle both possibilities.

> ***NOTE:*** This concept seemed great on paper. But thinking about the
> implementation it may be surprisingly complex to handle that there
> could be one or two sensors without knowing which is the case. Should
> we add to EntranceRef if the Entrance have a Entrance Sensor or not?

## No Spaces defined

If there are NO Spaces defined for a Vehicle, it shall be assumed that
it is a single Space Vehicle. All PASSENGER ENTRANCE COUNT data items
should be assumed to be EXTERNAL and PASSENGER SPACE OCCUPANCY COUNT,
PASSENGER SPACE ENTRANCE COUNT, etc generated accordingly.

Since a single Space is assumed, both sensor ID and entrance ID shall be
accepted as identification of a PASSENGER ENTRANCE COUNT data item,
without a need for a SensorEntranceMapping.

> ***NOTE:*** This is added to simplify the single-space vehicle/bus
> case, which does not gain anything by having a Space defined(?) OTOH
> defining a Space is not hard, and removes this special case. Lets
> discuss.

# Data Format JSON

The Data Format for APC-II is JSON. As this is a Data Centric
specification more formats could be added in future, but no such needs
have been identified for now.

The Data Format JSON section is organized in two sections. First is the
static data that provides the information about how the Vehicle is
“organized”, and then is the data that contains the Passenger Counts
themselves.

For brevity the JSON schemas are not included in this document, but can
be found on the ITxPT github. For APC-II the schemas are regarded as
part of the specification with no distinction in priority. If a conflict
or contradiction is found between the schemas and this document an issue
should be raised with ITxPT, which will resolve the problem with a
minimum impact.

## APC Static Data

Static Data describes how the Vehicle is configured. It should change
only when the vehicle is reconfigured, which should be never for many
Vehicles and seldom for the others. In particular the static data will
not change during operation. The exception to this could be COMPOUND
TRAINs, but even there each TRAIN would stay fixed.

### SensorId to entranceId mapping

For Entrance Sensors that identify with the sensorId, a mapping of the
sensorId to entranceId must be provided.

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/sensorId-entranceId-mapping.json",
    "sensorId": "AcmeCo-23456789",
    "entranceId": "car2397-door7"
}
```

This is used by the APC Aggregator to know that a PASSENGER ENTRANCE
COUNT data item with a sensorId belongs to specific entranceId. While
this could be posted by anyone, the use case is that sensors don’t (need
to) know where they are in the Vehicle, but this is known to some other
onboard or back office system.

### PASSENGER SPACE CAPACITY

This is the number of Objects that the Vehicle can accommodate at 100%
utilization.

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/PASSENGER-SPACE-CAPACITY.json",
    "spaceId": "Vehicle",
    "objectCount": "<see objectCount def>"
}
```

> ***SPEC QUESTION:*** Is this always in number of Adults, and then any
> Capacity calculation will need to account for the fact that one wheel
> chair or pram takes up more space than one Adult? If it always in
> Adults, perhaps having an `adults` property would be better than
> having a full objectCount structure. Or is it always the max number of
> things? If so a priority needs to be established, because while a
> Space could fit 3 wheelchairs or 4 prams, it cannot fit 3 wheelchairs
> *and* 4 prams. Perhaps wheelchairs are a bit of a special case, so
> perhaps this should be “number of wheelchair spaces and number of
> adults when wheelchair spaces are occupied”?

### PASSENGER SPACE

The space structures is what APC count structures can be reported on.

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/PASSENGER-SPACE.json",
    // spaceId must be unique in the Vehicle
    "spaceId": "VIN1234567HG",
    // spaceType not a strict enum as custom values are allowed
    "spaceType": "VEHICLE",
    "entrances": [
        {"entranceId": "door1", "entranceType": "EXTERNAL", "direction": "ALIGNED"},
        {"entranceId": "door2", "entranceType": "EXTERNAL", "direction": "ALIGNED"}
    ],
    // Usually one of isPartOfSpaces and containsSpaces are used, not both
    "isPartOfSpaces": [],
    "containsSpaces": ["forward", "mid-door-area", "rear"]
}
```

Above is a Vehicle Space with three sub-spaces with two of these
sub-spaces below

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/PASSENGER-SPACE.json",
    // spaceId must be unique in the Vehicle
    "spaceId": "mid-door-area",
    // spaceType not a strict enum as custom values are allowed
    "spaceType": "wheelchair-standing-area",
    "entrances": [
        {"entranceId": "door2", 
            "entranceType": "EXTERNAL", "direction": "ALIGNED"},
        {"entranceId": "endForwardSeating", 
            "entranceType": "INTERNAL", "direction": "REVERSED"},
        {"entranceId": "startRearSeating", 
            "entranceType": "INTERNAL", "direction": "REVERSED"}
    ],
    "isPartOfSpaces": [],
    "containsSpaces": []
}
```

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/PASSENGER-SPACE.json",
    // spaceId must be unique in the Vehicle
    "spaceId": "rear-area",
    // spaceType not a strict enum as custom values are allowed
    "spaceType": "seating-area",
    "entrances": [
        {"entranceId": "startRearSeating", 
            "entranceType": "INTERNAL", "direction": "ALIGED"}
    ],
    "isPartOfSpaces": [],
    "containsSpaces": []
}
```

The two spaces are linked by both having the “startRearSeating”
entrance.

#### PASSENGER SPACE - spaceType

> ***SPEC QUESTION:*** It is possible standard spaceTypes should be in
> the Detailed Data Model rather than the JSON section. This comments
> equally applies to other enums and some other spec-text found in Data
> Format JSON section.

The intention with spaceType is to make data more readable, but also to
allow processes that process output from the APC Aggregator to recognize
a few common Space types, and generate reports (or other output) on
those without understanding the specific naming of Spaces in all
Vehicles.

ÏTxPT standardized names are UPPER CASE, while other names should be
lower case, avoiding conflict between non-standard names and future
additional standard additions.

**Standardized vehicleTypes**

`COMPOUND_TRAIN` - A space made up of several `TRAINS`/`VEHICLES`

`VEHICLE` - A Space capable of independent movement. Expectation is that
passengers can move between any Spaces that make up the `VEHICLE`.

`TRAIN_ELEMENT` - A car/carriage that makes up part of `VEHICLE`

`UPPER_LEVEL` - Upper level of a bi-level `VEHICLE`/`TRAIN_ELEMENT`

`LOWER_LEVEL` - Lower level of a bi-level `VEHICLE`/`TRAIN_ELEMENT`

`STAIRCASE` - A staircase between different levels.

`WHEELCHAIR` - An area with one or more wheelchair spaces.

`SEAT` - A seat for a single `PASSENGER`

`BENCH_SEAT` - A longer seat that may fit two or more PASSENGERs.

> ***SPEC QUESTION:*** More of these we should have? The standard don’t
> require any action so relatively harmless to add more types I would
> think.

### ENTRANCE FOR PASSENGER SPACE

The entrance list of a Space consists of ENTRANCE FOR PASSENGER SPACE
objects. Each object is made up of

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/ENTRANCE-FOR-PASSENGER-SPACE.json",
    // entranceId must be unique in the Vehicle
    "entranceId": "door2",
    "entranceType": "EXTERNAL", 
    "direction": "ALIGNED"
}
```

-   entranceId must be unique in the Vehicle
-   entranceType must be either “EXTERNAL” or “INTERNAL”
-   direction must be either “ALIGNED” or “REVERSED”

“ALIGNED” is used when any associated entrance sensor has entry/exit
events of the same direction. “REVERSED” is used when entry/exit events
are opposite, and an entry event for the entrance (sensor) is a exit
event for the Space. If there is no associated sensor the value shall be
null.

### Entrance Mapping

Entrance Mapping is used when two entrances are next to each other or
overlapping, and this makes two entrances work as one entrance. A
typical use case would be two TRAIN ELEMENTS pared up so the entrance on
the rear of the first carriage is the entrance at the front of the
second.

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/entranceId-mapping.json",
    "entranceId1": "car1287-rearEntrance",
    "entranceId2": "car2397-frontEntrance"
}
```

“ALIGNED” is used when an entry/exit is the same event for both
entrances. “REVERSED” is used when an entry event for one is an exit
event for the other.

## APC Counting Data

Counting data is the data that are actually wanted! These data items
contains the information about entry/exit and occupancy of
vehicles/spaces.

### Time synchronization

APC Counting Data contains timestamps, and data analysis relies on the
timestamps of different Providers to be in sync. Producers of APC
Counting Data shall ensure that the timestamp is based on a synchronized
UTC time. Onboard this means using the onboard SNTP service according to
ITxPT S02P02 specification.

> ***SPEC QUESTION:*** Perhaps not the best fit for the “Data format
> JSON” section. Perhaps have an “Other requirements” section between
> “Detailed Data Model” and “Data format JSON”?

### APC objectCount structure

The objectCount structure is used in several structures to count objects
that enters, exits or are present in vehicles.

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/apc-object-count.json",
    "adults": {"count": 21},
    "children": {"count": 4},
    "wheelchairs": {"count": 0},
    "prams": {"count": 1},
    "bikes": {"count": 0},
    "luggage": {"count": 1, 
        "composition": {
            "xs": {"count": 0},
            "small": {"count": 1},
            "medium": {"count": 0},
            "large": {"count": 1},
            "xl": {"count": 0}
        }
    },
    "others": {"count": 3, 
        "ext_custom": {"flatpack_furniture": {"count": 1}}
    }
}
```

In example above `"ext_customer": {"flatpack_furniture": {"count": 1}}`
is a custom extension.

The object count is reported on several defined object types.

> ***SPEC QUESTION:*** Object types here only a proposal. Also we need
> to think about sensors / detection methods that support a subset of
> defined types. Are all of these mandatory to be ITxPT compliant? Are
> any?

> ***SPEC QUESTION:*** There are multiple object types, which cannot
> cleanly be translated between each other. 1 adult != 1 child; 1
> wheelchair != 1 adult; etc. Should there be some toplevel “passenger =
> float-nbr” or “adultEquiv = float-nbr” that is a estimate how many
> adult-equivalents the total sum makes up? Perhaps also as part of each
> type?

Each object type has a structure containing a “count” property with the
number of items counted. This can be further broken down into
standardized subtypes via the “composition” property, with subtypes
having a “count” property of their own. Custom

The defined types are:

-   `adults` - A passenger that is not a child
-   `children` - Usually delimited from adults by a height threshold
-   `wheelchairs` - TBD
-   `prams` - TBD
-   `bikes` - A bike. This includes all types of bikes, including
    motorbikes (when applicable). Defined subtypes:
    -   `small` - e.g. kick bikes and children’s bikes. May not be
        included in “count”.
    -   `standard` - a standard bike of some sort
    -   `wide` - normal in length, but wider. E.g. three wheel bikes,
        scooter.
    -   `long` - normal in width, but longer. E.g. a tandem cycle.
    -   `wideAndLong` - wider and longer than `standard`. E.g. a cargo
        bike.
-   `luggage` - Any carried luggage, including suite cases, backpacks,
    bags, shopping bags, etc. Only luggages `medium` or larger should be
    counted towards the “count”. Defined subtypes with *examples*:
    -   `xs` - A handbag, shopping bag, small backpack. Less than 15-20
        litres.
    -   `small` - A small suitcase, large shopping bag, normal gym bag
        25 - 50 litres.
    -   `medium` - A “normal” sized suitcase or similar. 50 - 75 litres.
    -   `large` - A larger suite case, backpack, etc. 75 - 100 litres.
    -   `xl` - Above 100 litres.
-   `others` - Anything that does not fit into the categories, or is
    defeats categorization.

> ***SPEC QUESTION:*** Should we have sized-based subtypes for `others`?
> Like `small` - half adult sized, `medium` - adult sized, `large` -
> double adult sized, `xl` - multiple adults, `xxl` - more than one
> square meters

### PASSENGER ENTRANCE COUNT

Number of entries/exits through a specific Entrance, for a specified
*period* in time. Note that counts are cumulative since tsCountStart; to
get the entries/exits for a smaller period, e.g. during a stop, the
‘before-value’ must be subtracted from the ‘after-value’. The use of
cumulative counts means that the correct entries/exits of an entrance
can be calculated even if some messages are lost.

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/PASSENGER-ENTRANCE-COUNT.json",
    "entranceId": "door2",
    "entered": "<objectCount>",
    "exited": "<objectCount>",
    "trigger": "DOORCLOSE",
    "tsNow": "2021-06-09T07:33:04",
    "tsCountStart": "2021-06-09T05:42:38"
    // Do we also want a msgSeqNbr ? 
}
```

entered and exited are cumulative counts. Once the Vehicle/Space goes
empty -> occupied -> empty, the entered and exited count should - with
perfect detection - be the same.

### Passenger Count Triggers

An updated Passenger Count (any type) is produced for a reason. As part
of the updated count, the reason for produced the update (at that
moment) is provided, as a hint to analysis. While a trigger value is
required, other values than those defined are allowed; trigger values
that are not understood should be skipped by the analysis function,
while still processing the count data.

By convention standardized triggers are UPPER CASE. Non-standard values
should be lower case to not interfere with future standardization.

`DOORCLOSE` - produced by (after processing) a door close event.

`THRESHOLD` - produced after reaching some configured threshold, e.g. 10
entries+exits.

`PERIODIC` - produced because a time period has elapsed since last
produced.

`COUNTADJUST` - the count has been adjusted, by a non-apc event. E.g.
the driver has indicated the Vehicle is empty.

`PROVIDERRESET` - The Provider has reset (intentionally or
unintentionally) and start from “zero”.

> ***SPEC QUESTION:*** Should there be `DOOROPEN` trigger? While not
> useful for the counting as such, it could be useful for analysis of
> how long doors were open without pulling in further data.

> ***SPEC QUESTION:*** Should there be `ALLDOORCLOSE` trigger? Could be
> more descriptive for the SPACE COUNTS than `DOORCLOSE` that does not
> say which if doors close at different times.

> ***SPEC QUESTION:*** Are any of these TRIGGERS mandatory for ITxPT
> label? If yes, which?

### PASSENGER SPACE OCCUPANCY COUNT

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/PASSENGER-SPACE-OCCUPANCY-COUNT.json",
    "spaceId": "VIN1234566HJ",
    "occupancy": "<objectCount>",
    "trigger": "PERIODIC",
    "timestamp": "2021-06-09T07:33:48"
    // Do we also want a msgSeqNbr ? 
}
```

Property “trigger” according to Passenger Count Triggers above.

“timestamp” is the time the Count was produced, or if production is not
real-time the timestamp of the newest input data to the production.

> ***SPEC QUESTION:*** For some methods like weight-based sensors it
> would be difficult to TBD

> ***SPEC QUESTION:*** If PSOC is based on entrance sensors, then if
> they are registering more people in one direction than the other, then
> over a full day, this could mean the occupancy has little connection
> to reality. This standard should probably recommend that OCCUPANCY
> COUNT is reset when the Vehicle/Space is (presumed) empty, but should
> the mechanism for signaling such a reset be part of the spec?

### PASSENGER SPACE ENTRANCE COUNT

Number of entries/exits through all entrances of a space. Has a spaceId
instead of a sensorId/entranceId. Apart from that identical to PASSENGER
SPACE ENTRANCE COUNT

``` json
{
    "$schema": "https://github.com/ITxPT/<something>/PASSENGER-ENTRANCE-COUNT.json",
    "spaceId": "car3",
    "entered": "<objectCount>",
    "exited": "<objectCount>",
    "trigger": "DOORCLOSE",
    "tsNow": "2021-06-09T22:33:30",
    "tsCountStart": "2021-06-09T05:42:38"
    // Do we also want a msgSeqNbr ? 
}
```

# Transport MQTT using JSON format

The APC-II specification uses MQTT to transport messages with Format
JSON. As this is a Data Centric specification more combinations of
formats and transport could be added in the future, but no such needs
have been identified for now.

## General Requirements

All MQTT Providers specified in this specification and Consumers using
this data shall follow the requirements for MQTT Clients in S02P00
(Info: this only exists as internal draft)

## Security Considerations

The potential security impact of APC are low. Disrupted or incorrect APC
data are unlikely to lead to any safety concerns or serious operational
problems.

## Performance Considerations

For a simple vehicle there is unlikely to be more than half a dozen
entrance sensors, sending a few messages per minute. Including an
onboard APC aggregator, there should still be less than one message per
second. A more complex vehicle like a bi-level EMU *may* have multiple
messages per second in total, but this should have a negligible impact
on performance.

Performance impact of APC is low.

## Functional Group and Provider Names

APC has its own functional Group `apc`. (To Be Confirmed!)

APC has three types of providers:

`entrancesensor` - information about entry/exit for an entrance

`aggregator` - Provider(s) that outputs one or more of the APC counts
for Spaces

`vehicledefine` - Information about how Spaces and Entrances are
organized.

## MQTT APC Topic tree

![MQTT Topic Tree](apc-topic-tree.svg)

`<ProviderName>`s in bold above.

## `entrancecounts` Providers

The `entrancecounts` Provider(s) are *not* required to be a physical
sensors at each entrance. E.g. in a video based system the “video
analysis engine” could provide both `PASSENGER ENTRANCE COUNT` and
`PASSENGER SPACE OCCUPANCY COUNT` data.

### Inventory

In addition to what is required by Inventory MQTT (which is TBD) the
provider shall **TBD**. (But probably something about how it is
configured at least.)

## `spacecounts` Providers

### Inventory

In addition to what is required by Inventory MQTT (which is TBD) the
provider shall **TBD**. (But probably something about how it is
configured at least.)

## `vehicledefine` Providers

There may be multiple `vehicledefine` Providers, but if they publish
contradictory information the result is undefined.

The `[spaceId]`, `[sensorId-entranceId]` and
`[entranceId1-enctranceId2]` part of the topics exists to separate data
items of the same type and shall not be used. Subscribes shall be to
`..apc/vehicledefine/*/spacedefines/*/*`,
`..apc/vehicledefine/*/sensorentrancemapping/*/*` and
`..apc/vehicledefine/*/entranceentrancemapping/*/*`.

### Inventory

In addition to what is required by Inventory MQTT (which is TBD) the
provider shall **TBD**. (But probably something about how it is
configured at least.)
