
//	Can't get it to work consistently, oddly enough.
//	I don't want to mess around with TEXTURES right now either.
/*
Class SinPlasmaRifleHeatsink2  : SinPlasmaRifleHeatsink replaces SinPlasmaRifleHeatsink{
	Default{
		SinAttachment.AmmoCost -2;
	}
}
*/

/*
Class SinGrenadeLauncher : SinWeapon{
	Default{
		Inventory.Icon "M79PA0";
		Tag "$SINWEAP_ROCKET";
		Inventory.Amount 1;
		Inventory.MaxAmount 1;
		Inventory.PickupMessage "$SINWEAP_ROCKETPKUP";
		SinItem.Description "$SINWEAP_ROCKETDESC";
		SinWeapon.AmmoType "Rocket";
		SinWeapon.AmmoLoaded "SinRocketNormal";
		SinWeapon.FireType FIRE_THROWN;
		SinWeapon.ReloadType RELOAD_BOTTOM;
		SinWeapon.AttackType ATTACK_PROJECTILE;
		SinWeapon.Charge 30;
		SinWeapon.Noise 256;
		SinWeapon.Recoil 12;
		SinWeapon.FireMode1 1,7;
		SinItem.BigItem 1;
	}
	States{Spawn: M79P A -1; Stop;}
	Override void HandleSprite(int status){cursprite=spawnstate.sprite;}
}
*/
Class SinTweaksRocketLauncher : SinWeapon{
	Default{
		Inventory.Icon "LAUNA0";
		Tag "$SINWEAP_ROCKET";
		Inventory.Amount 1;
		Inventory.MaxAmount 1;
		Inventory.PickupMessage "$SINWEAP_ROCKETPKUP";
		SinItem.Description "$SINWEAP_ROCKETDESC";
		SinWeapon.AmmoType "Rocket";
		SinWeapon.AmmoLoaded "SinRocketNormal";
		SinWeapon.FireType FIRE_AUTO;
		SinWeapon.ReloadType RELOAD_BOTTOM;
		SinWeapon.AttackType ATTACK_PROJECTILE;
		SinWeapon.Noise 256;
		SinWeapon.Recoil 12;
		SinWeapon.FireMode1 1,7;
		SinItem.BigItem 1;
	}
	States{Spawn: LAUN A -1; Stop;}
	Override void HandleSprite(int status){cursprite=spawnstate.sprite;}
}
