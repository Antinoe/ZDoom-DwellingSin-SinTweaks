
Class SinRecipeMedikitFromStimpackAndGreenPotion : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinStimpack", "SinPotionGreen";
		SinRecipe.Result "SinMedikit", 1;
	}
}
Class SinRecipeBerserk : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinMedikit", "SinPotionBlue";
		SinRecipe.Result "SinBerserk", 1;
	}
}

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

