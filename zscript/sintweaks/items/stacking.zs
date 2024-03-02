
//
//	Items
//
Class SinPotionGreenStackable : SinPotionGreen{
	Default{
		Health 5;
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinPotionRedStackable : SinPotionRed{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinPotionBlueStackable : SinPotionBlue{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinPotionYellowStackable : SinPotionYellow{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinStimpackStackable : SinStimpack{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinMedikitStackable : SinMedikit{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinBerserkStackable : SinBerserk{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}

//
//	Recipes
//
Class SinRecipeStimpackStackable : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinPotionGreenStackable", "SinPotionGreenStackable";
		SinRecipe.Result "SinStimpackStackable", 1;
	}
}
Class SinRecipeMedikitStackable : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinPotionGreenStackable", "SinPotionRedStackable";
		SinRecipe.Result "SinMedikitStackable", 1;
	}
}
Class SinRecipeMedikitFromStimpackAndGreenPotionStackable : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinStimpackStackable", "SinPotionGreenStackable";
		SinRecipe.Result "SinMedikitStackable", 1;
	}
}
Class SinRecipeBerserkStackable : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinMedikitStackable", "SinPotionBlueStackable";
		SinRecipe.Result "SinBerserkStackable", 1;
	}
}

//
//	Weapons
//
Class SinGrenadeStackable : SinGrenade{
	Default{
		Inventory.Amount 1;
		Inventory.MaxAmount 3;
	}
}
Class SinFlashbangStackable : SinFlashbang{
	Default{
		Inventory.Amount 1;
		Inventory.MaxAmount 3;
	}
}
Class SinProxMineStackable : SinProxMine{
	Default{
		Inventory.Amount 1;
		Inventory.MaxAmount 3;
	}
}
Class SinAcidRipperStackable : SinAcidRipper{
	Default{
		Inventory.Amount 1;
		Inventory.MaxAmount 3;
	}
}
