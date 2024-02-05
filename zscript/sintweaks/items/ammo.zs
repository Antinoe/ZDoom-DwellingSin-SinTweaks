
Class SinPistolAmmoRubber : SinAmmo{
	Default{
		Inventory.Icon "PBULA0";
		Tag "10mm Rubber Rounds";
		Inventory.Amount 10;
		Inventory.MaxAmount 10;
		Inventory.PickupMessage "Picked up rubber rounds.";
		SinItem.Description "Pistol rounds with non-lethal rubber heads.";
		SinAmmo.AmmoType "Pistol";
		SinAmmo.TypeName "RUBB";
		SinAmmo.HitscanPuff "SinRubberPuff";
		SinAmmo.AttackType ATTACK_HITSCAN;
		SinAmmo.HitscanDamage 1;
		SinAmmo.Spread 1.5,1.5;
		SinAmmo.Climb 0.4,0.4;
		SinAmmo.Noise 4096;
		SinAmmo.Casing "SinCasingPistol";
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: PBUL A -1; Stop;}
	Override void HandleSprite(int status){
		int fram = Amount;
		If(Amount>=10){fram=0;}
		frame=fram;
	}
}
Class SinPistolAmmoIce : SinAmmo{
	Default{
		Inventory.Icon "PBULA0";
		Tag "10mm Nitrogen Rounds";
		Inventory.Amount 10;
		Inventory.MaxAmount 10;
		Inventory.PickupMessage "Picked up nitrogen rounds.";
		SinItem.Description "Pistol rounds with compressed liquid nitrogen packed inside.";
		SinAmmo.AmmoType "Pistol";
		SinAmmo.TypeName "ICE";
		SinAmmo.HitscanPuff "SinIcePuff";
		SinAmmo.AttackType ATTACK_HITSCAN;
		SinAmmo.HitscanDamage 100;
		SinAmmo.Spread 1.5,1.5;
		SinAmmo.Climb 0.4,0.4;
		SinAmmo.Noise 4096;
		SinAmmo.Casing "SinCasingPistol";
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: PBUL A -1; Stop;}
	Override void HandleSprite(int status){
		int fram = Amount;
		If(Amount>=10){fram=0;}
		frame=fram;
	}
}
Class SinShellIncendiary : SinAmmo{
	Default{
		Inventory.Icon "SHELA0";
		Tag "Incendiary Shells";
		Inventory.Amount 4;
		Inventory.MaxAmount 4;
		Inventory.PickupMessage "Picked up some incendiary shells.";
		SinItem.Description "These will light targets aflame.";
		SinAmmo.AmmoType "Shotgun";
		SinAmmo.TypeName "INCEN";
		SinAmmo.HitscanPuff "SinIncendiaryPuff";
		SinAmmo.AttackType ATTACK_HITSCAN;
		SinAmmo.HitscanDamage 16;
		SinAmmo.Multishot 8;
		SinAmmo.Spread 4,4;
		SinAmmo.Climb 3,3;
		SinAmmo.Noise 8192;
		SinAmmo.Casing "SinCasingShellBuckshot";
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: SHEL A -1; Stop;}
	Override void HandleSprite(int status){
		int fram = 4-Amount;
		frame=fram;
	}
}
Class SinShellBeanBag : SinAmmo{
	Default{
		Inventory.Icon "SHENA0";
		Tag "Bean Bag Shells";
		Inventory.Amount 4;
		Inventory.MaxAmount 4;
		Inventory.PickupMessage "Picked up Bean Bag Shells.";
		SinItem.Description "Shells that contain non-lethal Bean Bags filled with rubber balls.";
		SinAmmo.AmmoType "Shotgun";
		SinAmmo.TypeName "BATON";
		SinAmmo.HitscanPuff "SinBeanBagPuff";
		SinAmmo.AttackType ATTACK_HITSCAN;
		SinAmmo.HitscanDamage 1;
		SinAmmo.Multishot 1;
		SinAmmo.Spread 1,1;
		SinAmmo.Climb 3,3;
		SinAmmo.Noise 8192;
		SinAmmo.Casing "SinCasingShellSlug";
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: SHEN A -1; Stop;}
	Override void HandleSprite(int status){
		int fram = 4-Amount;
		frame=fram;
	}
}
/*
Class SinExplosiveNormal : SinAmmo{
	Default{
		Inventory.Icon "ROCKA0";
		Tag "Rocket Ammo";
		Inventory.Amount 4;
		Inventory.MaxAmount 4;
		Inventory.PickupMessage "Picked up some Rockets.";
		SinItem.Description "Standard rocket.";
		SinAmmo.Projectile "SinGrenadeThrown";
		SinAmmo.AmmoType "Rocket";
		SinAmmo.TypeName "ROCK";
		SinAmmo.AttackType ATTACK_PROJECTILE;
		SinAmmo.Multishot 1;
		SinAmmo.Spread 1,1;
		SinAmmo.Climb 3,3;
		SinAmmo.Noise 8192;
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: ROCK A -1; Stop;}
}
*/
Class SinRocketNormal : SinAmmo{
	Default{
		Inventory.Icon "ROCKA0";
		Tag "Rocket Ammo";
		Inventory.Amount 4;
		Inventory.MaxAmount 4;
		Inventory.PickupMessage "Picked up some Rockets.";
		SinItem.Description "Standard rocket.";
		SinAmmo.Projectile "Rocket";
		SinAmmo.AmmoType "Rocket";
		SinAmmo.TypeName "ROCK";
		SinAmmo.AttackType ATTACK_PROJECTILE;
		SinAmmo.Multishot 1;
		SinAmmo.Spread 1,1;
		SinAmmo.Climb 3,3;
		SinAmmo.Noise 8192;
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: ROCK A -1; Stop;}
}
Class SinRocketBox : SinAmmoBox{
	Default{
		Inventory.Icon "BROKA0";
		Tag "Rocket Crate";
		Inventory.Amount 50;
		Inventory.MaxAmount 50;
		Inventory.PickupMessage "Picked up a Rocket Crate.";
		SinItem.Description "A crate filled with Normal Rockets.";
		SinAmmoBox.AmmoType "Rocket";
		SinAmmoBox.LoadedAmmo "SinRocketNormal";
		SinItem.BigItem 1;
	}
	States{Spawn: BROK A -1; Stop;}
}
