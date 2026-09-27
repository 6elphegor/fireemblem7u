	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_OnEnd
PrepItemScreen_OnEnd: @ 0x08091824
	push {lr}
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl PrepSetLatestCharId
	bl EndAllParallelWorkers
	bl EndSysHandCursor
	bl EndUiCursorHand
	movs r0, #0
	bl EndPrepItemScreenFace
	movs r0, #1
	bl EndPrepItemScreenFace
	bl EndMuralBackground_
	bl EndHelpPromptSprite
	bl EndMenuScrollBar
	bl EndSysBrownBox
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
