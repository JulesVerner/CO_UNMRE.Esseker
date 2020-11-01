/*
*   Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/
#include "..\HS_spawner\cfgFunctions.hpp"

class GRAD_USER {
	tag = "grad_user";

	class localEffects {
		file = "USER\functions\localEffects";
		class twitching {};
		class floatingHead {};
		class hellfire {};
		class setVariable {};
		class skeletonRushing {};
		class headFountain {};
		class skinUnits {};
		class sparks {};
	};

	class Airfield {
		file = "USER\functions\Airfield";
		class startExfil {};
	};

	class PVMC {
		file = "USER\functions\pvmc";
		class cameras {};
        class radioDistortion { postInit = 1; };
        class specOpsInsertion;
		class waterFall {};
		class waterMgmt {};
		class waterRise {};
        class waterStart;
	};
};

class GRAD_introFX {
    tag = "grad_introFX";

    class intro {
        file = "USER\functions\intro\functions\client";
        class chairCircle;
        class createChairCircle;
        class selectChair;
        
        class waterFX {};
        class textEffects;
        class muteAndDark { preInit = 1;};
    };
};

class grad_outro {
    tag = "grad_outro";

    class outro {
        file = "USER\functions\outro";
        class fishRising;
        class playEffects;
        class serverOutro;
        
        class shotsOutro {};
        class treeRising;
    };
};

class GRAD_zeusModules {
	tag = "grad_zeus";

	class zeusModules {
		file = "USER\functions\zeusModules";
		class addZeusModules { postinit = 1; };
		class monitorEffects {};
	};
}
