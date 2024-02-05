
Class SinRecipeMedikitFromStimpackAndGreenPotion : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinStimpack", "SinPotionGreen";
		SinRecipe.Result "SinMedikit", 1;
	}
}
Class SinRecipeBerserk2 : SinRecipe{
	Default{
		SinRecipe.Ingredients "SinMedikit", "SinPotionBlue";
		SinRecipe.Result "SinBerserk2", 1;
	}
}
