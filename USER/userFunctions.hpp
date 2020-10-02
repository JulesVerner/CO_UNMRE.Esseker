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
		class skeletonRushing {};
		// class particleEffectsTest {};
	};

	class Airfield {
		file = "USER\functions\Airfield";
		class startExfil {};
	};	
};


class GRAD_zeusModules {
	class zeusModules {
		file = "USER\functions\zeusModules";
		class addZeusModules { postinit = 1 };
	};
}