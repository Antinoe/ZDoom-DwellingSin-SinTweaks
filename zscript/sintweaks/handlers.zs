
Class SinTweaksEventHandler : EventHandler{
	Override void WorldThingSpawned(WorldEvent e){
		If(e.Thing is "SinItem"){
			let item = SinItem(e.Thing);
			//If(cvar.GetCVar('sintweaks_rocketlauncher').getbool() && item is "SinRocketLauncher2"){
			If(item is "SinRocketLauncher2"){
				Vector3 offset = (cos(e.Thing.angle)*-32,sin(e.Thing.angle)*-32,0);
				e.Thing.Spawn("SinRocketBox",e.Thing.pos+offset);
				e.Thing.Spawn("SinRocketBox",e.Thing.pos-offset);
			}
			If(cvar.GetCVar('sintweaks_vanillaweapons').getbool() && item is "SinChaingun"){
				Vector3 offset = (cos(e.Thing.angle)*-32,sin(e.Thing.angle)*-32,0);
				e.Thing.Spawn("SinRocketLauncher2",e.Thing.pos+offset);
			}
			/*If(cvar.GetCVar('sintweaks_vanillaweapons').getbool() && item is "SinSMG"){
				Vector3 offset = (cos(e.Thing.angle)*-32,sin(e.Thing.angle)*-32,0);
				e.Thing.Spawn("SinChaingun",e.Thing.pos+offset);
			}*/
		}
	}
	//	Took this blueprint from Nashgore: Vengeance Edition.
	Override void WorldThingDied(WorldEvent e)
	{
		If (!e.Thing) return;
		DoThingDie(e.Thing);
	}
	void DoThingDie(Actor mo)
	{
		bool isMonster = mo.bIsMonster;
		If (isMonster)
		{
			Vector3 offset = (cos(mo.angle)*32,sin(mo.angle)*32,0);
			If(!random(0,3)){mo.Spawn("HealthBonus",mo.pos+offset,true);}
			If(!random(0,3)){mo.Spawn("ArmorBonus",mo.pos-offset,true);}
			If(!random(0,3)){mo.Spawn("Clip",mo.pos-offset,true);}
			If(!random(0,3)){mo.Spawn("Shell",mo.pos-offset,true);}
		}
	}
	Override void CheckReplacement(ReplaceEvent e){
		//
		//	General
		//
		If(e.Replacee is "Clip"){
			if(cvar.GetCVar('sintweaks_replaceammo').getbool())
				e.Replacement="HealthBonus";
		}
		If(e.Replacee is "Shell"){
			if(cvar.GetCVar('sintweaks_replaceammo').getbool())
				e.Replacement="ArmorBonus";
		}
		//
		//	Health
		//
		If(e.Replacee is "HealthBonus"){
			if(cvar.GetCVar('sintweaks_bluepotion').getbool()&&!random(0,3))
				e.Replacement="SinPotionBlue";
		}
		If(e.Replacee is "Stimpack"){
			if(cvar.GetCVar('sintweaks_bluepotion').getbool()&&!random(0,3))
				e.Replacement="SinPotionBlue";
		}
		If(e.Replacee is "Medikit"){
			if(cvar.GetCVar('sintweaks_bluepotion').getbool()&&!random(0,3))
				e.Replacement="SinPotionBlue";
		}
		If(e.Replacee is "Berserk"){
			if(cvar.GetCVar('sintweaks_berserk').getbool())
				e.Replacement="SinBerserk2";
		}
		If(e.Replacee is "BFG9000"){
			if(cvar.GetCVar('sintweaks_totem').getbool()&&!random(0,3))
				e.Replacement="SinTotem";
		}

		//
		//	Armor
		//
		If(e.Replacee is "GreenArmor"){
			if(cvar.GetCVar('sintweaks_armor').getbool())
				e.Replacement="SinGreenArmor2";
		}
		If(e.Replacee is "BlueArmor"){
			if(cvar.GetCVar('sintweaks_armor').getbool())
				e.Replacement="SinBlueArmor2";
		}

		//
		//	Weapons
		//
		If(e.Replacee is "SinRocketLauncher"){
			if(cvar.GetCVar('sintweaks_rocketlauncher').getbool())
				e.Replacement="SinRocketLauncher2";
		}

		//
		//	Ammo
		//
		If(e.Replacee is "Clip"){
			if(cvar.GetCVar('sintweaks_lesslethal').getbool()&&!random(0,3))
				e.Replacement="SinPistolAmmoRubber";
		}
		If(e.Replacee is "ClipBox"){
			if(cvar.GetCVar('sintweaks_lesslethal').getbool()&&!random(0,3))
				e.Replacement="SinPistolAmmoRubber";
		}
		If(e.Replacee is "Shell"){
			if(cvar.GetCVar('sintweaks_lesslethal').getbool()&&!random(0,3))
				e.Replacement="SinShellBeanBag";
		}
		If(e.Replacee is "Shell"){
			if(cvar.GetCVar('sintweaks_incendiary').getbool()&&!random(0,3))
				e.Replacement="SinShellIncendiary";
		}
		If(e.Replacee is "SinPistolAmmoNormal"){
			if(cvar.GetCVar('sintweaks_nolooseammo').getbool())
				e.Replacement="SinPistolBox";
		}
		If(e.Replacee is "SinShellBuckshot"){
			if(cvar.GetCVar('sintweaks_nolooseammo').getbool())
				e.Replacement="SinShellBox";
		}
		If(e.Replacee is "SinShellBirdshot"){
			if(cvar.GetCVar('sintweaks_nolooseammo').getbool())
				e.Replacement="SinShellBox";
		}
		If(e.Replacee is "SinShellSlug"){
			if(cvar.GetCVar('sintweaks_nolooseammo').getbool())
				e.Replacement="SinShellBox";
		}
		If(e.Replacee is "SinRifleAmmoNormal"){
			if(cvar.GetCVar('sintweaks_nolooseammo').getbool())
				e.Replacement="SinRifleBox";
		}
		If(e.Replacee is "SinPistolAmmoNormal"){
			if(cvar.GetCVar('sintweaks_onlypowerrounds').getbool())
				e.Replacement="SinPistolAmmoPower";
		}


		//	Brutal Damage Types
		//	Thanks for this class checking method, Agent Ash.
		if (cvar.GetCVar('sintweaks_brutaldamage').getbool() && e.Replacee == "Rocket"){
			name clsname = "Rocket2";
			Class<Actor> cls = clsname;
			if (cls)
			{
				e.Replacement = cls;
			}
		}
		if (cvar.GetCVar('sintweaks_brutaldamage').getbool() && e.Replacee == "SinRocket"){
			name clsname = "NuclearRocket";
			Class<Actor> cls = clsname;
			if (cls)
			{
				e.Replacement = cls;
			}
		}
		If(e.Replacee is "SinPistolPuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinPistolPuff2";
		}
		If(e.Replacee is "SinBuckshotPuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinBuckshotPuff2";
		}
		If(e.Replacee is "SinBirdshotPuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinBirdshotPuff2";
		}
		If(e.Replacee is "SinBirdshotPuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinBirdshotPuff2";
		}
		If(e.Replacee is "SinSlugPuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinSlugPuff2";
		}
		If(e.Replacee is "SinRiflePuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinRiflePuff2";
		}
		If(e.Replacee is "SinAncientPuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinAncientPuff2";
		}
		If(e.Replacee is "SinPlasmaPuff"){
			if(cvar.GetCVar('sintweaks_brutaldamage').getbool())
				e.Replacement="SinPlasmaPuff2";
		}

		//	Stacking
		If(e.Replacee is "SinPotionGreen"){
			if(cvar.GetCVar('sintweaks_stackhealth').getbool())
				e.Replacement="SinPotionGreen2";
		}
		If(e.Replacee is "SinPotionRed"){
			if(cvar.GetCVar('sintweaks_stackhealth').getbool())
				e.Replacement="SinPotionRed2";
		}
		If(e.Replacee is "SinPotionBlue"){
			if(cvar.GetCVar('sintweaks_stackhealth').getbool())
				e.Replacement="SinPotionBlue2";
		}
		If(e.Replacee is "SinStimpack"){
			if(cvar.GetCVar('sintweaks_stackhealth').getbool())
				e.Replacement="SinStimpack2";
		}
		If(e.Replacee is "SinMedikit"){
			if(cvar.GetCVar('sintweaks_stackhealth').getbool())
				e.Replacement="SinMedikit2";
		}
	}
}

