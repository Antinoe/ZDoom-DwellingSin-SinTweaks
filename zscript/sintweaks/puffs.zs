
//
//	Brutal Replacements
//
Class SinPistolPuff2 : SinPistolPuff{
	Default{
		Damagetype "Pistol";
	}
}
Class SinBuckshotPuff2 : SinBuckshotPuff{
	Default{
		Damagetype "Shotgun";
	}
}
Class SinBirdshotPuff2 : SinBirdshotPuff{
	Default{
		Damagetype "Shotgun";
	}
}
Class SinSlugPuff2 : SinSlugPuff{
	Default{
		Damagetype "Shotgun";
	}
}
Class SinRiflePuff2 : SinRiflePuff{
	Default{
		Damagetype "Rifle";
	}
}
Class SinAncientPuff2 : SinAncientPuff{
	Default{
		Damagetype "Rifle";
	}
}
Class SinPlasmaPuff2 : SinPlasmaPuff{
	Default{
		Damagetype "Plasma";
	}
}

Class SinGrenadeThrownBrutal : SinGrenadeThrown{
	States{
	Explode:
		TNT1 A 0 {A_SpawnItemEx("Rocket",0,0,0,0,0,-10,0);}
		Stop;
	}
}
Class SinProxMineThrownBrutal : SinProxMineThrown{
	States{
	Explode:
		TNT1 A 0 {A_SpawnItemEx("Rocket",0,0,0,0,0,-10,0);}
		Stop;
	}
}

//
//	Custom
//
Class SinIncendiaryPuff : SinBulletPuff{
	Default{
		Decal "SinSlugChip";
		Damagetype "Fire";
	}
}
Class SinBeanBagPuff : SinBulletPuff{
	Default{
		Decal "SinBirdshotChip";
		Damagetype "Kick";
	}
}
Class SinRubberPuff : SinBulletPuff{
	Default{
		Decal "SinPistolChip";
		Damagetype "Head";
	}
}
Class SinIcePuff : SinBulletPuff{
	Default{
		Decal "SinPistolChip";
		Damagetype "Ice";
	}
}
