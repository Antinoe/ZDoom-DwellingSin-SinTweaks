
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
