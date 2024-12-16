
Class SinTweaksGeneralHandler : EventHandler{
	Override void WorldThingSpawned(WorldEvent e){
		If(e.Thing is "SinItem"){
			let item = SinItem(e.Thing);
			//If(cvar.GetCVar('sintweaks_rocketlauncher').getbool() && item is "SinTweaksRocketLauncher"){
			If(item is "SinTweaksRocketLauncher"){
				Vector3 offset = (cos(e.Thing.angle)*-32,sin(e.Thing.angle)*-32,0);
				e.Thing.Spawn("SinRocketBox",e.Thing.pos+offset);
				e.Thing.Spawn("SinRocketBox",e.Thing.pos-offset);
			}
			If(cvar.GetCVar('sintweaks_vanillaweapons').getbool() && item is "SinChaingun"){
				Vector3 offset = (cos(e.Thing.angle)*-32,sin(e.Thing.angle)*-32,0);
				e.Thing.Spawn("SinTweaksRocketLauncher",e.Thing.pos+offset);
			}
			/*If(cvar.GetCVar('sintweaks_vanillaweapons').getbool() && item is "SinSMG"){
				Vector3 offset = (cos(e.Thing.angle)*-32,sin(e.Thing.angle)*-32,0);
				e.Thing.Spawn("SinChaingun",e.Thing.pos+offset);
			}*/
		}
	}
	//	Took this blueprint from Nashgore: Vengeance Edition.
	Override void WorldThingDied(WorldEvent e){
		If(!e.Thing) return;
		DoThingDie(e.Thing);
	}
	void DoThingDie(Actor mo){
		bool isMonster = mo.bIsMonster;
		If(isMonster){
			Vector3 offset = (cos(mo.angle)*32,sin(mo.angle)*32,0);
			If(!random(0,3)){
				If(!random(0,3)){mo.Spawn("HealthBonus",mo.pos+offset,true);}
				Else{mo.Spawn("ArmorBonus",mo.pos-offset,true);}
			}
		}
	}
}