//	Thanks for this, Jarewill.
Class SinTweaksLoadoutReplacementHandler : EventHandler{
	Override void PlayerEntered(PlayerEvent e){
        let invman = SinInvManager(players[e.PlayerNumber].mo.FindInventory("SinInvManager"));
        If(!invman){Return;}
        For(let i=0; i<invman.items.Size(); i++){
            let item = SinItem(invman.items[i]);
			if(cvar.GetCVar('sintweaks_rocketlauncher').getbool()){
				If(item is "SinRocketLauncher"){SwapSinItems("SinRocketLauncher2",item,invman,i);}
			}
			if(cvar.GetCVar('sintweaks_stackhealth').getbool()){
				If(item is "SinMedikit"){SwapSinItems("SinMedikit2",item,invman,i);}
			}
			let armor = BasicArmor(players[e.PlayerNumber].mo.FindInventory("BasicArmor"));
			if(cvar.GetCVar('sintweaks_armor').getbool()){
				If(armor.ArmorType=="SinGreenArmor"){SwapSinArmor("SinGreenArmor2",armor);}
				If(armor.ArmorType=="SinBlueArmor"){SwapSinArmor("SinBlueArmor2",armor);}
			}
		}
    }
    void SwapSinItems(Class<SinItem> newitem, SinItem olditem, SinInvManager invman, int index){
        invman.items.Delete(index);
        If(olditem.big){invman.items.Delete(index);}
        olditem.Destroy();
        let item = SinItem(Actor.Spawn(newitem));
        item.PostBeginPlay();
        item.SinfulPickup(invman,index);
    }
    void SwapSinArmor(Class<SinArmor> newarmor, BasicArmor armor){
        let item = SinArmor(Actor.Spawn(newarmor));
        armor.SavePercent = Clamp(item.prot,0,100)/100;
        armor.Amount = item.Amount; armor.MaxAmount = item.Amount;
        armor.ActualSaveAmount = item.Amount;
        armor.icon = item.icon; armor.ArmorType = item.GetClassName();
        item.Destroy();
    }
}
