;Restock Seru Potions v1 2-10-20
function main()
{
    Actor["Haylise Madorus"]:DoTarget
        wait 5
    Actor["Haylise Madorus"]:DoubleClick
        wait 10

    declare PotionCount int script 0
    ;Will of Seru
    if ${Me.Inventory[exactname,"Will of Seru"].Quantity} == NULL
    {
        PotionCount:Set[0]
    }
    PotionCount:Set[${Math.Calc64[ 20 - ${Me.Inventory["Will of Seru"].Quantity}]}]
    if ${PotionCount}>0 
    {
        MerchantWindow.MerchantInventory["Will of Seru"]:Buy[${PotionCount}]    
    }
    wait 10
        
    ;Will of the Blinding
    if ${Me.Inventory[exactname,"Will of the Blinding"].Quantity} == NULL
        {
            PotionCount:Set[0]
        }
    
    PotionCount:Set[${Math.Calc64[ 20 - ${Me.Inventory["Will of the Blinding"].Quantity}]}]
    if ${PotionCount}>0 
    {
        MerchantWindow.MerchantInventory["Will of the Blinding"]:Buy[${PotionCount}]
    }
    
    wait 10
    
    ;Will of the Wracklands
    if ${Me.Inventory[exactname,"Will of the Wracklands"].Quantity} == NULL
        {
            PotionCount:Set[0]
        }
    
    PotionCount:Set[${Math.Calc64[ 20 - ${Me.Inventory["Will of the Wracklands"].Quantity}]}]
    if ${PotionCount}>0 
    {
        MerchantWindow.MerchantInventory["Will of the Wracklands"]:Buy[${PotionCount}]
    }
    
    wait 10
    
    ;Will of the Coast
    if ${Me.Inventory[exactname,"Will of the Coast"].Quantity} == NULL
        {
            PotionCount:Set[0]
        }
    
    PotionCount:Set[${Math.Calc64[ 20 - ${Me.Inventory["Will of the Coast"].Quantity}]}]
    if ${PotionCount}>0 
    {
        MerchantWindow.MerchantInventory["Will of the Coast"]:Buy[${PotionCount}]
    }
    
    wait 10
    eq2ex close_top_window
}