
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
		//	JAREWILL'S EXAMPLE
		/*
		If(invman.items.Size() > x){ //Only execute this code if the item exists
		let item = invman.items[x]; //Will get the pointer to the specified item, for example if x is 0, then it's the first item
		If(item is "SinWeapon"){ //Execute this code if the item is a weapon
		  If(invman.equipped == x){invman.equipped = -1;} //If the item is equipped, unequip it
		  Else{invman.equipped = x;} //Otherwise equip it
			}
		}
		*/
		//	REFERENCE ONLY
		/*
		If(e.Name=="Equip"){
			let item = SinItem(invman.items[e.Args[0]]);
			If(item is "SinWeapon"&&!playe.noswitch){
				If(invman.equipped!=-1){
					let prevweap = SinWeapon(invman.items[invman.equipped]);
					If(prevweap){prevweap.railmode=0; prevweap.HandleSprite();}
				}
				invman.equipped=e.Args[0];
				SinWeapon(item).OnEquip(playe,SinHands(playe.FindInventory("SinHands")));
			}
		}
		If(e.Name=="Unequip"){
			If(!playe.noswitch&&invman.equipped!=-1){
				let weap = SinWeapon(invman.items[invman.equipped]);
				If(weap){weap.railmode=0; weap.HandleSprite();}
				invman.equipped=-1;
				weap.OnUnequip(playe,SinHands(playe.FindInventory("SinHands")));
			}
		}
		*/
