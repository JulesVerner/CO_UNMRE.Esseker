class HS_spawner {

    class client {
        file = HS_spawner\functions\client;

        class addModules {postInit = 1;};
    };

  class server {
        file = HS_spawner\functions\server;

        class enemies_aceDamage;
        class enemies_attackHuman;
        class enemies_attackHumanOriginal;
        class enemies_engageTarget;
        class enemies_engageTargetOriginal;
        class enemies_feedOnTargetAny;
        class enemies_feedOnTargetOriginal;
        class enemies_findTargetLoopOriginal;
        class enemies_overwriteRZfunction {preInit = 1;};

        class equipWithGasMask;

        class loadoutLDF;
        class loadoutRussian;

        class playOrganMusic;
        class policeFeed;
        
        class spawnCivilians;
        class spawnCiviliansCrowd;
        class spawnClone;
        class spawnDemon;
        class spawnLDF;

        class spawnLightHouseFeed;
        class spawnListener {postInit = 1;};

        class spawnMapPlane;
        class spawnNuclearWasteTruck;

        class spawnPoliceCar;

        class spawnPriest;
        class spawnRussians;
        class spawnStreetBlock;
        class spawnTranslationBook;
    };
};