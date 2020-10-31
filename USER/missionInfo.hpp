/*
*   Legt allgemeine Information über die Mission fest.
*/

author = "Jules, nomisum & Salbei für Gruppe Adler";                            // Missionsersteller
onLoadName = "CO UNMRE";                                                   		// Name der Mission
onLoadMission = "";                                                             // Beschreibung der Mission (wird im Ladebildschirm unterhalb des Ladebildes angezeigt)
loadScreen = "data\loadpic.paa";                                                // Ladebild
overviewPicture = "";                                                           // Bild, das in der Missionsauswahl angezeigt wird
overviewText = "United Nations Mission in the Republic of Esseker";        // Text, der in der Missionsauswahl angezeigt wird


class CfgSFX
{
    class waterSplash
    {
        sound0[] = {"USER\sounds\falls.ogg", db+6, 1.0, 500, 1, 0, 0, 0};  // path to addon sound
        sounds[] = {sound0};
        empty[] = {};
    };

    class waterLeakBunker
    {
        sound0[] = {"USER\sounds\falls.ogg", db+6, 1.0, 20, 1, 0, 0, 0};  // path to addon sound
        sounds[] = {sound0};
        empty[] = {};
    };
};

class CfgVehicles
{
    class waterSplashSource // class name to be used with createSoundSource
    {
        sound = "waterSplash"; // reference to CfgSFX class
    };

    class waterLeakBunkerSource // class name to be used with createSoundSource
    {
        sound = "waterLeakBunker"; // reference to CfgSFX class
    };
};