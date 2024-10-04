
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
