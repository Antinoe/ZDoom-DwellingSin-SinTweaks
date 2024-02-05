
Class SinGreenArmor2 : SinGreenArmor{
	Default{
		Inventory.Amount 100;
		Inventory.MaxAmount 100;
		SinArmor.Protection 75;
		//Damagefactor "Normal", 0.01;
	}
	States{Spawn: ARM1 A -1; Stop;}
}
Class SinBlueArmor2 : SinBlueArmor{
	Default{
		Inventory.Amount 200;
		Inventory.MaxAmount 200;
		SinArmor.Protection 95;
	}
}
