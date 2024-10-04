
//	JAREWILL'S EXAMPLE
/*
If(invman.items.Size() > x){ //Only execute this code if the item exists
let item = invman.items[x]; //Will get the pointer to the specified item, for example if x is 0, then it's the first item
If(item is "SinWeapon"){ //Execute this code if the item is a weapon
  If(invman.equipped == x){invman.equipped = -1;} //If the item is equipped, unequip it
  Else{invman.equipped = x;} //Otherwise equip it
	}
}
*/
//	REFERENCE ONLY
/*
If(e.Name=="Equip"){
	let item = SinItem(invman.items[e.Args[0]]);
	If(item is "SinWeapon"&&!playe.noswitch){
		If(invman.equipped!=-1){
			let prevweap = SinWeapon(invman.items[invman.equipped]);
			If(prevweap){prevweap.railmode=0; prevweap.HandleSprite();}
		}
		invman.equipped=e.Args[0];
		SinWeapon(item).OnEquip(playe,SinHands(playe.FindInventory("SinHands")));
	}
}
If(e.Name=="Unequip"){
	If(!playe.noswitch&&invman.equipped!=-1){
		let weap = SinWeapon(invman.items[invman.equipped]);
		If(weap){weap.railmode=0; weap.HandleSprite();}
		invman.equipped=-1;
		weap.OnUnequip(playe,SinHands(playe.FindInventory("SinHands")));
	}
}
*/
Class SinTweaksHotkeyHandler : EventHandler{
	Override bool InputProcess(InputEvent e){
		//	Might not need this For statement, nor the variables following it.
		For(int i=0; i<MAXPLAYERS; i++){
			If(!playeringame[i] || !players[i].mo){Continue;}
			let invman = SinInvManager(players[i].mo.FindInventory("SinInvManager"));
			If(!invman){Return 0;}
			let item = SinItem(invman.items[0]);
			If(e.Type != InputEvent.Type_KeyDown){Return 0;}
			If(bindings.GetBinding(e.KeyScan) ~== "slot 1"){
				EventHandler.SendNetworkEvent("Equip",0);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 2"){
				EventHandler.SendNetworkEvent("Equip",1);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 3"){
				EventHandler.SendNetworkEvent("Equip",2);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 4"){
				EventHandler.SendNetworkEvent("Equip",3);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 5"){
				EventHandler.SendNetworkEvent("Equip",4);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 6"){
				EventHandler.SendNetworkEvent("Equip",5);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 7"){
				EventHandler.SendNetworkEvent("Equip",6);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 8"){
				EventHandler.SendNetworkEvent("Equip",7);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 9"){
				EventHandler.SendNetworkEvent("Equip",8);
				Return 1;
			}
			Else If(bindings.GetBinding(e.KeyScan) ~== "slot 0"){
				EventHandler.SendNetworkEvent("Equip",9);
				Return 1;
			}
		}
		Return Super.InputProcess(e);
	}
}