Class SinTweaksHotkeyHandler : EventHandler{
	Override bool InputProcess(InputEvent e){
		//	Might not need this For statement, nor the variables following it.
		For(int i=0; i<MAXPLAYERS; i++){
			If(!playeringame[i] || !players[i].mo){Continue;}
			let invman = SinInvManager(players[i].mo.FindInventory("SinInvManager"));
			If(!invman){Return 0;}
			let item = SinItem(invman.items[0]);
			If(e.Type != InputEvent.Type_KeyDown){Return 0;}
			If(bindings.GetBinding(e.KeyScan) ~== "slot 1"){
				EventHandler.SendNetworkEvent("Equip",0);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 2"){
				EventHandler.SendNetworkEvent("Equip",1);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 3"){
				EventHandler.SendNetworkEvent("Equip",2);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 4"){
				EventHandler.SendNetworkEvent("Equip",3);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 5"){
				EventHandler.SendNetworkEvent("Equip",4);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 6"){
				EventHandler.SendNetworkEvent("Equip",5);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 7"){
				EventHandler.SendNetworkEvent("Equip",6);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 8"){
				EventHandler.SendNetworkEvent("Equip",7);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 9"){
				EventHandler.SendNetworkEvent("Equip",8);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 0"){
				EventHandler.SendNetworkEvent("Equip",9);
				Return 1;
			}
		}
		Return Super.InputProcess(e);
	}
}
Class SinTweaksPropertyHandler : EventHandler{
	//	Maybe WorldThingSpawned() isn't required. Who knows. I'll keep it just in case.
	Override void WorldThingSpawned(WorldEvent e){
		If(e.Thing is "SinItem"){
			let item = SinItem(e.Thing);
			let armor = SinArmor(e.Thing);
			let ammo = SinAmmo(e.Thing);
			If(cvar.GetCVar('sintweaks_stackablehealth').getbool()){
				If(item is "SinPotionGreen"){item.stack=1;item.maxamount=4;}
				If(item is "SinPotionRed"){item.stack=1;item.maxamount=4;}
				If(item is "SinPotionBlue"){item.stack=1;item.maxamount=4;}
				If(item is "SinPotionYellow"){item.stack=1;item.maxamount=4;}
				If(item is "SinStimpack"){item.stack=1;item.maxamount=4;}
				If(item is "SinMedikit"){item.stack=1;item.maxamount=4;}
				If(item is "SinBerserk"){item.stack=1;item.maxamount=4;}
			}
			If(cvar.GetCVar('sintweaks_stackablegrenades').getbool()){
				If(item is "SinGrenade"){item.stack=1;item.maxamount=4;}
				If(item is "SinProxMine"){item.stack=1;item.maxamount=4;}
				If(item is "SinFlashbang"){item.stack=1;item.maxamount=4;}
				If(item is "SinAcidRipper"){item.stack=1;item.maxamount=4;}
			}
			If(cvar.GetCVar('sintweaks_armor').getbool()){
				If(armor is "SinGreenArmor"){armor.amount=100;armor.maxamount=100;armor.prot=75;}
				If(armor is "SinBlueArmor"){armor.amount=200;armor.maxamount=200;armor.prot=95;}
				//If(armor is "SinGreenArmor"){armor.amount=100;armor.maxamount=100;}
				//If(armor is "SinBlueArmor"){armor.amount=200;armor.maxamount=200;}
			}
			If(cvar.GetCVar('sintweaks_ammo').getbool()){
				If(ammo is "SinPistolAmmoNormal"){ammo.scandmg=sintweaks_damage_pistolnormal;}
				If(ammo is "SinPistolAmmoPower"){ammo.scandmg=sintweaks_damage_pistolpower;}
				If(ammo is "SinShellBuckshot"){ammo.scandmg=sintweaks_damage_buckshot;}
				If(ammo is "SinShellBirdshot"){ammo.scandmg=sintweaks_damage_birdshot;}
				If(ammo is "SinShellSlug"){ammo.scandmg=sintweaks_damage_slug;}
				If(ammo is "SinRifleAmmoNormal"){ammo.scandmg=sintweaks_damage_riflenormal;}
				If(ammo is "SinAncientAmmo"){ammo.scandmg=sintweaks_damage_ancient;}
			}
		}
		If(e.Thing is "SinGrenadeBase"){
			let proj = SinGrenadeBase(e.Thing);
			If(cvar.GetCVar('sintweaks_customfuse').getbool()){
				If(proj is "SinGrenadeThrown"){proj.fusemax=sintweaks_fusegrenade;}
				If(proj is "SinFlashBangThrown"){proj.fusemax=sintweaks_fuseflashbang;}
			}
		}
	}
	Override void WorldTick(){
		For(int i=0; i<MAXPLAYERS; i++){
			If(!playeringame[i] || !players[i].mo){Continue;}
			let invman = SinInvManager(players[i].mo.FindInventory("SinInvManager"));
			If(!invman){Return;}
			For(let i=0; i<invman.items.Size(); i++){
				let item = SinItem(invman.items[i]);
				let armor = SinArmor(invman.items[i]);
				let ammo = SinAmmo(invman.items[i]);
				If(cvar.GetCVar('sintweaks_stackablehealth').getbool()){
					If(item is "SinPotionGreen"){item.stack=1;item.maxamount=4;item.health=5;}
					If(item is "SinPotionRed"){item.stack=1;item.maxamount=4;}
					If(item is "SinPotionBlue"){item.stack=1;item.maxamount=4;}
					If(item is "SinPotionYellow"){item.stack=1;item.maxamount=4;}
					If(item is "SinStimpack"){item.stack=1;item.maxamount=4;}
					If(item is "SinMedikit"){item.stack=1;item.maxamount=4;}
					If(item is "SinBerserk"){item.stack=1;item.maxamount=4;}
				}
				If(cvar.GetCVar('sintweaks_stackablegrenades').getbool()){
					If(item is "SinGrenade"){item.stack=1;item.maxamount=4;}
					If(item is "SinProxMine"){item.stack=1;item.maxamount=4;}
					If(item is "SinFlashbang"){item.stack=1;item.maxamount=4;}
					If(item is "SinAcidRipper"){item.stack=1;item.maxamount=4;}
				}
				If(cvar.GetCVar('sintweaks_armor').getbool()){
					If(armor is "SinGreenArmor"){armor.maxamount=100;armor.prot=75;}
					If(armor is "SinBlueArmor"){armor.maxamount=200;armor.prot=95;}
					//If(armor is "SinGreenArmor"){armor.maxamount=100;}
					//If(armor is "SinBlueArmor"){armor.maxamount=200;}
				}
				If(cvar.GetCVar('sintweaks_ammo').getbool()){
					If(ammo is "SinPistolAmmoNormal"){ammo.scandmg=sintweaks_damage_pistolnormal;}
					If(ammo is "SinPistolAmmoPower"){ammo.scandmg=sintweaks_damage_pistolpower;}
					If(ammo is "SinShellBuckshot"){ammo.scandmg=sintweaks_damage_buckshot;}
					If(ammo is "SinShellBirdshot"){ammo.scandmg=sintweaks_damage_birdshot;}
					If(ammo is "SinShellSlug"){ammo.scandmg=sintweaks_damage_slug;}
					If(ammo is "SinRifleAmmoNormal"){ammo.scandmg=sintweaks_damage_riflenormal;}
					If(ammo is "SinAncientAmmo"){ammo.scandmg=sintweaks_damage_ancient;}
				}
			}
		}
	}
}
//	Doesn't work..
/*
Class SinTweaksWeaponStyleHandler : EventHandler{
	Override void WorldThingSpawned(WorldEvent e){
		If(e.Thing is "SinItem"){
			let item = SinItem(e.Thing);
			let armor = SinArmor(e.Thing);
			let weap = SinWeapon(e.Thing);
			let ammo = SinAmmo(e.Thing);
			If(sintweaks_weaponstyle == 1){
				If(ammo is "SinPistolAmmoNormal"){
					ammo.attacksound = "weapons/pistol";
					ammo.attacktype = 1;
					ammo.proj = "ZombieManTracer";
					ammo.casetype = "RifleCaseSpawn";
				}
			}
		}
	}
	Override void WorldTick(){
		For(int i=0; i<MAXPLAYERS; i++){
			If(!playeringame[i] || !players[i].mo){Continue;}
			let invman = SinInvManager(players[i].mo.FindInventory("SinInvManager"));
			If(!invman){Return;}
			For(let i=0; i<invman.items.Size(); i++){
				let item = SinItem(invman.items[i]);
				let armor = SinArmor(invman.items[i]);
				let weap = SinWeapon(invman.items[i]);
				let ammo = SinAmmo(invman.items[i]);
				If(sintweaks_weaponstyle == 1){
					If(ammo is "SinPistolAmmoNormal"){
						ammo.attacksound = "weapons/pistol";
						ammo.attacktype = 1;
						ammo.proj = "ZombieManTracer";
						ammo.casetype = "RifleCaseSpawn";
					}
				}
			}
		}
	}
}
*/

