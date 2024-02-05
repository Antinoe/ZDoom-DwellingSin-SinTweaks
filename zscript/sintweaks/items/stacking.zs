
//
//	Items
//

Class SinPotionGreen2 : SinPotionGreen{
	Default{
		Health 5;
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinPotionRed2 : SinPotionRed{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinPotionBlue2 : SinPotionBlue{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinStimpack2 : SinStimpack{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}
Class SinMedikit2 : SinMedikit{
	Default{
		SinItem.Stackable 1;
		Inventory.MaxAmount 4;
	}
}

//
//	Recipes
//

Class SinRecipeStimpack2 : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinPotionGreen2", "SinPotionGreen2";
		SinRecipe.Result "SinStimpack2", 1;
	}
}
Class SinRecipeMedikit2 : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinPotionGreen2", "SinPotionRed2";
		SinRecipe.Result "SinMedikit2", 1;
	}
}
Class SinRecipeMedikitFromStimpackAndGreenPotion2 : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinStimpack2", "SinPotionGreen2";
		SinRecipe.Result "SinMedikit2", 1;
	}
}
Class SinRecipeBerserk3 : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinMedikit2", "SinPotionBlue2";
		SinRecipe.Result "SinBerserk2", 1;
	}
}
