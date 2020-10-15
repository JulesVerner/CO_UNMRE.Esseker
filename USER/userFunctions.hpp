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
		class wasserEffect {};
	};

	class Airfield {
		file = "USER\functions\Airfield";
		class startExfil {};
	};	
};

class GRAD_introCam {
	tag = "grad_introcam";

    class client {
            file = "USER\functions\intro\functions\client";

            class camAttached;
            class camCommands;
            class camFree;
            class camRotate;
            class clientInit { preInit = 1; };
            class play;
            class start;
            class textEffects;
            class waterFX;
    };

    class server {
            file = "USER\functions\intro\functions\server";

            class addShot;
            class init { postInit = 1; };
            class shotDefinitions;
    };
};


class GRAD_zeusModules {
	tag = "grad_zeus";

	class zeusModules {
		file = "USER\functions\zeusModules";
		class addZeusModules { postinit = 1 };
		class monitorEffects {};
	};
}