Class SinTweaksReplacementHandler : EventHandler{
	Override void CheckReplacement(ReplaceEvent e){
		If(e.Replacee is "Clip"){If(cvar.GetCVar('sintweaks_replaceammo').getbool())e.Replacement="HealthBonus";}
		If(e.Replacee is "Shell"){If(cvar.GetCVar('sintweaks_replaceammo').getbool())e.Replacement="ArmorBonus";}
		If(e.Replacee is "HealthBonus"){If(cvar.GetCVar('sintweaks_bluepotion').getbool()&&!random(0,3))e.Replacement="SinPotionBlue";}
		If(e.Replacee is "Stimpack"){If(cvar.GetCVar('sintweaks_bluepotion').getbool()&&!random(0,3))e.Replacement="SinPotionBlue";}
		If(e.Replacee is "Medikit"){If(cvar.GetCVar('sintweaks_bluepotion').getbool()&&!random(0,3))e.Replacement="SinPotionBlue";}
		If(e.Replacee is "Berserk"){If(cvar.GetCVar('sintweaks_bluepotion').getbool()&&!random(0,3))e.Replacement="SinPotionYellow";}
		If(e.Replacee is "BFG9000"){If(cvar.GetCVar('sintweaks_totem').getbool()&&!random(0,3))e.Replacement="SinTotem";}
		If(e.Replacee is "SinRocketLauncher"){If(cvar.GetCVar('sintweaks_rocketlauncher').getbool())e.Replacement="SinTweaksRocketLauncher";}
		If(e.Replacee is "Clip"){If(cvar.GetCVar('sintweaks_lesslethal').getbool()&&!random(0,3))e.Replacement="SinPistolAmmoRubber";}
		If(e.Replacee is "ClipBox"){If(cvar.GetCVar('sintweaks_lesslethal').getbool()&&!random(0,3))e.Replacement="SinPistolAmmoRubber";}
		If(e.Replacee is "Shell"){If(cvar.GetCVar('sintweaks_lesslethal').getbool()&&!random(0,3))e.Replacement="SinShellBeanBag";}
		If(e.Replacee is "Shell"){If(cvar.GetCVar('sintweaks_incendiary').getbool()&&!random(0,3))e.Replacement="SinShellIncendiary";}
		If(e.Replacee is "SinPistolAmmoNormal"){If(cvar.GetCVar('sintweaks_nolooseammo').getbool())e.Replacement="SinPistolBox";}
		If(e.Replacee is "SinShellBuckshot"){If(cvar.GetCVar('sintweaks_nolooseammo').getbool())e.Replacement="SinShellBox";}
		If(e.Replacee is "SinShellBirdshot"){If(cvar.GetCVar('sintweaks_nolooseammo').getbool())e.Replacement="SinShellBox";}
		If(e.Replacee is "SinShellSlug"){If(cvar.GetCVar('sintweaks_nolooseammo').getbool())e.Replacement="SinShellBox";}
		If(e.Replacee is "SinRifleAmmoNormal"){If(cvar.GetCVar('sintweaks_nolooseammo').getbool())e.Replacement="SinRifleBox";}
		If(e.Replacee is "SinPistolAmmoNormal"){If(cvar.GetCVar('sintweaks_onlypowerrounds').getbool())e.Replacement="SinPistolAmmoPower";}
		//	Thanks for this class checking method, Agent Ash.
		If (cvar.GetCVar('sintweaks_brutaldamage').getbool() && e.Replacee == "Rocket"){
			name clsname = "Rocket2";
			Class<Actor> cls = clsname;
			If (cls){e.Replacement = cls;}
		}
		If (cvar.GetCVar('sintweaks_brutaldamage').getbool() && e.Replacee == "SinRocket"){
			name clsname = "NuclearRocket";
			Class<Actor> cls = clsname;
			If (cls){e.Replacement = cls;}
		}
		//	So messy..
		//	I should just use `WorldThingSpawned()` to change the properties of these classes.
		//	..Nevermind. DamageType can't be changed in an Event Handler.
		If(e.Replacee is "SinPistolPuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinPistolPuff2";}
		If(e.Replacee is "SinBuckshotPuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinBuckshotPuff2";}
		If(e.Replacee is "SinBirdshotPuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinBirdshotPuff2";}
		If(e.Replacee is "SinBirdshotPuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinBirdshotPuff2";}
		If(e.Replacee is "SinSlugPuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinSlugPuff2";}
		If(e.Replacee is "SinRiflePuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinRiflePuff2";}
		If(e.Replacee is "SinAncientPuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinAncientPuff2";}
		If(e.Replacee is "SinPlasmaPuff"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinPlasmaPuff2";}
		If(e.Replacee is "SinGrenadeThrown"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinGrenadeThrownBrutal";}
		If(e.Replacee is "SinProxMineThrown"){If(cvar.GetCVar('sintweaks_brutaldamage').getbool())e.Replacement="SinProxMineThrownBrutal";}
	}
}

// (Thanks for this, Jarewill.)
Class SinTweaksLoadoutHandler : EventHandler{
	Override void PlayerEntered(PlayerEvent e){
		let invman = SinInvManager(players[e.PlayerNumber].mo.FindInventory("SinInvManager"));
		If(!invman){Return;}
		For(let i=0; i<invman.items.Size(); i++){
			let item = SinItem(invman.items[i]);
			If(cvar.GetCVar('sintweaks_rocketlauncher').getbool()){
				If(item is "SinRocketLauncher"){SwapSinItems("SinTweaksRocketLauncher",item,invman,i);}
			}
			let armor = BasicArmor(players[e.PlayerNumber].mo.FindInventory("BasicArmor"));
			If(cvar.GetCVar('sintweaks_armor').getbool()){
				//	Some error with item.prot.
				//If(armor.ArmorType=="SinGreenArmor"){armor.amount=100;armor.maxamount=100;item.prot=75;}
				//If(armor.ArmorType=="SinBlueArmor"){armor.amount=200;armor.maxamount=200;item.prot=95;}
				If(armor.ArmorType=="SinGreenArmor"){armor.amount=100;armor.maxamount=100;}
				If(armor.ArmorType=="SinBlueArmor"){armor.amount=200;armor.maxamount=200;}
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
