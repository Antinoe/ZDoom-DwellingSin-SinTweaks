
Class SinPotionBlue : SinConsumable{
	Default{
		Inventory.Icon "POT3A0";
		Tag "Blue Potion";
		Inventory.PickupMessage "$SINITEM_POTIONRPKUP";
		SinItem.Description "$SINITEM_POTIONRDESC";
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: POT3 A -1; Stop;}
	Override bool Use(bool pickup){
		If(owner&&Amount>0){
			let playe = SinPlayer(owner);
			owner.GiveInventory("SinPowerPotionBlue",1);
			Amount--;
			If(Amount<1&&delempty){
				let invman = SinInvManager(owner.FindInventory("SinInvManager"));
				int index = invman.items.Find(self);
				If(index!=invman.items.Size()){
					invman.DeleteFrom(index);
					Destroy();
				}
			}
			Return 1;
		}
		Return Super.Use(pickup);
		Return 0;
	}
}

Class SinPowerPotionBlue : PowerProtection
{
	Default
	{
		+INVENTORY.ADDITIVETIME;
		Powerup.Duration -360;
		DamageFactor "Normal", 0.25;
		Inventory.Icon "POT3A0";
	}
}

Class SinBerserk2 : SinBerserk{
	Default{
		Health 100;
		SinHealing.BonusHealth 150;
		Inventory.PickupMessage "Picked up a trauma pack.";
		SinItem.Description "[+150 HP]\n[-50% DMG]\nUAC's special set of combat drugs that will put you back into combat quick and better than ever at that.";
	}
	Override bool Use(bool pickup){
		//	Copy-Pasted from the SinHealing class.
		let playe = SinPlayer(owner);
		If(playe&&playe.health<playe.maxhealth){
			owner.GiveInventory("PowerBerserkProtection",1);
			//owner.GiveInventory("PowerBerserkSpeed");
		}
		Return Super.Use(pickup);
		Return 0;
	}
}
Class PowerBerserkProtection : PowerProtection{
	Default
	{
		+INVENTORY.ADDITIVETIME;
		Powerup.Duration -360;
		DamageFactor "Normal", 0.25;
		Inventory.Icon "PSTRA0";
	}
}

Class SinTotem : SinConsumable{
	Default{
		Inventory.Icon "ROCKA0";
		Tag "Mysterious Totem";
		Inventory.PickupMessage "Picked up an odd totem.";
		SinItem.Description "What in the world is this?";
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: ROCK A -1; Stop;}
	Override bool Use(bool pickup){
		If(owner&&Amount>0){
			let playe = SinPlayer(owner);
			owner.GiveInventory("SinPowerTotem",1);
			Amount--;
			If(Amount<1&&delempty){
				let invman = SinInvManager(owner.FindInventory("SinInvManager"));
				int index = invman.items.Find(self);
				If(index!=invman.items.Size()){
					invman.DeleteFrom(index);
					Destroy();
				}
			}
			Return 1;
		}
		Return Super.Use(pickup);
		Return 0;
	}
}
Class SinPowerTotem : PowerBuddha{
	Default
	{
		+INVENTORY.ADDITIVETIME;
		Powerup.Duration -120;
		Inventory.Icon "ROCKA0";
	}
}

