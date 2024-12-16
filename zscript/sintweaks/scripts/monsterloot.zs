
Class SinTweaksMonsterLootHandler : EventHandler{
	Override void WorldThingDied(WorldEvent e){
		If(!e.Thing) return;
		If(!cvar.GetCVar("sintweaks_monsterloot").getbool()) return;
		DoThingDie(e.Thing);
	}
	void DoThingDie(Actor mo){
		bool isMonster = mo.bIsMonster;
		If(isMonster){
			//mo.A_SpawnItem("HealthBonus",1);
			//mo.A_SpawnItem("ArmorBonus",1);
			Vector3 offset = (cos(mo.angle)*32,sin(mo.angle)*32,0);
			If(!random(0,3)){
				If(!random(0,3)){mo.Spawn("HealthBonus",mo.pos+offset,true);}
				Else{mo.Spawn("ArmorBonus",mo.pos-offset,true);}
			}
		}
	}
}
