;v1 By thg v2
;Assassin Chain Script 

;1. Shadow Agent 
;2.Assassinate
;3. In Plain Sight
;4..Assassinate
;5. Ambush
;6. Eviscerate
;7. Jugular Slice
;8. Mortal Coil
;9. Massacre
;10. Stealth Assault
;11. Ambush
;11. Fatal Followup

variable index:string Abilities
variable index:string AbilityIDs
variable index:string AbilityTargets
variable int cnt=0
variable int breakcnt=0
function main()
{
	
	echo Chain starting at ${Time}
	
	OgreBotAPI:ChangeOgreBotUIOption[${Me.Name},checkbox_settings_disablecaststack,TRUE,FALSE]
	
	do
	{
	waitframe
	}
	while !${Me.Ability[id,3633058267].IsReady}
		
		
	
	

	
		Abilities:Insert["Shadow Agent"]
		AbilityIDs:Insert[2877761813]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Assassinate VI"]
		AbilityIDs:Insert[614237922]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["In plain Sight"]
		AbilityIDs:Insert[3633058267]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Assassinate VI"]
		AbilityIDs:Insert[614237922]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Ambush VIII"]
		AbilityIDs:Insert[2192527796]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Eviscerate IX"]
		AbilityIDs:Insert[3797549137]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Jugular Slice VIII"]
		AbilityIDs:Insert[1721672450]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Mortal blade VIII"]
		AbilityIDs:Insert[1325061991]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Massacre VIII"]
		AbilityIDs:Insert[2985095407]
		AbilityTargets:Insert[0]
		
		Abilities:Insert["Stealth Assault VIII"]
		AbilityIDs:Insert[3642337090]
		AbilityTargets:Insert[0]
		
		;Abilities:Insert["Ambush VIII"]
		;AbilityIDs:Insert[2192527796]
		;AbilityTargets:Insert[0]		
		
		Abilities:Insert["Fatal Followup IV"]
		AbilityIDs:Insert[3867126783]
		AbilityTargets:Insert[0]

		
		;Abilities:Insert[""]
		;AbilityIDs:Insert[]
		;AbilityTargets:Insert[]
	
	for(cnt:Set[1];${cnt}<=${Abilities.Used};cnt:Inc)
	{
		while ( ${Me.Ability[id,${AbilityIDs.Get[${cnt}]}].IsReady} || ${Me.Ability[id,${AbilityIDs.Get[${cnt}]}].TimeUntilReady}<1 ) && ${breakcnt:Inc}<15
		{
			call CastCall ${AbilityIDs.Get[${cnt}]} "${Abilities.Get[${cnt}]}" ${AbilityTargets.Get[${cnt}]}
			wait 850 !${Me.CastingSpell}
			wait 3
		}
	}
	echo Chain Ending at ${Time}
	
	OgreBotAPI:ChangeOgreBotUIOption[${Me.Name},checkbox_settings_disablecaststack,FALSE,FALSE]
}



function CastCall(string CastID, string CastName, string CastTarget=0)
{
	variable int GiveUpCnt=0
	do
	{
		if !${Me.CastingSpell}
		{
			if ${CastTarget.NotEqual[0]}
				eq2execute useabilityonplayer ${Actor[id,${CastTarget}].Name} ${CastID}
			else
				Me.Ability[id,${CastID}]:Use
			eq2execute clearabilityqueue
		}
		wait 2 ${Me.CastingSpell} || !${Me.Ability[id,${CastID}].IsReady} || ( ${Me.CastingSpell} && ${Me.GetGameData[Spells.Casting].Label.Equal[${CastName}]} )

		if ${Me.CastingSpell} && ${Me.GetGameData[Spells.Casting].Label.Equal["${CastName}"]}
			break
		waitframe
	}
	while ${Me.Ability[id,${CastID}].TimeUntilReady}<1 && ${GiveUpCnt:Inc}<=2
}

function atexit()
{
	OgreBotAPI:ChangeOgreBotUIOption[${Me.Name},checkbox_settings_disablecaststack,FALSE,FALSE]
}