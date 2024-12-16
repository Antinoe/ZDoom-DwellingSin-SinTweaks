
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
